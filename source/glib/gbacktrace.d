/*
 * Distributed under the Boost Software License, Version 1.0.
 *    (See accompanying file LICENSE_1_0.txt or copy at
 *          http://www.boost.org/LICENSE_1_0.txt)
 */
module glib.gbacktrace;

import glib.gtypes;

extern(C)
{
    void g_on_error_query (const(gchar) *prg_name);
    void g_on_error_stack_trace (const(gchar) *prg_name);
}

// TODO: check this
void G_BREAKPOINT() { asm { int 03; } }


// #if (defined (__i386__) || defined (__x86_64__)) && defined (__GNUC__) && __GNUC__ >= 2
// #  define G_BREAKPOINT()        G_STMT_START{ __asm__ __volatile__ ("int $03"); }G_STMT_END
// #elif (defined (_MSC_VER) || defined (__DMC__)) && defined (_M_IX86)
// #  define G_BREAKPOINT()        G_STMT_START{ __asm int 3h }G_STMT_END
// #elif defined (_MSC_VER)
// #  define G_BREAKPOINT()        G_STMT_START{ __debugbreak(); }G_STMT_END
// #elif defined (__alpha__) && !defined(__osf__) && defined (__GNUC__) && __GNUC__ >= 2
// #  define G_BREAKPOINT()        G_STMT_START{ __asm__ __volatile__ ("bpt"); }G_STMT_END
// #else   /* !__i386__ && !__alpha__ */
// #  define G_BREAKPOINT()        G_STMT_START{ raise (SIGTRAP); }G_STMT_END
// #endif  /* __i386__ */
