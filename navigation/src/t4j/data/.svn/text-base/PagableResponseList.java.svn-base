/*
Copyright (c) 2007-2009, Yusuke Yamamoto
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of the Yusuke Yamamoto nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY Yusuke Yamamoto ``AS IS'' AND ANY
EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL Yusuke Yamamoto BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/
package t4j.data;

import java.util.ArrayList;

import t4j.http.Response;
import t4j.org.json.JSONException;
import t4j.org.json.JSONObject;

/**
 * 
 * @author gcwang
 * 
 * 分页的结果显示
 *
 */
public class PagableResponseList<T> extends ArrayList<T> {

	private final long previousCursor;
    private final long nextCursor;
    private static final long serialVersionUID = 1531950333538983361L;

    PagableResponseList(int size, JSONObject json, Response res) {
        super(size);
        
       	this.previousCursor = getLong(json, "previous_cursor");
        this.nextCursor = getLong(json, "next_cursor");
    }
    
    private long getLong(JSONObject json, String key){
    	long result = -1;
    	try{
    		result = json.getLong(key);
    	}catch(JSONException e){
    		
    	}
    	return result;
    }

    public boolean hasPrevious() {
        return 0 != previousCursor;
    }

    public long getPreviousCursor() {
        return previousCursor;
    }

    public boolean hasNext() {
        return 0 != nextCursor;
    }

    public long getNextCursor() {
        return nextCursor;
    }
}
