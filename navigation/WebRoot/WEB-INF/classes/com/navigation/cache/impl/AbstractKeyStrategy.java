/**
 * Copyright (C) 2004-2008 The Giant Network, Inc. All rights reserved.
 *
 * @(#) AbstractKeyStrategy.java 1.0 2008-10-15
 */
package com.navigation.cache.impl;

import java.util.regex.Pattern;

import org.apache.commons.codec.digest.DigestUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.navigation.cache.KeyStrategy;


/**
 * The Class AbstractKeyStrategy.
 * KeyStrategy base class that handles concatenation, cleaning, and truncating the final cache key.
 * <pre>
 * Concatenates the three key components; regionName, clearIndex and key.
 * Subclasses are responsible for transforming the Key object into something identifyable.
 * If the key total length, including region and clearIndex, are greater than the maxKeyLength, the key's hashCode
 * will be used as the key. Subclasses can override this behavior.
 * </pre>
 * @author guohouqiang
 * @version 1.0, 2008-10-15
 */
public abstract class AbstractKeyStrategy implements KeyStrategy {

    /** The Constant DEFAULT_MAX_KEY_LENGTH. */
    public static final int DEFAULT_MAX_KEY_LENGTH = 250;
    
    /** The log. */
    protected final Logger log = LoggerFactory.getLogger(getClass());
    
    /** The Constant CLEAN_PATTERN. */
    private static final Pattern CLEAN_PATTERN = Pattern.compile("\\s");
    
    /** The max key length. */
    private int maxKeyLength = DEFAULT_MAX_KEY_LENGTH;

    /**
     * @see com.navigation.cache.ztgame.cache.KeyStrategy#toKey(java.lang.String, java.lang.Object)
     */
    public String toKey(String regionName, Object key) {
        if (key == null) {
            throw new IllegalArgumentException("key must not be null");
        }
        
        String keyString = 
        	(null==regionName||"".equals(regionName.trim()))?transformKeyObject(key):
        			concatenateKey(regionName, transformKeyObject(key));

        if (keyString.length() > maxKeyLength) {
            return truncateKey(keyString);
        }

        String finalKey = CLEAN_PATTERN.matcher(keyString).replaceAll("");
        log.debug("Final cache key: [{}]", finalKey);
        return finalKey;
    }

    /**
	 * Transform key object.
	 * 
	 * @param key the key
	 * @return the string
	 */
    protected abstract String transformKeyObject(Object key);

    /**
	 * Truncate key.
	 * 
	 * @param key the key
	 * @return the string
	 */
    protected String truncateKey(String key) {

        String keyHashCode = DigestUtils.md5Hex(key.getBytes());

        log.warn("Encoded key [{}] to md5 hash [{}]. " +
                "Be sure to set cache region names whenever possible as the names Hibernate generates are really long.",
                key, keyHashCode
        );

        return keyHashCode;
    }

    /**
	 * Gets the max key length.
	 * 
	 * @return the max key length
	 */
    public int getMaxKeyLength() {
        return maxKeyLength;
    }

    /**
	 * Sets the max key length.
	 * 
	 * @param maxKeyLength  the new max key length
	 */
    public void setMaxKeyLength(int maxKeyLength) {
        this.maxKeyLength = maxKeyLength;
    }

    /**
	 * Concatenate key.
	 * 
	 * @param regionName  the region name
	 * @param key  the key
	 * @return the string
	 */
    protected String concatenateKey(String regionName, Object key) {
        return new StringBuilder()
                .append(regionName)
                .append(":")
                .append(String.valueOf(key)).toString();
    }
}
