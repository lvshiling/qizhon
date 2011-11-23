/*
 *  Copyright (C) 2010 The Snsgoo Network, Inc. All rights reserved.
 *  
 */
package com.navigation.cache.impl;

import java.io.IOException;
import java.util.List;

import net.spy.memcached.BinaryConnectionFactory;
import net.spy.memcached.ConnectionFactory;
import net.spy.memcached.DefaultConnectionFactory;
import net.spy.memcached.HashAlgorithm;
import net.spy.memcached.KetamaConnectionFactory;
import net.spy.memcached.MemcachedClient;

import com.navigation.cache.CacheClient;
import com.navigation.cache.CacheClientFactory;

/**
 * The class SpyMemcacheClientFactory
 * memcache客户端spy实现.
 * @author guohouqiang
 * @version 1.0, 2008-10-15
 */
public class SpyMemcacheClientFactoryImpl implements CacheClientFactory {
	
	/** The read buffer size. */
	private int readBufferSize = 16384;
	
	/** The operation queue length. */
	private int operationQueueLength = 16384;
	
	/** The operation timeout millis. */
	private int operationTimeoutMillis= 1000;
	
	/** The hash algorithm_. */
	private HashAlgorithm hashAlgorithm_ = HashAlgorithm.KETAMA_HASH;
	
	/** The hash algorithm. */
	private String hashAlgorithm;
	
	private String connectionFactory = "DefaultConnectionFactory";
	
	private boolean daemonMode = false;
	

	/**
	 * @see com.navigation.cache.ztgame.cache.CacheClientFactory#createMemcacheClient(java.util.List)
	 */
	public CacheClient createClient(List<java.net.InetSocketAddress> addrs) throws IOException{
		ConnectionFactory connectionFactory = buildConnectionFactory();
		MemcachedClient client = new MemcachedClient(connectionFactory,addrs);
		return new SpyMemcacheClientImpl(client);
	}

	protected ConnectionFactory buildConnectionFactory() {

        if (connectionFactoryNameEquals(DefaultConnectionFactory.class)) {
            return buildDefaultConnectionFactory();
        }

        if (connectionFactoryNameEquals(KetamaConnectionFactory.class)) {
            return buildKetamaConnectionFactory();
        }

        if (connectionFactoryNameEquals(BinaryConnectionFactory.class)) {
            return buildBinaryConnectionFactory();
        }

        throw new IllegalArgumentException("ConnectionFactory unsupported value: " + connectionFactory);
    }
	
	private boolean connectionFactoryNameEquals(Class<?> cls) {
        return cls.getSimpleName().equals(connectionFactory);
    }
	
	private DefaultConnectionFactory buildDefaultConnectionFactory() {
        return new DefaultConnectionFactory(getOperationQueueLength(), getReadBufferSize(), getHashAlgorithm_()) {
            @Override
            public long getOperationTimeout() {
                return getOperationTimeoutMillis();
            }

            @Override
            public boolean isDaemon() {
                return isDaemonMode();
            }
        };
    }

    private KetamaConnectionFactory buildKetamaConnectionFactory() {
        return new KetamaConnectionFactory() {
            @Override
            public long getOperationTimeout() {
                return getOperationTimeoutMillis();
            }

            @Override
            public boolean isDaemon() {
                return isDaemonMode();
            }
        };
    }

    private BinaryConnectionFactory buildBinaryConnectionFactory() {
        return new BinaryConnectionFactory(getOperationQueueLength(), getReadBufferSize(), getHashAlgorithm_()) {
            @Override
            public long getOperationTimeout() {
                return getOperationTimeoutMillis();
            }

            @Override
            public boolean isDaemon() {
                return isDaemonMode();
            }
        };
    }
	
	/**
	 * Gets the operation queue length.
	 * 
	 * @return the operation queue length
	 */
	public int getOperationQueueLength() {
		return operationQueueLength;
	}

	/**
	 * Sets the operation queue length.
	 * 
	 * @param operationQueueLength  the new operation queue length
	 */
	public void setOperationQueueLength(int operationQueueLength) {
		this.operationQueueLength = operationQueueLength;
	}

	/**
	 * Gets the read buffer size.
	 * 
	 * @return the read buffer size
	 */
	public int getReadBufferSize() {
		return readBufferSize;
	}

	/**
	 * Sets the read buffer size.
	 * 
	 * @param readBufferSize  the new read buffer size
	 */
	public void setReadBufferSize(int readBufferSize) {
		this.readBufferSize = readBufferSize;
	}

	/**
	 * Sets the hash algorithm.
	 * 
	 * @param hashAlgorithm  the new hash algorithm
	 */
	public void setHashAlgorithm(String hashAlgorithm) {
		this.hashAlgorithm = hashAlgorithm;
	}

	/**
	 * Gets the hash algorithm.
	 * 
	 * @return the hash algorithm
	 */
	public String getHashAlgorithm() {
		return hashAlgorithm;
	}
	
	/**
	 * Gets the hash algorithm_.
	 * 
	 * @return the hash algorithm_
	 */
	public HashAlgorithm getHashAlgorithm_(){
		HashAlgorithm h = HashAlgorithm.valueOf(this.hashAlgorithm);
		if(h==null)h = this.hashAlgorithm_;
		return h;
	}

	/**
	 * Gets the operation timeout millis.
	 * 
	 * @return the operation timeout millis
	 */
	public int getOperationTimeoutMillis() {
		return operationTimeoutMillis;
	}

	/**
	 * Sets the operation timeout millis.
	 * 
	 * @param operationTimeoutMillis the new operation timeout millis
	 */
	public void setOperationTimeoutMillis(int operationTimeoutMillis) {
		this.operationTimeoutMillis = operationTimeoutMillis;
	}
	
	public String getConnectionFactory() {
		return connectionFactory;
	}

	public void setConnectionFactory(String connectionFactory) {
		this.connectionFactory = connectionFactory;
	}
	
	public boolean isDaemonMode() {
		return daemonMode;
	}

	public void setDaemonMode(boolean daemonMode) {
		this.daemonMode = daemonMode;
	}
}
