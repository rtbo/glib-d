module glib.gatomic;

import glib.gtypes;

extern(C) {

    gint g_atomic_int_get (const(gint)*atomic);

    void g_atomic_int_set (gint *atomic, gint newval);

    void g_atomic_int_inc (gint *atomic);

    gboolean g_atomic_int_dec_and_test (gint *atomic);

    gboolean g_atomic_int_compare_and_exchange (gint *atomic,
                                                gint oldval, gint newval);

    gint g_atomic_int_add (gint  *atomic, gint val);

    guint g_atomic_int_and (guint *atomic, guint val);

    guint g_atomic_int_or (guint *atomic, guint val);

    guint g_atomic_int_xor (guint *atomic, guint val);


    gpointer g_atomic_pointer_get (const(void)*atomic);

    void g_atomic_pointer_set (void  *atomic, gpointer newval);

    gboolean g_atomic_pointer_compare_and_exchange (void *atomic,
                                                    gpointer oldval,
                                                    gpointer newval);

    gssize g_atomic_pointer_add (void *atomic, gssize val);

    gsize g_atomic_pointer_and (void *atomic, gsize val);

    gsize g_atomic_pointer_or (void *atomic, gsize val);

    gsize g_atomic_pointer_xor (void *atomic, gsize val);

    deprecated gint g_atomic_int_exchange_and_add (gint *atomic, gint val);

}

