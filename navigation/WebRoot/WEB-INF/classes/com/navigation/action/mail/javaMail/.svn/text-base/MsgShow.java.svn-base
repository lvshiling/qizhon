/*
 * Copyright (c) 1997-2010 Oracle and/or its affiliates. All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 *   - Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 *
 *   - Redistributions in binary form must reproduce the above copyright
 *     notice, this list of conditions and the following disclaimer in the
 *     documentation and/or other materials provided with the distribution.
 *
 *   - Neither the name of Oracle nor the names of its
 *     contributors may be used to endorse or promote products derived
 *     from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
 * IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
package com.navigation.action.mail.javaMail;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.security.Security;
import java.util.Date;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.FetchProfile;
import javax.mail.Flags;
import javax.mail.Folder;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Part;
import javax.mail.Session;
import javax.mail.Store;
import javax.mail.URLName;
import javax.mail.event.StoreEvent;
import javax.mail.event.StoreListener;
import javax.mail.internet.ContentType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.ParseException;

import com.navigation.utils.DateUtils;

/*
 * Demo app that exercises the Message interfaces. Show information about and
 * contents of messages.
 * 
 * @author John Mani @author Bill Shannon
 */

public class MsgShow {

	static String protocol;
	static String host = null;
	static String user = null;
	static String password = null;
	static String mbox = null;
	static String url = null;
	static int port = -1;
	static boolean verbose = false;
	static boolean debug = false;
	static boolean showStructure = true;
	static boolean showMessage = false;
	static boolean showAlert = true;
	static boolean saveAttachments = false;
	static int attnum = 1;
	private static boolean showDetail = false;	//是否显示每条信息

	public static void main(String argv[]) {
		String[] arg163	 = new String[] { 
			"-p","143",
			"-T","imap",
			"-H","imap.163.com",
			"-U","i319962@163.com",
			"-P","superman163",
//			"-L", "imap://i319962:superman163@imap.163.com",
			"-D",
			"-l",
			"-v"
		};
		String[] argSina = new String[] { 
//			"-T","pop3",
//			"-H","pop.sina.com",
//			"-U","glassport@sina.com",
//			"-P","198111",
			"-L", "pop3://glassport:198111@pop3.sina.com",
//			"-D",
			"-l",
			"-v"
		};
		String[] giant = new String[] { 
//			"-T","pop3",
			"-p","995",
//			"-H","pop3.ztgame.com",
//			"-U","wanghui2",
//			"-P","superman31~",
			"-L","pop3://wanghui2:superman32~@pop3.ztgame.com:995",
			"-D",
			"-l",
			"-v"
		};
		
		show(giant);
	}

