module glib.gthreadpool;

import glib.gtypes;
import glib.gthread;
import glib.gerror;


struct GThreadPool
{
  GFunc func;
  gpointer user_data;
  gboolean exclusive;
}

extern (C) {


    GThreadPool *   g_thread_pool_new               (GFunc            func,
                                                     gpointer         user_data,
                                                     gint             max_threads,
                                                     gboolean         exclusive,
                                                     GError         **error);

    void            g_thread_pool_free              (GThreadPool     *pool,
                                                     gboolean         immediate,
                                                     gboolean         wait_);

    gboolean        g_thread_pool_push              (GThreadPool     *pool,
                                                     gpointer         data,
                                                     GError         **error);

    guint           g_thread_pool_unprocessed       (GThreadPool     *pool);

    void            g_thread_pool_set_sort_function (GThreadPool      *pool,
                                                     GCompareDataFunc  func,
                                                     gpointer          user_data);

    gboolean        g_thread_pool_set_max_threads   (GThreadPool     *pool,
                                                     gint             max_threads,
                                                     GError         **error);

    gint            g_thread_pool_get_max_threads   (GThreadPool     *pool);

    guint           g_thread_pool_get_num_threads   (GThreadPool     *pool);


    void            g_thread_pool_set_max_unused_threads (gint  max_threads);

    gint            g_thread_pool_get_max_unused_threads ();

    guint           g_thread_pool_get_num_unused_threads ();

    void            g_thread_pool_stop_unused_threads    ();

    void            g_thread_pool_set_max_idle_time      (guint interval);

    guint           g_thread_pool_get_max_idle_time      ();

}

