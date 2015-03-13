/*
 * Distributed under the Boost Software License, Version 1.0.
 *    (See accompanying file LICENSE_1_0.txt or copy at
 *          http://www.boost.org/LICENSE_1_0.txt)
 */
module glib.gstringchunk;

import glib.gtypes;


struct GStringChunk;

extern (C) {

    GStringChunk* g_string_chunk_new          (gsize size);

    void          g_string_chunk_free         (GStringChunk *chunk);

    void          g_string_chunk_clear        (GStringChunk *chunk);

    gchar*        g_string_chunk_insert       (GStringChunk *chunk,
                                               const(gchar)  *str);

    gchar*        g_string_chunk_insert_len   (GStringChunk *chunk,
                                               const(gchar)  *str,
                                               gssize        len);

    gchar*        g_string_chunk_insert_const (GStringChunk *chunk,
                                               const(gchar)  *str);

}

