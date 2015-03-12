module glib.gasyncqueue;

import glib.gtypes;
import glib.gthread;



struct GAsyncQueue;

extern(C) {

    GAsyncQueue *g_async_queue_new ();

    GAsyncQueue *g_async_queue_new_full (GDestroyNotify item_free_func);

    void g_async_queue_lock (GAsyncQueue *queue);

    void g_async_queue_unlock (GAsyncQueue *queue);

    GAsyncQueue *g_async_queue_ref (GAsyncQueue *queue);

    void g_async_queue_unref (GAsyncQueue *queue);

    deprecated("use g_async_queue_ref")
    void g_async_queue_ref_unlocked (GAsyncQueue *queue);

    deprecated("use g_async_queue_unref")
    void g_async_queue_unref_and_unlock (GAsyncQueue *queue);


    void g_async_queue_push (GAsyncQueue *queue, gpointer data);

    void g_async_queue_push_unlocked (GAsyncQueue *queue, gpointer data);

    void g_async_queue_push_sorted (GAsyncQueue *queue,
                                    gpointer data,
                                    GCompareDataFunc func,
                                    gpointer user_data);

    void g_async_queue_push_sorted_unlocked (GAsyncQueue *queue,
                                             gpointer data,
                                             GCompareDataFunc func,
                                             gpointer user_data);

    gpointer g_async_queue_pop (GAsyncQueue *queue);

    gpointer g_async_queue_pop_unlocked (GAsyncQueue *queue);

    gpointer g_async_queue_try_pop (GAsyncQueue *queue);

    gpointer g_async_queue_try_pop_unlocked (GAsyncQueue *queue);

    gpointer g_async_queue_timeout_pop (GAsyncQueue *queue, guint64 timeout);

    gpointer g_async_queue_timeout_pop_unlocked (GAsyncQueue *queue,
                                                 guint64 timeout);

    gint g_async_queue_length (GAsyncQueue *queue);

    gint g_async_queue_length_unlocked (GAsyncQueue *queue);

    void g_async_queue_sort (GAsyncQueue *queue,
                             GCompareDataFunc func,
                             gpointer user_data);

    void g_async_queue_sort_unlocked (GAsyncQueue *queue,
                                      GCompareDataFunc func,
                                      gpointer user_data);

    deprecated("use g_async_queue_timeout_pop")
    gpointer g_async_queue_timed_pop (GAsyncQueue *queue, GTimeVal *end_time);

    deprecated("use g_async_queue_timeout_pop_unlocked")
    gpointer g_async_queue_timed_pop_unlocked (GAsyncQueue *queue,
                                               GTimeVal *end_time);

}

