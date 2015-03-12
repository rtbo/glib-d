module glib.gmain;

import glib.gtypes;
import glib.gpoll;
import glib.gslist;
import glib.gthread;


enum GIOCondition
{
    G_IO_IN,
    G_IO_OUT,
    G_IO_PRI,
    G_IO_ERR,
    G_IO_HUP,
    G_IO_NVAL
}




struct GMainContext;

struct GMainLoop;


extern (C) alias GSourceFunc = gboolean function (gpointer user_data);

extern (C) alias GChildWatchFunc = void function (GPid     pid,
                                       gint     status,
                                       gpointer user_data);


private struct GSourcePrivate;

struct GSource
{
    gpointer callback_data;
    GSourceCallbackFuncs *callback_funcs;

    const GSourceFuncs *source_funcs;
    guint ref_count;

    GMainContext *context;

    gint priority;
    guint flags;
    guint source_id;

    GSList *poll_fds;

    GSource *prev;
    GSource *next;

    char    *name;

    GSourcePrivate *priv;
}

extern (C) {

    struct GSourceCallbackFuncs
    {
        void function (gpointer cb_data) ref_;
        void function (gpointer cb_data) unref;
        void function (gpointer     cb_data,
                     GSource     *source,
                     GSourceFunc *func,
                     gpointer    *data) get;
    };

    alias GSourceDummyMarshal = void function();

    struct GSourceFuncs
    {
        gboolean function (GSource    *source,
                            gint       *timeout_) prepare;
        gboolean function    (GSource    *source) check;
        gboolean function (GSource    *source,
                            GSourceFunc callback,
                            gpointer    user_data) dispatch;
        void     function (GSource    *source) finalize;

        GSourceFunc     closure_callback;
        GSourceDummyMarshal closure_marshal;
    }
}

enum G_PRIORITY_HIGH = -100;

enum G_PRIORITY_DEFAULT = 0;

enum G_PRIORITY_HIGH_IDLE = 100;

enum G_PRIORITY_DEFAULT_IDLE = 200;

enum G_PRIORITY_LOW = 300;

enum G_SOURCE_REMOVE = FALSE;

enum G_SOURCE_CONTINUE = TRUE;



