/*
 * Distributed under the Boost Software License, Version 1.0.
 *    (See accompanying file LICENSE_1_0.txt or copy at
 *          http://www.boost.org/LICENSE_1_0.txt)
 */
module glib.gdataset;

import glib.gtypes;
import glib.gquark;


struct GData;


extern (C) {


    alias GDataForeachFunc = void function (GQuark         key_id,
                                            gpointer       data,
                                            gpointer       user_data);


    void     g_datalist_init                (GData            **datalist);

    void     g_datalist_clear               (GData            **datalist);

    gpointer g_datalist_id_get_data         (GData            **datalist,
                         GQuark             key_id);

    void     g_datalist_id_set_data_full    (GData            **datalist,
                         GQuark             key_id,
                         gpointer           data,
                         GDestroyNotify     destroy_func);

    alias GDuplicateFunc = gpointer function(gpointer data, gpointer user_data);


    gpointer g_datalist_id_dup_data         (GData            **datalist,
                                             GQuark             key_id,
                                             GDuplicateFunc     dup_func,
                         gpointer           user_data);

    gboolean g_datalist_id_replace_data     (GData            **datalist,
                                             GQuark             key_id,
                                             gpointer           oldval,
                                             gpointer           newval,
                                             GDestroyNotify     destroy,
                         GDestroyNotify    *old_destroy);


    gpointer g_datalist_id_remove_no_notify (GData            **datalist,
                         GQuark             key_id);

    void     g_datalist_foreach             (GData            **datalist,
                         GDataForeachFunc   func,
                         gpointer           user_data);



    void     g_datalist_set_flags           (GData            **datalist,
                         guint              flags);

    void     g_datalist_unset_flags         (GData            **datalist,
                         guint              flags);

    guint    g_datalist_get_flags           (GData            **datalist);

}

enum G_DATALIST_FLAGS_MASK = 0x3;

auto g_datalist_id_set_data(DL, Q, D)(DL dl, Q q, D d) {
    g_datalist_id_set_data_full(dl, q, d, null);
}

auto g_datalist_id_remove_data(DL, Q)(DL dl, Q q) {
    g_datalist_id_set_data(dl, q, null);
}

auto g_datalist_set_data_full(DL, K, D, F)(DL dl, K k, D d, F f) {
    g_datalist_id_set_data_full (dl, g_quark_from_string (k), d, f);
}

auto g_datalist_remove_no_notify(DL, K)(DK dl, K k) {
    return g_datalist_id_remove_no_notify (dl, g_quark_try_string (k));
}

auto g_datalist_set_data(DL, K, D)(DL dl, K k, D d) {
    g_datalist_set_data_full (dl, k, d, null);
}

auto g_datalist_remove_data(DL, K)(DL dl, K k) {
    g_datalist_id_set_data (dl, g_quark_try_string (k), null);
}

extern (C) {

    void      g_dataset_destroy             (gconstpointer    dataset_location);

    gpointer  g_dataset_id_get_data         (gconstpointer    dataset_location,
                                             GQuark           key_id);

    gpointer  g_datalist_get_data            (GData	 **datalist,
                          const(gchar) *key);

    void      g_dataset_id_set_data_full    (gconstpointer    dataset_location,
                                             GQuark           key_id,
                                             gpointer         data,
                                             GDestroyNotify   destroy_func);

    gpointer  g_dataset_id_remove_no_notify (gconstpointer    dataset_location,
                                             GQuark           key_id);

    void      g_dataset_foreach             (gconstpointer    dataset_location,
                                             GDataForeachFunc func,
                                             gpointer         user_data);

}

auto g_dataset_id_set_data(L, K, D)(L l, K k, D d) {
    g_dataset_id_set_data_full(l, k, d, null);
}

auto g_dataset_id_remove_data(L, K)(L l, K k) {
    g_dataset_id_set_data(l, k, null);
}

auto g_dataset_get_data(L, K)(L l, K k) {
    return g_dataset_id_get_data(l, g_quark_try_string(k));
}

auto g_dataset_set_data_full(L, K, D, F)(L l, K k, D d, F f) {
    g_dataset_id_set_data_full (l, g_quark_from_string (k), d, f);
}

auto g_dataset_remove_no_notify(L, K)(L dl, K k) {
    return g_dataset_id_remove_no_notify (l, g_quark_try_string (k));
}

auto g_dataset_set_data(L, K, D)(L l, K k, D d) {
    g_dataset_set_data_full (l, k, d, null);
}

auto g_dataset_remove_data(L, K)(L l, K k) {
    g_dataset_id_set_data (l, g_quark_try_string (k), null);
}

