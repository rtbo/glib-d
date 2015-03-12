module glib.gquark;

import glib.gtypes;


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
    mixin("extern(C) GQuark "~q_n~"_quark() {"~
            "static GQuark q;"
            "if (q==0) "
            "  q = g_quark_from_static_string(\""~QN~"\");"
            "return q;"
          "}");
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


