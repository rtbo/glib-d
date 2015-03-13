/*
 * Distributed under the Boost Software License, Version 1.0.
 *    (See accompanying file LICENSE_1_0.txt or copy at
 *          http://www.boost.org/LICENSE_1_0.txt)
 */
module glib.gurifuncs;

import glib.gtypes;

enum G_URI_RESERVED_CHARS_GENERIC_DELIMITERS = ":/?#[]@";
enum G_URI_RESERVED_CHARS_SUBCOMPONENT_DELIMITERS = "!$&'()*+,;=";
enum G_URI_RESERVED_CHARS_ALLOWED_IN_PATH_ELEMENT = G_URI_RESERVED_CHARS_SUBCOMPONENT_DELIMITERS~":@";
enum G_URI_RESERVED_CHARS_ALLOWED_IN_PATH = G_URI_RESERVED_CHARS_ALLOWED_IN_PATH_ELEMENT~"/";
enum G_URI_RESERVED_CHARS_ALLOWED_IN_USERINFO = G_URI_RESERVED_CHARS_SUBCOMPONENT_DELIMITERS~":";

extern (C) {

    char *   g_uri_unescape_string       (const(char) *escaped_string,
                          const(char) *illegal_characters);

    char *   g_uri_unescape_segment      (const(char) *escaped_string,
                          const(char) *escaped_string_end,
                          const(char) *illegal_characters);

    char *   g_uri_parse_scheme          (const(char) *uri);

    char *   g_uri_escape_string         (const(char) *unescaped,
                          const(char) *reserved_chars_allowed,
                          gboolean    allow_utf8);
}

