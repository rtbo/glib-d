/*
 * Distributed under the Boost Software License, Version 1.0.
 *    (See accompanying file LICENSE_1_0.txt or copy at
 *          http://www.boost.org/LICENSE_1_0.txt)
 */
module glib.gquark;

import glib.gtypes;

import std.string : format;

alias GQuark = guint32;


extern (C) {
    GQuark g_quark_try_string (const(gchar) *str);

    GQuark g_quark_from_static_string (const(gchar) *str);

    GQuark g_quark_from_string (const(gchar) *str);

    const(gchar) * g_quark_to_string (GQuark quark);


    const(gchar) * g_intern_string (const(gchar) *str);

    const(gchar) * g_intern_static_string (const(gchar) *str);
}

// TODO: check this
mixin template G_DEFINE_QUARK(string QN, string q_n)
{
    mixin(q{
        extern(C) GQuark %s_quark() {
            static GQuark q;
            if (q==0)
                q = g_quark_from_static_string("%s");
            return q;
        }
    }.format(q_n, QN));
}
//#define G_DEFINE_QUARK(QN, q_n)                                         \
//    GQuark                                                                  \
//    q_n##_quark (void)                                                      \
//    {                                                                       \
//    static GQuark q;                                                      \
//                                                                        \
//    if G_UNLIKELY (q == 0)                                                \
//    q = g_quark_from_static_string (#QN);                               \
//                                                                        \
//    return q;                                                             \
//    }