// #if defined(G_ATOMIC_LOCK_FREE) && defined(__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4)
//
// /* We prefer the new C11-style atomic extension of GCC if available */
// #if defined(__ATOMIC_SEQ_CST) && !defined(__clang__)
//
// #define g_atomic_int_get(atomic) \
//   (G_GNUC_EXTENSION ({                                                       \
//     G_STATIC_ASSERT (sizeof *(atomic) == sizeof (gint));                     \
//     (void) (0 ? *(atomic) ^ *(atomic) : 0);                                  \
//     (gint) __atomic_load_4 ((atomic), __ATOMIC_SEQ_CST);                     \
//   }))
// #define g_atomic_int_set(atomic, newval) \
//   (G_GNUC_EXTENSION ({                                                       \
//     G_STATIC_ASSERT (sizeof *(atomic) == sizeof (gint));                     \
//     (void) (0 ? *(atomic) ^ (newval) : 0);                                   \
//     __atomic_store_4 ((atomic), (newval), __ATOMIC_SEQ_CST);                 \
//   }))
//
// #if GLIB_SIZEOF_VOID_P == 8
//
// #define g_atomic_pointer_get(atomic) \
//   (G_GNUC_EXTENSION ({                                                       \
//     G_STATIC_ASSERT (sizeof *(atomic) == sizeof (gpointer));                 \
//     (gpointer) __atomic_load_8 ((atomic), __ATOMIC_SEQ_CST);                 \
//   }))
// #define g_atomic_pointer_set(atomic, newval) \
//   (G_GNUC_EXTENSION ({                                                       \
//     G_STATIC_ASSERT (sizeof *(atomic) == sizeof (gpointer));                 \
//     (void) (0 ? (gpointer) *(atomic) : 0);                                   \
//     __atomic_store_8 ((atomic), (gsize) (newval), __ATOMIC_SEQ_CST);         \
//   }))
//
// #else /* GLIB_SIZEOF_VOID_P == 8 */
//
// #define g_atomic_pointer_get(atomic) \
//   (G_GNUC_EXTENSION ({                                                       \
//     G_STATIC_ASSERT (sizeof *(atomic) == sizeof (gpointer));                 \
//     (gpointer) __atomic_load_4 ((atomic), __ATOMIC_SEQ_CST);                 \
//   }))
// #define g_atomic_pointer_set(atomic, newval) \
//   (G_GNUC_EXTENSION ({                                                       \
//     G_STATIC_ASSERT (sizeof *(atomic) == sizeof (gpointer));                 \
//     (void) (0 ? (gpointer) *(atomic) : 0);                                   \
//     __atomic_store_4 ((atomic), (gsize) (newval), __ATOMIC_SEQ_CST);         \
//   }))
//
// #endif /* GLIB_SIZEOF_VOID_P == 8 */
//
// #else /* defined(__ATOMIC_SEQ_CST) */
//
// #define g_atomic_int_get(atomic) \
//   (G_GNUC_EXTENSION ({                                                       \
//     G_STATIC_ASSERT (sizeof *(atomic) == sizeof (gint));                     \
//     (void) (0 ? *(atomic) ^ *(atomic) : 0);                                  \
//     __sync_synchronize ();                                                   \
//     (gint) *(atomic);                                                        \
//   }))
// #define g_atomic_int_set(atomic, newval) \
//   (G_GNUC_EXTENSION ({                                                       \
//     G_STATIC_ASSERT (sizeof *(atomic) == sizeof (gint));                     \
//     (void) (0 ? *(atomic) ^ (newval) : 0);                                   \
//     *(atomic) = (newval);                                                    \
//     __sync_synchronize ();                                                   \
//   }))
// #define g_atomic_pointer_get(atomic) \
//   (G_GNUC_EXTENSION ({                                                       \
//     G_STATIC_ASSERT (sizeof *(atomic) == sizeof (gpointer));                 \
//     __sync_synchronize ();                                                   \
//     (gpointer) *(atomic);                                                    \
//   }))
// #define g_atomic_pointer_set(atomic, newval) \
//   (G_GNUC_EXTENSION ({                                                       \
//     G_STATIC_ASSERT (sizeof *(atomic) == sizeof (gpointer));                 \
//     (void) (0 ? (gpointer) *(atomic) : 0);                                   \
//     *(atomic) = (__typeof__ (*(atomic))) (gsize) (newval);                   \
//     __sync_synchronize ();                                                   \
//   }))
//
// #endif /* !defined(__ATOMIC_SEQ_CST) */
//
// #define g_atomic_int_inc(atomic) \
//   (G_GNUC_EXTENSION ({                                                       \
//     G_STATIC_ASSERT (sizeof *(atomic) == sizeof (gint));                     \
//     (void) (0 ? *(atomic) ^ *(atomic) : 0);                                  \
//     (void) __sync_fetch_and_add ((atomic), 1);                               \
//   }))
// #define g_atomic_int_dec_and_test(atomic) \
//   (G_GNUC_EXTENSION ({                                                       \
//     G_STATIC_ASSERT (sizeof *(atomic) == sizeof (gint));                     \
//     (void) (0 ? *(atomic) ^ *(atomic) : 0);                                  \
//     __sync_fetch_and_sub ((atomic), 1) == 1;                                 \
//   }))
// #define g_atomic_int_compare_and_exchange(atomic, oldval, newval) \
//   (G_GNUC_EXTENSION ({                                                       \
//     G_STATIC_ASSERT (sizeof *(atomic) == sizeof (gint));                     \
//     (void) (0 ? *(atomic) ^ (newval) ^ (oldval) : 0);                        \
//     (gboolean) __sync_bool_compare_and_swap ((atomic), (oldval), (newval));  \
//   }))
// #define g_atomic_int_add(atomic, val) \
//   (G_GNUC_EXTENSION ({                                                       \
//     G_STATIC_ASSERT (sizeof *(atomic) == sizeof (gint));                     \
//     (void) (0 ? *(atomic) ^ (val) : 0);                                      \
//     (gint) __sync_fetch_and_add ((atomic), (val));                           \
//   }))
// #define g_atomic_int_and(atomic, val) \
//   (G_GNUC_EXTENSION ({                                                       \
//     G_STATIC_ASSERT (sizeof *(atomic) == sizeof (gint));                     \
//     (void) (0 ? *(atomic) ^ (val) : 0);                                      \
//     (guint) __sync_fetch_and_and ((atomic), (val));                          \
//   }))
// #define g_atomic_int_or(atomic, val) \
//   (G_GNUC_EXTENSION ({                                                       \
//     G_STATIC_ASSERT (sizeof *(atomic) == sizeof (gint));                     \
//     (void) (0 ? *(atomic) ^ (val) : 0);                                      \
//     (guint) __sync_fetch_and_or ((atomic), (val));                           \
//   }))
// #define g_atomic_int_xor(atomic, val) \
//   (G_GNUC_EXTENSION ({                                                       \
//     G_STATIC_ASSERT (sizeof *(atomic) == sizeof (gint));                     \
//     (void) (0 ? *(atomic) ^ (val) : 0);                                      \
//     (guint) __sync_fetch_and_xor ((atomic), (val));                          \
//   }))
//
// #define g_atomic_pointer_compare_and_exchange(atomic, oldval, newval) \
//   (G_GNUC_EXTENSION ({                                                       \
//     G_STATIC_ASSERT (sizeof *(atomic) == sizeof (gpointer));                 \
//     (void) (0 ? (gpointer) *(atomic) : 0);                                   \
//     (gboolean) __sync_bool_compare_and_swap ((atomic), (oldval), (newval));  \
//   }))
// #define g_atomic_pointer_add(atomic, val) \
//   (G_GNUC_EXTENSION ({                                                       \
//     G_STATIC_ASSERT (sizeof *(atomic) == sizeof (gpointer));                 \
//     (void) (0 ? (gpointer) *(atomic) : 0);                                   \
//     (void) (0 ? (val) ^ (val) : 0);                                          \
//     (gssize) __sync_fetch_and_add ((atomic), (val));                         \
//   }))
// #define g_atomic_pointer_and(atomic, val) \
//   (G_GNUC_EXTENSION ({                                                       \
//     G_STATIC_ASSERT (sizeof *(atomic) == sizeof (gpointer));                 \
//     (void) (0 ? (gpointer) *(atomic) : 0);                                   \
//     (void) (0 ? (val) ^ (val) : 0);                                          \
//     (gsize) __sync_fetch_and_and ((atomic), (val));                          \
//   }))
// #define g_atomic_pointer_or(atomic, val) \
//   (G_GNUC_EXTENSION ({                                                       \
//     G_STATIC_ASSERT (sizeof *(atomic) == sizeof (gpointer));                 \
//     (void) (0 ? (gpointer) *(atomic) : 0);                                   \
//     (void) (0 ? (val) ^ (val) : 0);                                          \
//     (gsize) __sync_fetch_and_or ((atomic), (val));                           \
//   }))
// #define g_atomic_pointer_xor(atomic, val) \
//   (G_GNUC_EXTENSION ({                                                       \
//     G_STATIC_ASSERT (sizeof *(atomic) == sizeof (gpointer));                 \
//     (void) (0 ? (gpointer) *(atomic) : 0);                                   \
//     (void) (0 ? (val) ^ (val) : 0);                                          \
//     (gsize) __sync_fetch_and_xor ((atomic), (val));                          \
//   }))
//
// #else /* defined(G_ATOMIC_LOCK_FREE) && defined(__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4) */
//
// #define g_atomic_int_get(atomic) \
//   (g_atomic_int_get ((gint *) (atomic)))
// #define g_atomic_int_set(atomic, newval) \
//   (g_atomic_int_set ((gint *) (atomic), (gint) (newval)))
// #define g_atomic_int_compare_and_exchange(atomic, oldval, newval) \
//   (g_atomic_int_compare_and_exchange ((gint *) (atomic), (oldval), (newval)))
// #define g_atomic_int_add(atomic, val) \
//   (g_atomic_int_add ((gint *) (atomic), (val)))
// #define g_atomic_int_and(atomic, val) \
//   (g_atomic_int_and ((guint *) (atomic), (val)))
// #define g_atomic_int_or(atomic, val) \
//   (g_atomic_int_or ((guint *) (atomic), (val)))
// #define g_atomic_int_xor(atomic, val) \
//   (g_atomic_int_xor ((guint *) (atomic), (val)))
// #define g_atomic_int_inc(atomic) \
//   (g_atomic_int_inc ((gint *) (atomic)))
// #define g_atomic_int_dec_and_test(atomic) \
//   (g_atomic_int_dec_and_test ((gint *) (atomic)))
//
// #define g_atomic_pointer_get(atomic) \
//   (g_atomic_pointer_get (atomic))
// #define g_atomic_pointer_set(atomic, newval) \
//   (g_atomic_pointer_set ((atomic), (gpointer) (newval)))
// #define g_atomic_pointer_compare_and_exchange(atomic, oldval, newval) \
//   (g_atomic_pointer_compare_and_exchange ((atomic), (gpointer) (oldval), (gpointer) (newval)))
// #define g_atomic_pointer_add(atomic, val) \
//   (g_atomic_pointer_add ((atomic), (gssize) (val)))
// #define g_atomic_pointer_and(atomic, val) \
//   (g_atomic_pointer_and ((atomic), (gsize) (val)))
// #define g_atomic_pointer_or(atomic, val) \
//   (g_atomic_pointer_or ((atomic), (gsize) (val)))
// #define g_atomic_pointer_xor(atomic, val) \
//   (g_atomic_pointer_xor ((atomic), (gsize) (val)))
//
// #endif /* defined(__GNUC__) && defined(G_ATOMIC_OP_USE_GCC_BUILTINS) */
//
