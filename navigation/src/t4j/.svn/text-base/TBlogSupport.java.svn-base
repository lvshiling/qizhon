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
package t4j;

import t4j.http.HttpClient;

/**
 * @author Yusuke Yamamoto - yusuke at mac.com
 * 
 * modified by gcwang
 */
class TBlogSupport {
	
    protected HttpClient http = new HttpClient();
    
    public void setHttp(HttpClient http) {
		this.http = http;
	}

	TBlogSupport(){
        this(null, null);
    }

    TBlogSupport(String userId, String password){
        setClientVersion(null);
        setClientURL(null);
        setUserId(userId);
        setPassword(password);
    }

    /**
     * Sets the User-Agent header. System property -Dtblog4j.http.userAgent overrides this attribute.
     * @param userAgent UserAgent
     */
    public void setUserAgent(String userAgent){
        http.setUserAgent(userAgent);
    }

    /**
     *
     * @return UserAgent
     */
    public String getUserAgent(){
        return http.getUserAgent();
    }

    /**
     * Sets the TBlog-Client-Version header. System property -Dtblog4j.clientVersion overrides this attribute.
     * @param version client version
     */
    public void setClientVersion(String version){
        setRequestHeader("TBlog-Client-Version", Configuration.getCilentVersion(version));
    }

    /**
     *
     * @return client version
     */
    public String getClientVersion(){
        return http.getRequestHeader("TBlog-Client-Version");
    }

    /**
     * Sets the TBlog-Client-URL header. System property -Dtblog4j.clientURL overrides this attribute.
     * @param clientURL client URL
     */
    public void setClientURL(String clientURL){
        setRequestHeader("TBlog-Client-URL", Configuration.getClientURL(clientURL));
    }

    /**
     *
     * @return client URL
     */
    public String getClientURL(){
        return http.getRequestHeader("TBlog-Client-URL");
    }

    /**
     * Sets the userid
     *
     * @param userId new userid
     */
    public synchronized void setUserId(String userId) {
        http.setUserId(Configuration.getUser(userId));
    }

    /**
     * Returns authenticating userid
     *
     * @return userid
     */
    public String getUserId() {
        return http.getUserId();
    }

    /**
     * Sets the password
     *
     * @param password new password
     */
    public synchronized void setPassword(String password) {
        http.setPassword(Configuration.getPassword(password));
    }

    /**
     * Returns authenticating password
     *
     * @return password
     */
    public String getPassword() {
        return http.getPassword();
    }

    /**
     * Enables use of HTTP proxy
     *
     * @param proxyHost proxy host, can be overridden system property -Dtblog4j.http.proxyHost , -Dhttp.proxyHost
     * @param proxyPort proxy port, can be overridden system property -Dtblog4j.http.proxyPort , -Dhttp.proxyPort
     */
    public void setHttpProxy(String proxyHost, int proxyPort) {
        http.setProxyHost(proxyHost);
        http.setProxyPort(proxyPort);
    }

    /**
     * Adds authentication on HTTP proxy
     *
     * @param proxyUser proxy user, can be overridden system property -Dtblog4j.http.proxyUser
     * @param proxyPass proxy password, can be overridden system property -Dtblog4j.http.proxyPassword
     */
    public void setHttpProxyAuth(String proxyUser, String proxyPass) {
        http.setProxyAuthUser(proxyUser);
        http.setProxyAuthPassword(proxyPass);
    }

    /**
     * Sets a specified timeout value, in milliseconds, to be used when opening a communications link to the TBlog API.
     *
     * @param connectionTimeout an int that specifies the connect timeout value in milliseconds
     */
    public void setHttpConnectionTimeout(int connectionTimeout) {
        http.setConnectionTimeout(connectionTimeout);
    }

    /**
     * Sets the read timeout to a specified timeout, in milliseconds.
     *
     * @param readTimeoutMilliSecs an int that specifies the timeout value to be used in milliseconds
     */
    public void setHttpReadTimeout(int readTimeoutMilliSecs) {
        http.setReadTimeout(readTimeoutMilliSecs);
    }

    /**
     * Sets the request header name/value combination
     * @param name  the name of the request header
     * @param value the value of the request header
     */
    public void setRequestHeader(String name, String value) {
        http.setRequestHeader(name, value);
    }

    /**
     * @return true if POST is used forcibly
     */
    public boolean isUsePostForced() {
        return false;
    }

    public void setRetryCount(int retryCount) {
        http.setRetryCount(retryCount);
    }

    public void setRetryIntervalSecs(int retryIntervalSecs) {
        http.setRetryIntervalSecs(retryIntervalSecs);
    }
}

