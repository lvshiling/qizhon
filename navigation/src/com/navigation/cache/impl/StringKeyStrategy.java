/**
 * Copyright (C) 2004-2008 The Giant Network, Inc. All rights reserved.
 *
 * @(#) StringKeyStrategy.java 1.0 2008-10-15
 */
package com.navigation.cache.impl;


/**
 * The Class StringKeyStrategy.
 * 
 * @author guohouqiang
 * @version 1.0, 2008-10-15
 */
public class StringKeyStrategy extends AbstractKeyStrategy {
    
    /**
     * @see com.ztgame.cache.impl.AbstractKeyStrategy#transformKeyObject(java.lang.Object)
     */
    protected String transformKeyObject(Object key) {
        String stringKey = String.valueOf(key);
        log.debug("Transformed key [{}] to string [{}]", key, stringKey);
        return stringKey;
    }
}
