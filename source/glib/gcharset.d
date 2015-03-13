/*
 * Distributed under the Boost Software License, Version 1.0.
 *    (See accompanying file LICENSE_1_0.txt or copy at
 *          http://www.boost.org/LICENSE_1_0.txt)
 */
module glib.gcharset;

import glib.gtypes;


extern (C) {

    gboolean       g_get_charset         (const(char) **charset);

    gchar *        g_get_codeset         ();


    const(gchar*)* g_get_language_names  ();

    gchar **       g_get_locale_variants (const(gchar) *locale);

}

