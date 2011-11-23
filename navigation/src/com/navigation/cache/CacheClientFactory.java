/*
 * Copyright (C) 2010 The Depiao Network, Inc. All rights reserved.
 */
package com.navigation.cache;

import java.io.IOException;
import java.util.List;

/**
 * A factory for creating Client objects.
 * 
 * @author guohouqiang
 * @version 1.0, 2008-10-15
 */
public interface CacheClientFactory {
	
	/**
	 * Creates a new Client object.
	 * 
	 * @param addrs the addrs
	 * @return the memcache
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	CacheClient createClient(List<java.net.InetSocketAddress> addrs) throws IOException;
}
