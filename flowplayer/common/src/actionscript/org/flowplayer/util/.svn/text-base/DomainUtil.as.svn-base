/*
 * This file is part of Flowplayer, http://flowplayer.org
 *
 * By: Anssi Piirainen, <api@iki.fi>
 *
 * Copyright (c) 2008-2011 Flowplayer Oy
 *
 * Released under the MIT License:
 * http://www.opensource.org/licenses/mit-license.php
 */
package org.flowplayer.util {
    public class DomainUtil {

        /**
         * Parses and returns the domain name from the specified URL.
         * @param url
         * @param stripSubdomains if true the top private domain name is returned with other subdomains stripped out
         * @return
         */
        public static function parseDomain(url:String, stripSubdomains:Boolean):String {
            var domain:String = getDomain(url);
            if (stripSubdomains || domain.indexOf("www.") == 0) {
                domain = stripSubdomain(domain);
                trace("stripping out subdomain, resulted in " + domain);
            }
            return domain.toLowerCase();
        }

        /**
         * Strips subdomains from the specified domain.
         *
         * @param domain
         * @return
         */
        public static function stripSubdomain(domain:String):String {
            if (! domain) return null;
            var inetDomain:InternetDomainName = new InternetDomainName(domain);

            // return null if the domain is a public TLD like com, ac.uk, us.com
            if (inetDomain.isPublicSuffix()) return null;

            // return the top private domain name that is directly under the public suffix
            // if the domain is not under a public suffix (intranet domains for example) we return the
            // domain untouched.
            return inetDomain.isUnderPublicSuffix() ? inetDomain.topPrivateDomain.name : inetDomain.name;
        }

        public static function getDomain(url:String):String {
            var schemeEnd:int = getSchemeEnd(url);
            var domain:String = url.substr(schemeEnd);
            var endPos:int = getDomainEnd(domain);
            return domain.substr(0, endPos);
        }

        internal static function getSchemeEnd(url:String):int {
            var pos:int = url.indexOf("///");
            if (pos >= 0) return pos + 3;
            pos = url.indexOf("//");
            if (pos >= 0) return pos + 2;
            return 0;
        }

        internal static function getDomainEnd(domain:String):int {
            var colonPos:int = domain.indexOf(":");
            var pos:int = domain.indexOf("/");
            if (colonPos > 0 && pos > 0 && colonPos < pos) return colonPos;
            if (pos > 0) return pos;

            pos = domain.indexOf("?");
            if (pos > 0) return pos;
            return domain.length;
        }

    }
}
