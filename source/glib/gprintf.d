/*
 * Distributed under the Boost Software License, Version 1.0.
 *    (See accompanying file LICENSE_1_0.txt or copy at
 *          http://www.boost.org/LICENSE_1_0.txt)
 */
module glib.gprintf;

import glib.gtypes;

import core.stdc.stdio;
import core.stdc.stdarg;


extern (C) {

    gint                  g_printf    (const(gchar) *format,
                                       ...);

    gint                  g_fprintf   (FILE        *file,
                       const(gchar) *format,
                       ...);

    gint                  g_sprintf   (gchar       *str,
                       const(gchar) *format,
                       ...);


    gint                  g_vprintf   (const(gchar) *format,
                                       va_list      args);

    gint                  g_vfprintf  (FILE        *file,
                       const(gchar) *format,
                       va_list      args);

    gint                  g_vsprintf  (gchar       *str,
                       const(gchar) *format,
                       va_list      args);

    gint                  g_vasprintf (gchar      **str,
                       const(gchar) *format,
                       va_list      args);

}

