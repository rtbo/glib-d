module glib.gthread;

import glib.gtypes;
import glib.gatomic;
import glib.gerror;


//enum G_THREAD_ERROR = g_thread_error_quark();

extern(C) GQuark g_thread_error_quark ();

enum GThreadError
{
  G_THREAD_ERROR_AGAIN /* Resource temporarily unavailable */
}

extern(C) alias GThreadFunc = gpointer function(gpointer data);

struct GThread;

union GMutex
{
  gpointer p;
  guint[2] i;
}

struct GRWLock
{
  gpointer p;
  guint[2] i;
}

struct GCond
{
  gpointer p;
  guint[2] i;
}

struct GRecMutex
{
  gpointer p;
  guint[2] i;
}

auto G_PRIVATE_INIT(N)(N notify) {
    return GPrivate(null, notify, [ null, null ]);
}

struct GPrivate
{
  gpointer       p;
  GDestroyNotify notify;
  gpointer[2] future;
}

enum GOnceStatus
{
  G_ONCE_STATUS_NOTCALLED,
  G_ONCE_STATUS_PROGRESS,
  G_ONCE_STATUS_READY
}


auto G_ONCE_INIT() {
    return GOnce(GOnceStatus.G_ONCE_STATUS_NOTCALLED, null);
}

struct GOnce
{
  GOnceStatus status;
  gpointer retval;
}

// #define G_LOCK_NAME(name)             g__ ## name ## _lock
// #define G_LOCK_DEFINE_STATIC(name)    static G_LOCK_DEFINE (name)
// #define G_LOCK_DEFINE(name)           GMutex G_LOCK_NAME (name)
// #define G_LOCK_EXTERN(name)           extern GMutex G_LOCK_NAME (name)
//
// #ifdef G_DEBUG_LOCKS
// #  define G_LOCK(name)                G_STMT_START{             \
//       g_log (G_LOG_DOMAIN, G_LOG_LEVEL_DEBUG,                   \
//              "file %s: line %d (%s): locking: %s ",             \
//              __FILE__,        __LINE__, G_STRFUNC,              \
//              #name);                                            \
//       g_mutex_lock (&G_LOCK_NAME (name));                       \
//    }G_STMT_END
// #  define G_UNLOCK(name)              G_STMT_START{             \
//       g_log (G_LOG_DOMAIN, G_LOG_LEVEL_DEBUG,                   \
//              "file %s: line %d (%s): unlocking: %s ",           \
//              __FILE__,        __LINE__, G_STRFUNC,              \
//              #name);                                            \
//      g_mutex_unlock (&G_LOCK_NAME (name));                      \
//    }G_STMT_END
// #  define G_TRYLOCK(name)                                       \
//       (g_log (G_LOG_DOMAIN, G_LOG_LEVEL_DEBUG,                  \
//              "file %s: line %d (%s): try locking: %s ",         \
//              __FILE__,        __LINE__, G_STRFUNC,              \
//              #name), g_mutex_trylock (&G_LOCK_NAME (name)))
// #else  /* !G_DEBUG_LOCKS */
// #  define G_LOCK(name) g_mutex_lock       (&G_LOCK_NAME (name))
// #  define G_UNLOCK(name) g_mutex_unlock   (&G_LOCK_NAME (name))
// #  define G_TRYLOCK(name) g_mutex_trylock (&G_LOCK_NAME (name))
// #endif /* !G_DEBUG_LOCKS */

extern(C) {

    GThread * g_thread_ref (GThread *thread);

    void g_thread_unref (GThread *thread);

    GThread * g_thread_new (const(gchar) *name,
                            GThreadFunc func,
                            gpointer data);

    GThread * g_thread_try_new (const(gchar) *name,
                                GThreadFunc func,
                                gpointer data,
                                GError **error);

    GThread * g_thread_self ();

    void g_thread_exit (gpointer retval);

    gpointer g_thread_join (GThread *thread);

    void g_thread_yield ();



    void g_mutex_init (GMutex *mutex);

    void g_mutex_clear (GMutex *mutex);

    void g_mutex_lock (GMutex *mutex);

    gboolean g_mutex_trylock (GMutex *mutex);

    void g_mutex_unlock (GMutex *mutex);


    void g_rw_lock_init (GRWLock *rw_lock);

    void g_rw_lock_clear (GRWLock *rw_lock);

    void g_rw_lock_writer_lock (GRWLock *rw_lock);

    gboolean g_rw_lock_writer_trylock (GRWLock *rw_lock);

    void g_rw_lock_writer_unlock (GRWLock *rw_lock);

    void g_rw_lock_reader_lock (GRWLock *rw_lock);

    gboolean g_rw_lock_reader_trylock (GRWLock *rw_lock);

    void g_rw_lock_reader_unlock (GRWLock *rw_lock);


    void g_rec_mutex_init (GRecMutex *rec_mutex);

    void g_rec_mutex_clear (GRecMutex *rec_mutex);

    void g_rec_mutex_lock (GRecMutex *rec_mutex);

    gboolean g_rec_mutex_trylock (GRecMutex *rec_mutex);

    void g_rec_mutex_unlock (GRecMutex *rec_mutex);


    void g_cond_init (GCond *cond);

    void g_cond_clear (GCond *cond);

    void g_cond_wait (GCond *cond, GMutex *mutex);

    void g_cond_signal (GCond *cond);

    void g_cond_broadcast (GCond *cond);

    gboolean g_cond_wait_until (GCond *cond, GMutex *mutex, gint64 end_time);


    gpointer g_private_get (GPrivate *key);

    void g_private_set (GPrivate *key, gpointer value);

    void g_private_replace (GPrivate *key, gpointer value);


    gpointer g_once_impl (GOnce *once, GThreadFunc func, gpointer arg);

    gboolean g_once_init_enter (void  *location);

    void g_once_init_leave (void  *location, gsize result);

// #ifdef G_ATOMIC_OP_MEMORY_BARRIER_NEEDED
// # define g_once(once, func, arg) g_once_impl ((once), (func), (arg))
// #else /* !G_ATOMIC_OP_MEMORY_BARRIER_NEEDED*/
// # define g_once(once, func, arg) \
//   (((once)->status == G_ONCE_STATUS_READY) ? \
//    (once)->retval : \
//    g_once_impl ((once), (func), (arg)))
// #endif /* G_ATOMIC_OP_MEMORY_BARRIER_NEEDED */
//
// #ifdef __GNUC__
// # define g_once_init_enter(location) \
//   (G_GNUC_EXTENSION ({                                               \
//     G_STATIC_ASSERT (sizeof *(location) == sizeof (gpointer));       \
//     (void) (0 ? (gpointer) *(location) : 0);                         \
//     (!g_atomic_pointer_get (location) &&                             \
//      g_once_init_enter (location));                                  \
//   }))
// # define g_once_init_leave(location, result) \
//   (G_GNUC_EXTENSION ({                                               \
//     G_STATIC_ASSERT (sizeof *(location) == sizeof (gpointer));       \
//     (void) (0 ? *(location) = (result) : 0);                         \
//     g_once_init_leave ((location), (gsize) (result));                \
//   }))
// #else
// # define g_once_init_enter(location) \
//   (g_once_init_enter((location)))
// # define g_once_init_leave(location, result) \
//   (g_once_init_leave((location), (gsize) (result)))
// #endif


    guint g_get_num_processors ();

} // extern(C)
