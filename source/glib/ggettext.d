module glib.ggettext;

import glib.gtypes;


extern (C) {

    const(gchar) *g_strip_context (const(gchar) *msgid,
                                   const(gchar) *msgval);


    const(gchar) *g_dgettext      (const(gchar) *domain,
                                   const(gchar) *msgid);

    const(gchar) *g_dcgettext     (const(gchar) *domain,
                                   const(gchar) *msgid,
                                   gint         category);

    const(gchar) *g_dngettext     (const(gchar) *domain,
                                   const(gchar) *msgid,
                                   const(gchar) *msgid_plural,
                                   gulong       n);

    const(gchar) *g_dpgettext     (const(gchar) *domain,
                                   const(gchar) *msgctxtid,
                                   gsize        msgidoffset);

    const(gchar) *g_dpgettext2    (const(gchar) *domain,
                                   const(gchar) *context,
                                   const(gchar) *msgid);

}