extern (C) {

    GMainContext *g_main_context_new       ();

    GMainContext *g_main_context_ref       (GMainContext *context);

    void          g_main_context_unref     (GMainContext *context);

    GMainContext *g_main_context_default   ();


    gboolean      g_main_context_iteration (GMainContext *context,
                                            gboolean      may_block);

    gboolean      g_main_context_pending   (GMainContext *context);

    /* For implementation of legacy interfaces
     */

    GSource      *g_main_context_find_source_by_id              (GMainContext *context,
                                                                 guint         source_id);

    GSource      *g_main_context_find_source_by_user_data       (GMainContext *context,
                                                                 gpointer      user_data);

    GSource      *g_main_context_find_source_by_funcs_user_data (GMainContext *context,
                                                                 GSourceFuncs *funcs,
                                                                 gpointer      user_data);

    /* Low level functions for implementing custom main loops.
     */

    void     g_main_context_wakeup  (GMainContext *context);

    gboolean g_main_context_acquire (GMainContext *context);

    void     g_main_context_release (GMainContext *context);

    gboolean g_main_context_is_owner (GMainContext *context);

    gboolean g_main_context_wait    (GMainContext *context,
                                     GCond        *cond,
                                     GMutex       *mutex);


    gboolean g_main_context_prepare  (GMainContext *context,
                                      gint         *priority);

    gint     g_main_context_query    (GMainContext *context,
                                      gint          max_priority,
                                      gint         *timeout_,
                                      GPollFD      *fds,
                                      gint          n_fds);

    gint     g_main_context_check    (GMainContext *context,
                                      gint          max_priority,
                                      GPollFD      *fds,
                                      gint          n_fds);

    void     g_main_context_dispatch (GMainContext *context);


    void     g_main_context_set_poll_func (GMainContext *context,
                                           GPollFunc     func);

    GPollFunc g_main_context_get_poll_func (GMainContext *context);

    /* Low level functions for use by source implementations
     */

    void     g_main_context_add_poll    (GMainContext *context,
                                         GPollFD      *fd,
                                         gint          priority);

    void     g_main_context_remove_poll (GMainContext *context,
                                         GPollFD      *fd);


    gint     g_main_depth               ();

    GSource *g_main_current_source      ();

    /* GMainContexts for other threads
     */

    void          g_main_context_push_thread_default (GMainContext *context);

    void          g_main_context_pop_thread_default  (GMainContext *context);

    GMainContext *g_main_context_get_thread_default  ();

    GMainContext *g_main_context_ref_thread_default  ();

    /* GMainLoop: */


    GMainLoop *g_main_loop_new        (GMainContext *context,
                                       gboolean      is_running);

    void       g_main_loop_run        (GMainLoop    *loop);

    void       g_main_loop_quit       (GMainLoop    *loop);

    GMainLoop *g_main_loop_ref        (GMainLoop    *loop);

    void       g_main_loop_unref      (GMainLoop    *loop);

    gboolean   g_main_loop_is_running (GMainLoop    *loop);

    GMainContext *g_main_loop_get_context (GMainLoop    *loop);

    /* GSource: */


    GSource *g_source_new             (GSourceFuncs   *source_funcs,
                                       guint           struct_size);

    GSource *g_source_ref             (GSource        *source);

    void     g_source_unref           (GSource        *source);


    guint    g_source_attach          (GSource        *source,
                                       GMainContext   *context);

    void     g_source_destroy         (GSource        *source);


    void     g_source_set_priority    (GSource        *source,
                                       gint            priority);

    gint     g_source_get_priority    (GSource        *source);

    void     g_source_set_can_recurse (GSource        *source,
                                       gboolean        can_recurse);

    gboolean g_source_get_can_recurse (GSource        *source);

    guint    g_source_get_id          (GSource        *source);


    GMainContext *g_source_get_context (GSource       *source);


    void     g_source_set_callback    (GSource        *source,
                                       GSourceFunc     func,
                                       gpointer        data,
                                       GDestroyNotify  notify);


    void     g_source_set_funcs       (GSource        *source,
                                       GSourceFuncs   *funcs);

    gboolean g_source_is_destroyed    (GSource        *source);


    void                 g_source_set_name       (GSource        *source,
                                                  const(char)    *name);

    const(char) *        g_source_get_name       (GSource        *source);

    void                 g_source_set_name_by_id (guint           tag,
                                                  const(char)    *name);


    void                 g_source_set_ready_time (GSource        *source,
                                                  gint64          ready_time);

    gint64               g_source_get_ready_time (GSource        *source);

    version(Posix) {

        gpointer             g_source_add_unix_fd    (GSource        *source,
                                                      gint            fd,
                                                      GIOCondition    events);

        void                 g_source_modify_unix_fd (GSource        *source,
                                                      gpointer        tag,
                                                      GIOCondition    new_events);

        void                 g_source_remove_unix_fd (GSource        *source,
                                                      gpointer        tag);

        GIOCondition         g_source_query_unix_fd  (GSource        *source,
                                                      gpointer        tag);
    }


    void g_source_set_callback_indirect (GSource              *source,
                                         gpointer              callback_data,
                                         GSourceCallbackFuncs *callback_funcs);


    void     g_source_add_poll            (GSource        *source,
                           GPollFD        *fd);

    void     g_source_remove_poll         (GSource        *source,
                           GPollFD        *fd);


    void     g_source_add_child_source    (GSource        *source,
                           GSource        *child_source);

    void     g_source_remove_child_source (GSource        *source,
                           GSource        *child_source);

    deprecated("use g_source_get_time")
    void     g_source_get_current_time (GSource        *source,
                                        GTimeVal       *timeval);


    gint64   g_source_get_time         (GSource        *source);

     /* void g_source_connect_closure (GSource        *source,
                                      GClosure       *closure);
     */


    GSource *g_idle_source_new        ();

    GSource *g_child_watch_source_new (GPid pid);

    GSource *g_timeout_source_new     (guint interval);

    GSource *g_timeout_source_new_seconds (guint interval);

    /* Miscellaneous functions
     */

    void   g_get_current_time                 (GTimeVal       *result);

    gint64 g_get_monotonic_time               ();

    gint64 g_get_real_time                    ();


    /* Source manipulation by ID */

    gboolean g_source_remove                     (guint          tag);

    gboolean g_source_remove_by_user_data        (gpointer       user_data);

    gboolean g_source_remove_by_funcs_user_data  (GSourceFuncs  *funcs,
                                                  gpointer       user_data);

    /* Idles, child watchers and timeouts */

    guint    g_timeout_add_full         (gint            priority,
                                         guint           interval,
                                         GSourceFunc     func,
                                         gpointer        data,
                                         GDestroyNotify  notify);

    guint    g_timeout_add              (guint           interval,
                                         GSourceFunc     func,
                                         gpointer        data);

    guint    g_timeout_add_seconds_full (gint            priority,
                                         guint           interval,
                                         GSourceFunc     func,
                                         gpointer        data,
                                         GDestroyNotify  notify);

    guint    g_timeout_add_seconds      (guint           interval,
                                         GSourceFunc     func,
                                         gpointer        data);

    guint    g_child_watch_add_full     (gint            priority,
                                         GPid            pid,
                                         GChildWatchFunc func,
                                         gpointer        data,
                                         GDestroyNotify  notify);

    guint    g_child_watch_add          (GPid            pid,
                                         GChildWatchFunc func,
                                         gpointer        data);

    guint    g_idle_add                 (GSourceFunc     func,
                                         gpointer        data);

    guint    g_idle_add_full            (gint            priority,
                                         GSourceFunc     func,
                                         gpointer        data,
                                         GDestroyNotify  notify);

    gboolean g_idle_remove_by_data      (gpointer        data);


    void     g_main_context_invoke_full (GMainContext   *context,
                                         gint            priority,
                                         GSourceFunc     func,
                                         gpointer        data,
                                         GDestroyNotify  notify);

    void     g_main_context_invoke      (GMainContext   *context,
                                         GSourceFunc     func,
                                         gpointer        data);

    /* Hook for GClosure / GSource integration. Don't touch */
    extern __gshared GSourceFuncs g_timeout_funcs;
    extern __gshared GSourceFuncs g_child_watch_funcs;
    extern __gshared GSourceFuncs g_idle_funcs;
    version (Posix) {
        extern __gshared GSourceFuncs g_unix_signal_funcs;
        extern __gshared GSourceFuncs g_unix_fd_source_funcs;
    }
}

