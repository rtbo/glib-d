/*
 * Distributed under the Boost Software License, Version 1.0.
 *    (See accompanying file LICENSE_1_0.txt or copy at
 *          http://www.boost.org/LICENSE_1_0.txt)
 */
module glib.gdir;

import glib.gtypes;
import glib.gerror;


struct GDir;


extern (C)
{

    void g_dir_rewind (GDir *dir);

    void g_dir_close (GDir *dir);


    version (Win32) {

        GDir *g_dir_open_utf8 (const(gchar) *path,
                               guint flags,
                               GError **error);

        const(gchar) *g_dir_read_name_utf8 (GDir *dir);

        alias g_dir_open = g_dir_open_utf8;
        alias g_dir_read_name = g_dir_read_name_utf8;

    }
    else {

        GDir * g_dir_open (const(gchar)  *path,
                           guint flags,
                           GError **error);

        const(gchar) * g_dir_read_name (GDir *dir);

    }

}

