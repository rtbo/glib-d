/*
 * Distributed under the Boost Software License, Version 1.0.
 *    (See accompanying file LICENSE_1_0.txt or copy at
 *          http://www.boost.org/LICENSE_1_0.txt)
 */
module glib.gslist;

import glib.gtypes;
import glib.gmem;
import glib.gnode;



struct GSList
{
    gpointer data;
    GSList *next;
}


extern (C) {

    GSList*  g_slist_alloc                   ();

    void     g_slist_free                    (GSList           *list);

    void     g_slist_free_1                  (GSList           *list);
    alias g_slist_free1 = g_slist_free_1;

    void     g_slist_free_full               (GSList           *list,
                          GDestroyNotify    free_func);

    GSList*  g_slist_append                  (GSList           *list,
                          gpointer          data);

    GSList*  g_slist_prepend                 (GSList           *list,
                          gpointer          data);

    GSList*  g_slist_insert                  (GSList           *list,
                          gpointer          data,
                          gint              position);

    GSList*  g_slist_insert_sorted           (GSList           *list,
                          gpointer          data,
                          GCompareFunc      func);

    GSList*  g_slist_insert_sorted_with_data (GSList           *list,
                          gpointer          data,
                          GCompareDataFunc  func,
                          gpointer          user_data);

    GSList*  g_slist_insert_before           (GSList           *slist,
                          GSList           *sibling,
                          gpointer          data);

    GSList*  g_slist_concat                  (GSList           *list1,
                          GSList           *list2);

    GSList*  g_slist_remove                  (GSList           *list,
                          gconstpointer     data);

    GSList*  g_slist_remove_all              (GSList           *list,
                          gconstpointer     data);

    GSList*  g_slist_remove_link             (GSList           *list,
                          GSList           *link_);

    GSList*  g_slist_delete_link             (GSList           *list,
                          GSList           *link_);

    GSList*  g_slist_reverse                 (GSList           *list);

    GSList*  g_slist_copy                    (GSList           *list);


    GSList*  g_slist_copy_deep               (GSList            *list,
                          GCopyFunc         func,
                          gpointer          user_data);

    GSList*  g_slist_nth                     (GSList           *list,
                          guint             n);

    GSList*  g_slist_find                    (GSList           *list,
                          gconstpointer     data);

    GSList*  g_slist_find_custom             (GSList           *list,
                          gconstpointer     data,
                          GCompareFunc      func);

    gint     g_slist_position                (GSList           *list,
                          GSList           *llink);

    gint     g_slist_index                   (GSList           *list,
                          gconstpointer     data);

    GSList*  g_slist_last                    (GSList           *list);

    guint    g_slist_length                  (GSList           *list);

    void     g_slist_foreach                 (GSList           *list,
                          GFunc             func,
                          gpointer          user_data);

    GSList*  g_slist_sort                    (GSList           *list,
                          GCompareFunc      compare_func);

    GSList*  g_slist_sort_with_data          (GSList           *list,
                          GCompareDataFunc  compare_func,
                          gpointer          user_data);

    gpointer g_slist_nth_data                (GSList           *list,
                          guint             n);


}

auto g_slist_next(S)(S slist) {
    return slist ? slist.next : null;
}

