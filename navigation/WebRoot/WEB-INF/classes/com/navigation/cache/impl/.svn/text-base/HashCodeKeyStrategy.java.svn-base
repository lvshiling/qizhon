/**
 * Copyright (C) 2004-2008 The Giant Network, Inc. All rights reserved.
 *
 * @(#) HashCodeKeyStrategy.java 1.0 2008-10-15
 */
package com.navigation.cache.impl;


/**
 * The Class HashCodeKeyStrategy.
 * 
 * @author guohouqiang
 * @version 1.0, 2008-10-15
 */
public class HashCodeKeyStrategy extends AbstractKeyStrategy {
    
    /**
     * @see com.ztgame.cache.impl.AbstractKeyStrategy#transformKeyObject(java.lang.Object)
     */
    protected String transformKeyObject(Object key) {
        int hashCode = key.hashCode();
        log.debug("Transformed key [{}] to hashCode [{}]", key, hashCode);
        return String.valueOf(hashCode);
    }
}
