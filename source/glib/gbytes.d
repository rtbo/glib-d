/*
 * Distributed under the Boost Software License, Version 1.0.
 *    (See accompanying file LICENSE_1_0.txt or copy at
 *          http://www.boost.org/LICENSE_1_0.txt)
 */
module glib.gbytes;

import glib.gtypes;
import glib.garray;

extern (C) {

    GBytes *       g_bytes_new                     (gconstpointer   data,
                                                    gsize           size);


    GBytes *       g_bytes_new_take                (gpointer        data,
                                                    gsize           size);


    GBytes *       g_bytes_new_static              (gconstpointer   data,
                                                    gsize           size);


    GBytes *       g_bytes_new_with_free_func      (gconstpointer   data,
                                                    gsize           size,
                                                    GDestroyNotify  free_func,
                                                    gpointer        user_data);


    GBytes *       g_bytes_new_from_bytes          (GBytes         *bytes,
                                                    gsize           offset,
                                                    gsize           length);


    gconstpointer  g_bytes_get_data                (GBytes         *bytes,
                                                    gsize          *size);


    gsize          g_bytes_get_size                (GBytes         *bytes);


    GBytes *       g_bytes_ref                     (GBytes         *bytes);


    void           g_bytes_unref                   (GBytes         *bytes);


    gpointer       g_bytes_unref_to_data           (GBytes         *bytes,
                                                    gsize          *size);


    GByteArray *   g_bytes_unref_to_array          (GBytes         *bytes);


    guint          g_bytes_hash                    (gconstpointer   bytes);


    gboolean       g_bytes_equal                   (gconstpointer   bytes1,
                                                    gconstpointer   bytes2);


    gint           g_bytes_compare                 (gconstpointer   bytes1,
                                                    gconstpointer   bytes2);

}