	public static void show(String argv[]) {
		int optind;
		InputStream msgStream = System.in;

		for (optind = 0; optind < argv.length; optind++) {
			if (argv[optind].equals("-T")) {
				protocol = argv[++optind];
			} else if (argv[optind].equals("-H")) {
				host = argv[++optind];
			} else if (argv[optind].equals("-U")) {
				user = argv[++optind];
			} else if (argv[optind].equals("-P")) {
				password = argv[++optind];
			} else if (argv[optind].equals("-v")) {
				verbose = true;
			} else if (argv[optind].equals("-D")) {
				debug = true;
			} else if (argv[optind].equals("-l")) {
				showDetail = true;
			} else if (argv[optind].equals("-f")) {
				mbox = argv[++optind];
			} else if (argv[optind].equals("-L")) {
				url = argv[++optind];
			} else if (argv[optind].equals("-p")) {
				port = Integer.parseInt(argv[++optind]);
			} else if (argv[optind].equals("-s")) {
				showStructure = true;
			} else if (argv[optind].equals("-S")) {
				saveAttachments = true;
			} else if (argv[optind].equals("-m")) {
				showMessage = true;
			} else if (argv[optind].equals("-a")) {
				showAlert = true;
			} else if (argv[optind].equals("--")) {
				optind++;
				break;
			} else if (argv[optind].startsWith("-")) {
				System.out
						.println("Usage: msgshow [-L url] [-T protocol] [-H host] [-p port] [-U user]");
				System.out
						.println("\t[-P password] [-f mailbox] [msgnum ...] [-v] [-D] [-s] [-S] [-a]");
				System.out
						.println("or     msgshow -m [-v] [-D] [-s] [-S] [-f msg-file]");
				System.exit(1);
			} else {
				break;
			}
		}

		try {
			// Get a Properties object
			Properties props = System.getProperties();

			// Get a Session object
			String[] urls = new String[]{};
			if(url!=null)url.split(":");
			if(port == 995 || urls.length>1){
				Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
				final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
				props.setProperty("mail.pop3.socketFactory.class", SSL_FACTORY);
				//System.setProperty("javax.net.ssl.trustStore", "d:\\jssecacerts");
			}
			Session session = Session.getInstance(props, null);

			session.setDebug(debug);

			if (showMessage) {
				MimeMessage msg;
				if (mbox != null)
					msg = new MimeMessage(session, new BufferedInputStream(
							new FileInputStream(mbox)));
				else
					msg = new MimeMessage(session, msgStream);
				dumpPart(msg);
				System.exit(0);
			}

			// Get a Store object
			Store store = null;
			if (url != null) {
				URLName urln = new URLName(url);
				store = session.getStore(urln);
				if (showAlert) {
					store.addStoreListener(new StoreListener() {
						public void notification(StoreEvent e) {
							String s;
							if (e.getMessageType() == StoreEvent.ALERT)
								s = "ALERT: ";
							else
								s = "NOTICE: ";
							System.out.println(s + e.getMessage());
						}
					});
				}
				store.connect();
			} else {
				if (protocol != null)
					store = session.getStore(protocol);
				else
					store = session.getStore();

				// Connect
				if (host != null || user != null || password != null)
					store.connect(host, port, user, password);
				else
					store.connect();
			}

			// Open the Folder

			Folder folder = store.getDefaultFolder();
			if (folder == null) {
				System.out.println("No default folder");
				System.exit(1);
			}

			if (mbox == null)
				mbox = "INBOX";
			folder = folder.getFolder(mbox);
			if (folder == null) {
				System.out.println("Invalid folder");
				//System.exit(1);
			}
			// try to open read/write and if that fails try read-only
			try {
				folder.open(Folder.READ_WRITE);
			} catch (MessagingException ex) {
				folder.open(Folder.READ_ONLY);
			}
			int totalMessages = folder.getMessageCount();

			if (totalMessages == 0) {
				System.out.println("Empty folder");
				folder.close(false);
				store.close();
				System.exit(1);
			}

			if (verbose) {
				int newMessages = folder.getNewMessageCount();
				System.out.println("Total messages = " + totalMessages);
				System.out.println("New messages = " + newMessages);
				System.out.println("-------------------------------");
			}

			if (optind >= argv.length && showDetail) {
				// Attributes & Flags for all messages ..
				int count = folder.getMessageCount();
				Message[] msgs;
				if(count<10) msgs = folder.getMessages(1,count);
				else msgs = folder.getMessages(count-10,count);

				// Use a suitable FetchProfile
				FetchProfile fp = new FetchProfile();
				fp.add(FetchProfile.Item.ENVELOPE);
				fp.add(FetchProfile.Item.FLAGS);
				fp.add("X-Mailer");
				folder.fetch(msgs, fp);

				for (int i = 0; i < msgs.length; i++) {
					System.out.println("--------------------------");
					System.out.println("MESSAGE #" + (i + 1) + ":");
					dumpEnvelope(msgs[i]);
					// dumpPart(msgs[i]);
				}
			} else {
				while (optind < argv.length) {
					int msgnum = Integer.parseInt(argv[optind++]);
					System.out.println("Getting message number: " + msgnum);
					Message m = null;

					try {
						m = folder.getMessage(msgnum);
						dumpPart(m);
					} catch (IndexOutOfBoundsException iex) {
						System.out.println("Message number out of range");
					}
				}
			}

			folder.close(false);
			store.close();
		} catch (Exception ex) {
			System.out.println("Oops, got exception! " + ex.getMessage());
			ex.printStackTrace();
			//System.exit(1);
		}
		//System.exit(1);
	}

