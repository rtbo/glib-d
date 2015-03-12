module glib.gqueue;

import glib.gtypes;
import glib.glist;



struct GQueue
{
    GList *head;
    GList *tail;
    guint  length;
}

// #define G_QUEUE_INIT { NULL, NULL, 0 }


extern (C) {

    GQueue*  g_queue_new            ();

    void     g_queue_free           (GQueue           *queue);

    void     g_queue_free_full      (GQueue           *queue,
                    GDestroyNotify    free_func);

    void     g_queue_init           (GQueue           *queue);

    void     g_queue_clear          (GQueue           *queue);

    gboolean g_queue_is_empty       (GQueue           *queue);

    guint    g_queue_get_length     (GQueue           *queue);

    void     g_queue_reverse        (GQueue           *queue);

    GQueue * g_queue_copy           (GQueue           *queue);

    void     g_queue_foreach        (GQueue           *queue,
                                     GFunc             func,
                                     gpointer          user_data);

    GList *  g_queue_find           (GQueue           *queue,
                                     gconstpointer     data);

    GList *  g_queue_find_custom    (GQueue           *queue,
                                     gconstpointer     data,
                                     GCompareFunc      func);

    void     g_queue_sort           (GQueue           *queue,
                                     GCompareDataFunc  compare_func,
                                     gpointer          user_data);


    void     g_queue_push_head      (GQueue           *queue,
                                     gpointer          data);

    void     g_queue_push_tail      (GQueue           *queue,
                                     gpointer          data);

    void     g_queue_push_nth       (GQueue           *queue,
                                     gpointer          data,
                                     gint              n);

    gpointer g_queue_pop_head       (GQueue           *queue);

    gpointer g_queue_pop_tail       (GQueue           *queue);

    gpointer g_queue_pop_nth        (GQueue           *queue,
                                     guint             n);

    gpointer g_queue_peek_head      (GQueue           *queue);

    gpointer g_queue_peek_tail      (GQueue           *queue);

    gpointer g_queue_peek_nth       (GQueue           *queue,
                                     guint             n);

    gint     g_queue_index          (GQueue           *queue,
                                     gconstpointer     data);

    gboolean g_queue_remove         (GQueue           *queue,
                                     gconstpointer     data);

    guint    g_queue_remove_all     (GQueue           *queue,
                                     gconstpointer     data);

    void     g_queue_insert_before  (GQueue           *queue,
                                     GList            *sibling,
                                     gpointer          data);

    void     g_queue_insert_after   (GQueue           *queue,
                                     GList            *sibling,
                                     gpointer          data);

    void     g_queue_insert_sorted  (GQueue           *queue,
                                     gpointer          data,
                                     GCompareDataFunc  func,
                                     gpointer          user_data);


    void     g_queue_push_head_link (GQueue           *queue,
                                     GList            *link_);

    void     g_queue_push_tail_link (GQueue           *queue,
                                     GList            *link_);

    void     g_queue_push_nth_link  (GQueue           *queue,
                                     gint              n,
                                     GList            *link_);

    GList*   g_queue_pop_head_link  (GQueue           *queue);

    GList*   g_queue_pop_tail_link  (GQueue           *queue);

    GList*   g_queue_pop_nth_link   (GQueue           *queue,
                                     guint             n);

    GList*   g_queue_peek_head_link (GQueue           *queue);

    GList*   g_queue_peek_tail_link (GQueue           *queue);

    GList*   g_queue_peek_nth_link  (GQueue           *queue,
                                     guint             n);

    gint     g_queue_link_index     (GQueue           *queue,
                                     GList            *link_);

    void     g_queue_unlink         (GQueue           *queue,
                                     GList            *link_);

    void     g_queue_delete_link    (GQueue           *queue,
                                     GList            *link_);

}

