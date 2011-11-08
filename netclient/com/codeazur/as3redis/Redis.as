package com.codeazur.as3redis
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.ProgressEvent;
	import flash.net.Socket;
	import flash.utils.ByteArray;
	
	import com.codeazur.as3redis.commands.*;

	public class Redis extends EventDispatcher
	{
		protected var socket:Socket;
		protected var idleQueue:Vector.<RedisCommand>;
		protected var activeQueue:Vector.<RedisCommand>;
		protected var buffer:ByteArray;
		protected var connecting:Boolean = false;
		protected var connectResultHandler:Function;
		
		protected var _host:String;
		protected var _port:int;
		protected var _password:String;
		
		public function Redis(host:String = "127.0.0.1", port:int = 6379)
		{
			_host = host;
			_port = port;
			socket = new Socket();
			socket.addEventListener(Event.CONNECT, connectHandler);
			socket.addEventListener(ProgressEvent.SOCKET_DATA, dataHandler);
			idleQueue = new Vector.<RedisCommand>();
			activeQueue = new Vector.<RedisCommand>();
			buffer = new ByteArray();
		}

		public function get connected():Boolean { return socket.connected; }
		
		public function connect(host:String = "127.0.0.1", port:int = 6379):void {
			connectInternal(host, port);
		}
		
		public function flush():void {
			executePendingCommands();
			for (var i:uint = 0; i < idleQueue.length; i++ ) {
				executeCommand(idleQueue[i], false);
			}
			if (connected) {
				socket.flush();
			}
			idleQueue.length = 0;
		}
		
		
		public function sendPING():RedisCommand {
			return addCommand(new PING());
		}
		
		public function sendECHO(text:String):RedisCommand {
			return addCommand(new ECHO(text));
		}
		
		public function sendINFO():RedisCommand {
			return addCommand(new INFO());
		}
		
		public function sendSET(key:String, value:*):RedisCommand {
			return addCommand(new SET(key, value));
		}
		
		public function sendSETNX(key:String, value:*):RedisCommand {
			return addCommand(new SETNX(key, value));
		}
		
		public function sendGET(key:String):RedisCommand {
			return addCommand(new GET(key));
		}
		
		public function sendGETSET(key:String, value:*):RedisCommand {
			return addCommand(new GETSET(key, value));
		}
		
		public function sendDEL(key:String):RedisCommand {
			return addCommand(new DEL(key));
		}
		
		public function sendINCR(key:String):RedisCommand {
			return addCommand(new INCR(key));
		}
		
		public function sendINCRBY(key:String, value:uint):RedisCommand {
			return addCommand(new INCRBY(key, value));
		}
		
		public function sendDECR(key:String):RedisCommand {
			return addCommand(new DECR(key));
		}
		
		public function sendDECRBY(key:String, value:uint):RedisCommand {
			return addCommand(new DECRBY(key, value));
		}
		
		public function sendEXISTS(key:String):RedisCommand {
			return addCommand(new EXISTS(key));
		}

		public function sendTYPE(key:String):RedisCommand {
			return addCommand(new TYPE(key));
		}

		public function sendMGET(keys:Array):RedisCommand {
			return addCommand(new MGET(keys));
		}

		
		protected function addCommand(command:RedisCommand, defer:Boolean = false):RedisCommand {
			if (!defer) {
				executeCommand(command);
			} else {
				idleQueue.push(command);
			}
			return command;
		}
		
		protected function executeCommand(command:RedisCommand, flush:Boolean = true):void {
			if (activeQueue.indexOf(command) == -1) {
				activeQueue.push(command);
			}
			if (!connected) {
				command.setStatus(RedisCommand.STATUS_PENDING);
				if (!connecting) {
					connectInternal(_host, _port, executePendingCommands);
				}
			} else {
				trace("sending: " + command);
				command.setStatus(RedisCommand.STATUS_ACTIVE);
				socket.writeBytes(command.request);
				if (flush) {
					socket.flush();
				}
			}
		}

		protected function executePendingCommands():void {
			for (var i:uint = 0; i < activeQueue.length; i++) {
				if (activeQueue[i].status == RedisCommand.STATUS_PENDING) {
					executeCommand(activeQueue[i]);
				}
			}
		}
		
		protected function connectInternal(host:String, port:int, resultHandler:Function = null):void {
			_host = host;
			_port = port;
			connecting = true;
			connectResultHandler = resultHandler;
			socket.connect(host, port);
		}

		protected function connectHandler(e:Event):void {
			trace("connected");
			dispatchEvent(e.clone());
			if (connectResultHandler != null) {
				connectResultHandler();
			}
		}
		
		protected function dataHandler(e:ProgressEvent):void {
			// trace("received " + socket.bytesAvailable + " bytes");
			// Read all available bytes from the socket and append them to the buffer
			socket.readBytes(buffer, buffer.length, socket.bytesAvailable);
			// Parse buffer from the start
			buffer.position = 0;
			var commandProcessed:Boolean = true;
			while (commandProcessed && buffer.length - buffer.position >= 3) {
				var pos:uint = buffer.position;
				// Find the next CR/LF pair starting from the current position
				var i:int = findCRLF(buffer, buffer.position);
				if (i > 0) {
					// We found a CR/LF, and there is data available to parse
					// Find the first active command in the queue
					var curCommandIdx:int = getFirstActiveCommandIdx();
					if (curCommandIdx >= 0) {
						var len:int;
						var command:RedisCommand = activeQueue[curCommandIdx];
						// The first byte of a redis response is always the type indicator
						var type:String = String.fromCharCode(buffer.readUnsignedByte());
						// Followed by the rest, which is interpreted as a string
						var head:String = buffer.readUTFBytes(i - buffer.position);
						// Followed the CR/LF we found above
						buffer.position += 2; // skip crlf
						// So let's see what we're dealing with:
						switch(type) {
							case "-":
								// This is an error message
								command.setResponseType(RedisCommand.RESPONSE_TYPE_ERROR);
								command.setResponseMessage(head);
								command.fault();
								break;
							case "+":
								// This is a single line reply
								command.setResponseType(RedisCommand.RESPONSE_TYPE_STRING);
								command.setResponseMessage(head);
								command.result();
								break;
							case ":":
								// This is an integer number
								command.setResponseType(RedisCommand.RESPONSE_TYPE_INTEGER);
								command.setResponseMessage(head);
								command.result();
								break;
							case "$":
								// This is bulk data
								// Get the size of the data block
								len = parseInt(head);
								if (len >= 0) {
									// Check if the entire data block is loaded already
									if (buffer.length - buffer.position - len - 2 >= 0) {
										// Yes it is, so parse and save it
										command.addBulkResponse(parseBulk(len));
										command.setResponseType(RedisCommand.RESPONSE_TYPE_BULK);
										command.result();
									} else {
										// No, we need to wait for more data
										// Set the position back to the beginning of the current response
										buffer.position = pos;
										commandProcessed = false;
									}
								} else {
									// Length can be -1 (no data available, non-existant key etc)
									command.setResponseType(RedisCommand.RESPONSE_TYPE_BULK);
									command.setResponseMessage(head);
									command.result();
								}
								break;
							case "*":
								// TODO:
								// This is multi bulk data
								var count:int = parseInt(head);
								if(count > 0) {
									for (var j:uint = 0; j < count; j++) {
										var nextcrlf:int = findCRLF(buffer, buffer.position);
										if (nextcrlf >= 0) {
											if (nextcrlf - buffer.position > 1) {
												// The first byte of a redis response is always the type indicator
												type = String.fromCharCode(buffer.readUnsignedByte());
												// Followed by the rest, which is interpreted as a string
												head = buffer.readUTFBytes(nextcrlf - buffer.position);
												// Followed the CR/LF we found above
												buffer.position += 2; // skip crlf
												if (type == "$") {
													len = parseInt(head);
													if (len >= 0) {
														// Check if the entire data block is loaded already
														if (buffer.length - buffer.position - len - 2 >= 0) {
															// Yes it is, so parse and save it
															command.addBulkResponse(parseBulk(len));
														} else {
															// No, we need to wait for more data
															// Set the position back to the beginning of the current response
															buffer.position = pos;
															commandProcessed = false;
															break;
														}
													} else {
														// Length can be -1 (no data available, non-existant key etc)
														command.addBulkResponse(null);
													}
												}
											} else {
												throw(new Error("Empty header."));
											}
										} else {
											buffer.position = pos;
											commandProcessed = false;
											break;
										}
									}
								}
								if (commandProcessed) {
									command.setResponseType(RedisCommand.RESPONSE_TYPE_BULK_MULTI);
									command.result();
								}
								break;
							default:
								throw(new Error("Illegal header type '" + type + "'."));
						}
						if (commandProcessed) {
							// Remove the command whose reply we just processed from the queue
							activeQueue.splice(curCommandIdx, 1);
						}
					} else {
						throw(new Error("No active commands found."));
					}
				} else if (i == 0) {
					throw(new Error("Empty header."));
				}
			}
			// Truncate the buffer, cut off the bytes we processed
			if (buffer.position < buffer.length) {
				var ba:ByteArray = new ByteArray();
				ba.writeBytes(buffer, buffer.position, buffer.length - buffer.position);
				buffer = ba;
			} else {
				// The whole buffer has been processed
				buffer.length = 0;
			}
		}
		
		protected function parseBulk(len:int):ByteArray {
			// Process the bulk data body
			var ba:ByteArray = new ByteArray();
			// Copy [len] bytes
			if (len > 0) {
				buffer.readBytes(ba, 0, len);
				ba.position = 0;
			}
			// The data should be immediately followed by CR/LF
			var idx:int = findCRLF(buffer, buffer.position);
			if (idx >= 0) {
				if (idx > buffer.position) {
					// There's extra data, [len] bytes are not immediately followed by CR/LF
					trace("Warning: skipped " + (idx - buffer.position) + " bytes after bulk data");
				}
				// Skip to after CR/LF (start of next reply)
				buffer.position = idx + 2;
			}
			return ba;
		}
		
		protected function findCRLF(ba:ByteArray, startAtIndex:uint = 0):int {
			for (var i:uint = startAtIndex; i < ba.length - 1; i++) {
				if (ba[i] == 0x0d && ba[i + 1] == 0x0a) {
					return i;
				}
			}
			return -1;
		}
		
		protected function getFirstActiveCommandIdx():int {
			for (var i:uint = 0; i < activeQueue.length; i++) {
				if (activeQueue[i].status == RedisCommand.STATUS_ACTIVE) {
					return i;
				}
			}
			return -1;
		}
	}
}