	public static void dumpPart(Part p) throws Exception {
		if (p instanceof Message)
			dumpEnvelope((Message) p);

		/**
		 * Dump input stream ..
		 * 
		 * InputStream is = p.getInputStream(); // If "is" is not already
		 * buffered, wrap a BufferedInputStream // around it. if (!(is
		 * instanceof BufferedInputStream)) is = new BufferedInputStream(is);
		 * int c; while ((c = is.read()) != -1) System.out.write(c);
		 * 
		 */

		String ct = p.getContentType();
		try {
			pr("CONTENT-TYPE: " + (new ContentType(ct)).toString());
		} catch (ParseException pex) {
			pr("BAD CONTENT-TYPE: " + ct);
		}
		String filename = p.getFileName();
		if (filename != null)
			pr("FILENAME: " + filename);

		/*
		 * Using isMimeType to determine the content type avoids fetching the
		 * actual content data until we need it.
		 */
		if (p.isMimeType("text/plain")) {
			pr("This is plain text");
			pr("---------------------------");
			if (!showStructure && !saveAttachments)
				System.out.println((String) p.getContent());
		} else if (p.isMimeType("multipart/*")) {
			pr("This is a Multipart");
			pr("---------------------------");
			Multipart mp = (Multipart) p.getContent();
			level++;
			int count = mp.getCount();
			for (int i = 0; i < count; i++)
				dumpPart(mp.getBodyPart(i));
			level--;
		} else if (p.isMimeType("message/rfc822")) {
			pr("This is a Nested Message");
			pr("---------------------------");
			level++;
			dumpPart((Part) p.getContent());
			level--;
		} else {
			if (!showStructure && !saveAttachments) {
				/*
				 * If we actually want to see the data, and it's not a MIME type
				 * we know, fetch it and check its Java type.
				 */
				Object o = p.getContent();
				if (o instanceof String) {
					pr("This is a string");
					pr("---------------------------");
					System.out.println((String) o);
				} else if (o instanceof InputStream) {
					pr("This is just an input stream");
					pr("---------------------------");
					InputStream is = (InputStream) o;
					int c;
					while ((c = is.read()) != -1)
						System.out.write(c);
				} else {
					pr("This is an unknown type");
					pr("---------------------------");
					pr(o.toString());
				}
			} else {
				// just a separator
				pr("---------------------------");
			}
		}

		/*
		 * If we're saving attachments, write out anything that looks like an
		 * attachment into an appropriately named file. Don't overwrite existing
		 * files to prevent mistakes.
		 */
		if (saveAttachments && level != 0 && !p.isMimeType("multipart/*")) {
			String disp = p.getDisposition();
			// many mailers don't include a Content-Disposition
			if (disp == null || disp.equalsIgnoreCase(Part.ATTACHMENT)) {
				if (filename == null)
					filename = "Attachment" + attnum++;
				pr("Saving attachment to file " + filename);
				try {
					File f = new File(filename);
					if (f.exists())
						// XXX - could try a series of names
						throw new IOException("file exists");
					((MimeBodyPart) p).saveFile(f);
				} catch (IOException ex) {
					pr("Failed to save attachment: " + ex);
				}
				pr("---------------------------");
			}
		}
	}

	public static void dumpEnvelope(Message m) throws Exception {
		pr("This is the message envelope");
		pr("---------------------------");
		Address[] a;
		// FROM
		if ((a = m.getFrom()) != null) {
			for (int j = 0; j < a.length; j++)
				pr("FROM: " + a[j].toString());
		}

		// REPLY TO
		if ((a = m.getReplyTo()) != null) {
			for (int j = 0; j < a.length; j++)
				pr("REPLY TO: " + a[j].toString());
		}

		// TO
		if ((a = m.getRecipients(Message.RecipientType.TO)) != null) {
			for (int j = 0; j < a.length; j++) {
				pr("TO: " + a[j].toString());
				InternetAddress ia = (InternetAddress) a[j];
				if (ia.isGroup()) {
					InternetAddress[] aa = ia.getGroup(false);
					for (int k = 0; k < aa.length; k++)
						pr("  GROUP: " + aa[k].toString());
				}
			}
		}

		// SUBJECT
		pr("SUBJECT: " + m.getSubject());

		// DATE
		Date d = m.getSentDate();
		pr("SendDate: "
				+ (d != null ? DateUtils.format(d, "yyyy-MM-dd HH:mm:ss")
						: "UNKNOWN"));

		// FLAGS
		Flags flags = m.getFlags();
		StringBuffer sb = new StringBuffer();
		Flags.Flag[] sf = flags.getSystemFlags(); // get the system flags

		boolean first = true;
		for (int i = 0; i < sf.length; i++) {
			String s;
			Flags.Flag f = sf[i];
			if (f == Flags.Flag.ANSWERED)
				s = "\\Answered";
			else if (f == Flags.Flag.DELETED)
				s = "\\Deleted";
			else if (f == Flags.Flag.DRAFT)
				s = "\\Draft";
			else if (f == Flags.Flag.FLAGGED)
				s = "\\Flagged";
			else if (f == Flags.Flag.RECENT)
				s = "\\Recent";
			else if (f == Flags.Flag.SEEN)
				s = "\\Seen";
			else
				continue; // skip it
			if (first)
				first = false;
			else
				sb.append(' ');
			sb.append(s);
		}

		String[] uf = flags.getUserFlags(); // get the user flag strings
		for (int i = 0; i < uf.length; i++) {
			if (first)
				first = false;
			else
				sb.append(' ');
			sb.append(uf[i]);
		}
		pr("FLAGS: " + sb.toString());

		// X-MAILER
		String[] hdrs = m.getHeader("X-Mailer");
		if (hdrs != null)
			pr("X-Mailer: " + hdrs[0]);
		else
			pr("X-Mailer NOT available");
	}

	static String indentStr = "                                               ";
	static int level = 0;

	/**
	 * Print a, possibly indented, string.
	 */
	public static void pr(String s) {
		if (showStructure)
			System.out.print(indentStr.substring(0, level * 2));
		System.out.println(s);
	}
}
