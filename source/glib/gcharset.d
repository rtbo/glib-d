module glib.gcharset;

import glib.gtypes;


extern (C) {

    gboolean       g_get_charset         (const(char) **charset);

    gchar *        g_get_codeset         ();


    const(gchar*)* g_get_language_names  ();

    gchar **       g_get_locale_variants (const(gchar) *locale);

}

