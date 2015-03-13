/*
 * Distributed under the Boost Software License, Version 1.0.
 *    (See accompanying file LICENSE_1_0.txt or copy at
 *          http://www.boost.org/LICENSE_1_0.txt)
 */
module glib.ghostutils;

import glib.gtypes;

extern (C) {

    gboolean  g_hostname_is_non_ascii     (const(gchar) *hostname);

    gboolean  g_hostname_is_ascii_encoded (const(gchar) *hostname);

    gboolean  g_hostname_is_ip_address    (const(gchar) *hostname);


    gchar    *g_hostname_to_ascii         (const(gchar) *hostname);

    gchar    *g_hostname_to_unicode       (const(gchar) *hostname);

}

