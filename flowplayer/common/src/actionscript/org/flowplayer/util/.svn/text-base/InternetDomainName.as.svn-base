/*
 * Copyright (C) 2009 The Guava Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.flowplayer.util {

    /**
     * An well-formed internet domain name, such as {@code com} or {@code
     * foo.co.uk}. Only syntactic analysis is performed; no DNS lookups or other
     * network interactions take place. Thus there is no guarantee that the domain
     * actually exists on the internet.
     *
     * <p>Used to identify public suffixes (top level domains) and to find out
     * the top level private domain (the private domain directly under the public
     * suffix).
     *
     * Based on an implementation found in the guava libraries, http://code.google.com/p/guava-libraries/
     */
    internal class InternetDomainName {

        /**
         * Value of {@link #publicSuffixIndex} which indicates that no public suffix
         * was found.
         */
        private static const NO_PUBLIC_SUFFIX_FOUND:int = -1;

        /**
         * The full domain name, converted to lower case.
         */
        private var _name:String;

        /**
         * The parts of the domain name, converted to lower case.
         */
        private var parts:Array;

        /**
         * The index in the {@link #parts()} list at which the public suffix begins.
         * For example, for the domain name {@code www.google.co.uk}, the value would
         * be 2 (the index of the {@code co} part). The value is negative
         * (specifically, {@link #NO_PUBLIC_SUFFIX_FOUND}) if no public suffix was
         * found.
         */
        private var publicSuffixIndex:int;

        public function InternetDomainName(name:String) {
            // Normalize:
            // * ASCII characters to lowercase
            // * Strip trailing '.'
            name = name.toLowerCase();
            if (StringUtils.endsWith(name, ".")) {
                name = name.substring(0, name.length - 1);
            }
            if (StringUtils.startsWith(name,  ".")) {
                name = name.substr(1);
            }

            _name = name;
            this.parts = _name.split(".");
            this.publicSuffixIndex = findPublicSuffix();
        }

        /**
         * Returns the index of the leftmost part of the public suffix, or -1 if not
         * found. Note that the value defined as the "public suffix" may not be a
         * public suffix according to {@link #isPublicSuffix()} if the domain ends
         * with an excluded domain pattern such as {@code "nhs.uk"}.
         */
        private function findPublicSuffix():int {
            var partsSize:int = parts.length;

            for (var i:int = 0; i < partsSize; i++) {
                var ancestorName:String = parts.slice(i).join('.')

                if (TldPatterns.EXACT.indexOf(ancestorName) >= 0) return i;

                // Excluded domains (e.g. !nhs.uk) use the next highest
                // domain as the effective public suffix (e.g. uk).
                if (TldPatterns.EXCLUDED.indexOf(ancestorName) >= 0) return i + 1;

                if (matchesWildcardPublicSuffix(ancestorName))return i;
            }

            return NO_PUBLIC_SUFFIX_FOUND;
        }

        /**
         * Returns the domain name, normalized to all lower case.
         */
        public function get name():String {
            return _name;
        }

        /**
         * Indicates whether this domain name ends in a {@linkplain #isPublicSuffix()
         * public suffix}, while not being a public suffix itself. For example,
         * returns {@code true} for {@code www.google.com}, {@code foo.co.uk} and
         * {@code bar.ca.us}, but not for {@code google}, {@code com}, or {@code
         * google.foo}.
         *
         * <p><b>Warning:</b> a {@code false} result from this method does not imply
         * that the domain does not represent an addressable host, as many public
         * suffixes are also addressable hosts. Use {@link #hasPublicSuffix()} for
         * that test.
         *
         * <p>This method can be used to determine whether it will probably be
         * possible to set cookies on the domain, though even that depends on
         * individual browsers' implementations of cookie controls. See
         * <a href="http://www.ietf.org/rfc/rfc2109.txt">RFC 2109</a> for details.
         *
         */
        public function isUnderPublicSuffix():Boolean {
            return publicSuffixIndex > 0;
        }

        /**
         * Indicates whether this domain name represents a <i>public suffix</i>, as
         * defined by the Mozilla Foundation's
         * <a href="http://publicsuffix.org/">Public Suffix List</a> (PSL). A public
         * suffix is one under which Internet users can directly register names, such
         * as {@code com}, {@code co.uk} or {@code pvt.k12.wy.us}. Examples of domain
         * names that are <i>not</i> public suffixes include {@code google}, {@code
         * google.com} and {@code foo.co.uk}.
         *
         * @return {@code true} if this domain name appears exactly on the public
         *     suffix list
         * @since 6
         */
        public function isPublicSuffix():Boolean {
            return publicSuffixIndex == 0;
        }

        /**
         * Indicates whether this domain name is composed of exactly one subdomain
         * component followed by a {@linkplain #isPublicSuffix() public suffix}. For
         * example, returns {@code true} for {@code google.com} and {@code foo.co.uk},
         * but not for {@code www.google.com} or {@code co.uk}.
         *
         * <p><b>Warning:</b> A {@code true} result from this method does not imply
         * that the domain is at the highest level which is addressable as a host, as
         * many public suffixes are also addressable hosts. For example, the domain
         * {@code bar.uk.com} has a public suffix of {@code uk.com}, so it would
         * return {@code true} from this method. But {@code uk.com} is itself an
         * addressable host.
         *
         * <p>This method can be used to determine whether a domain is probably the
         * highest level for which cookies may be set, though even that depends on
         * individual browsers' implementations of cookie controls. See
         * <a href="http://www.ietf.org/rfc/rfc2109.txt">RFC 2109</a> for details.
         *
         */
        private function isTopPrivateDomain():Boolean {
            return publicSuffixIndex == 1;
        }

        /**
         * Returns the portion of this domain name that is one level beneath the
         * public suffix. For example, for {@code x.adwords.google.co.uk} it returns
         * {@code google.co.uk}, since {@code co.uk} is a public suffix.
         *
         * <p>If {@link #isTopPrivateDomain()} is true, the current domain name
         * instance is returned.
         *
         * <p>This method should not be used to determine the topmost parent domain
         * which is addressable as a host, as many public suffixes are also
         * addressable hosts. For example, the domain {@code foo.bar.uk.com} has
         * a public suffix of {@code uk.com}, so it would return {@code bar.uk.com}
         * from this method. But {@code uk.com} is itself an addressable host.
         *
         * <p>This method can be used to determine the probable highest level parent
         * domain for which cookies may be set, though even that depends on individual
         * browsers' implementations of cookie controls.
         *
         * @throws IllegalStateException if this domain does not end with a
         *     public suffix
         * @since 6
         */
        public function get topPrivateDomain():InternetDomainName {
            if (isTopPrivateDomain()) {
                return this;
            }
            if (! isUnderPublicSuffix()) {
                return null;
//                throw new Error("Not under a public suffix: '" + name + "'");
            }
            return ancestor(publicSuffixIndex - 1);
        }

        /**
         * Returns the ancestor of the current domain at the given number of levels
         * "higher" (rightward) in the subdomain list. The number of levels must be
         * non-negative, and less than {@code N-1}, where {@code N} is the number of
         * parts in the domain.
         *
         */
        private function ancestor(levels:int):InternetDomainName {
//      return new InternetDomainName(DOT_JOINER.join(parts.subList(levels, parts.size())));
            return new InternetDomainName(parts.slice(levels).join('.'));
        }

        /**
         * Does the domain name match one of the "wildcard" patterns (e.g.
         * {@code "*.ar"})?
         */
        private static function matchesWildcardPublicSuffix(domain:String):Boolean {
            var pieces:Array = domain.split('.');
            var rightPart:String = pieces.length > 1 ? pieces.slice(1).join('.') : pieces[0];
            return TldPatterns.UNDER.indexOf(rightPart) >= 0 || TldPatterns.UNDER.indexOf(domain) >= 0;
        }

    }
}