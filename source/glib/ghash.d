/*
 * Distributed under the Boost Software License, Version 1.0.
 *    (See accompanying file LICENSE_1_0.txt or copy at
 *          http://www.boost.org/LICENSE_1_0.txt)
 */
module glib.ghash;

import glib.gtypes;
import glib.glist;


struct GHashTable;

struct GHashTableIter
{
    gpointer      dummy1;
    gpointer      dummy2;
    gpointer      dummy3;
    int           dummy4;
    gboolean      dummy5;
    gpointer      dummy6;
}


extern (C) {

    alias GHRFunc = gboolean function (gpointer key,
                                       gpointer value,
                                       gpointer user_data);

    GHashTable* g_hash_table_new               (GHashFunc       hash_func,
                                                GEqualFunc      key_equal_func);

    GHashTable* g_hash_table_new_full          (GHashFunc       hash_func,
                                                GEqualFunc      key_equal_func,
                                                GDestroyNotify  key_destroy_func,
                                                GDestroyNotify  value_destroy_func);

    void        g_hash_table_destroy           (GHashTable     *hash_table);

    gboolean    g_hash_table_insert            (GHashTable     *hash_table,
                                                gpointer        key,
                                                gpointer        value);

    gboolean    g_hash_table_replace           (GHashTable     *hash_table,
                                                gpointer        key,
                                                gpointer        value);

    gboolean    g_hash_table_add               (GHashTable     *hash_table,
                                                gpointer        key);

    gboolean    g_hash_table_remove            (GHashTable     *hash_table,
                                                gconstpointer   key);

    void        g_hash_table_remove_all        (GHashTable     *hash_table);

    gboolean    g_hash_table_steal             (GHashTable     *hash_table,
                                                gconstpointer   key);

    void        g_hash_table_steal_all         (GHashTable     *hash_table);

    gpointer    g_hash_table_lookup            (GHashTable     *hash_table,
                                                gconstpointer   key);

    gboolean    g_hash_table_contains          (GHashTable     *hash_table,
                                                gconstpointer   key);

    gboolean    g_hash_table_lookup_extended   (GHashTable     *hash_table,
                                                gconstpointer   lookup_key,
                                                gpointer       *orig_key,
                                                gpointer       *value);

    void        g_hash_table_foreach           (GHashTable     *hash_table,
                                                GHFunc          func,
                                                gpointer        user_data);

    gpointer    g_hash_table_find              (GHashTable     *hash_table,
                                                GHRFunc         predicate,
                                                gpointer        user_data);

    guint       g_hash_table_foreach_remove    (GHashTable     *hash_table,
                                                GHRFunc         func,
                                                gpointer        user_data);

    guint       g_hash_table_foreach_steal     (GHashTable     *hash_table,
                                                GHRFunc         func,
                                                gpointer        user_data);

    guint       g_hash_table_size              (GHashTable     *hash_table);

    GList *     g_hash_table_get_keys          (GHashTable     *hash_table);

    GList *     g_hash_table_get_values        (GHashTable     *hash_table);

    gpointer *  g_hash_table_get_keys_as_array (GHashTable     *hash_table,
                                                guint          *length);


    void        g_hash_table_iter_init         (GHashTableIter *iter,
                                                GHashTable     *hash_table);

    gboolean    g_hash_table_iter_next         (GHashTableIter *iter,
                                                gpointer       *key,
                                                gpointer       *value);

    GHashTable* g_hash_table_iter_get_hash_table (GHashTableIter *iter);

    void        g_hash_table_iter_remove       (GHashTableIter *iter);

    void        g_hash_table_iter_replace      (GHashTableIter *iter,
                                                gpointer        value);

    void        g_hash_table_iter_steal        (GHashTableIter *iter);


    GHashTable* g_hash_table_ref               (GHashTable     *hash_table);

    void        g_hash_table_unref             (GHashTable     *hash_table);



    gboolean g_str_equal    (gconstpointer  v1,
                             gconstpointer  v2);

    guint    g_str_hash     (gconstpointer  v);


    gboolean g_int_equal    (gconstpointer  v1,
                             gconstpointer  v2);

    guint    g_int_hash     (gconstpointer  v);


    gboolean g_int64_equal  (gconstpointer  v1,
                             gconstpointer  v2);

    guint    g_int64_hash   (gconstpointer  v);


    gboolean g_double_equal (gconstpointer  v1,
                             gconstpointer  v2);

    guint    g_double_hash  (gconstpointer  v);


    guint    g_direct_hash  (gconstpointer  v);

    gboolean g_direct_equal (gconstpointer  v1,
                             gconstpointer  v2);

}

