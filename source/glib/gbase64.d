/*
 * Distributed under the Boost Software License, Version 1.0.
 *    (See accompanying file LICENSE_1_0.txt or copy at
 *          http://www.boost.org/LICENSE_1_0.txt)
 */
module glib.gbase64;

import glib.gtypes;

extern (C) {

    gsize   g_base64_encode_step    (const(guchar) *in_,
                                     gsize         len,
                                     gboolean      break_lines,
                                     gchar        *out_,
                                     gint         *state,
                                     gint         *save);

    gsize   g_base64_encode_close   (gboolean      break_lines,
                                     gchar        *out_,
                                     gint         *state,
                                     gint         *save);

    gchar*  g_base64_encode         (const(guchar) *data,
                                     gsize         len);

    gsize   g_base64_decode_step    (const(gchar)  *in_,
                                     gsize         len,
                                     guchar       *out_,
                                     gint         *state,
                                     guint        *save);

    guchar *g_base64_decode         (const(gchar)  *text,
                                     gsize        *out_len);

    guchar *g_base64_decode_inplace (gchar        *text,
                                     gsize        *out_len);

}

