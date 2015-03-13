/*
 * Distributed under the Boost Software License, Version 1.0.
 *    (See accompanying file LICENSE_1_0.txt or copy at
 *          http://www.boost.org/LICENSE_1_0.txt)
 */
module glib.gmappedfile;

import glib.gtypes;
import glib.garray;
import glib.gerror;


struct GMappedFile;

extern (C) {

    GMappedFile *g_mapped_file_new          (const(gchar)  *filename,
                             gboolean      writable,
                             GError      **error);

    GMappedFile *g_mapped_file_new_from_fd  (gint          fd,
                         gboolean      writable,
                         GError      **error);

    gsize        g_mapped_file_get_length   (GMappedFile  *file);

    gchar       *g_mapped_file_get_contents (GMappedFile  *file);

    GBytes *     g_mapped_file_get_bytes    (GMappedFile  *file);

    GMappedFile *g_mapped_file_ref          (GMappedFile  *file);

    void         g_mapped_file_unref        (GMappedFile  *file);

    deprecated("use g_mapped_file_unref")
    void         g_mapped_file_free         (GMappedFile  *file);

}
