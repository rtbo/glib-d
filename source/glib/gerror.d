module glib.gerror;

import glib.gtypes;
public import glib.gquark;
import core.stdc.stdlib;
import core.stdc.stdarg;



struct GError
{
    GQuark domain;
    gint code;
    gchar *message;
}


extern(C) {

    GError* g_error_new (GQuark domain,
                         gint code,
                         const(gchar) *format, ...);

    GError* g_error_new_literal (GQuark domain,
                                 gint code,
                                 const(gchar) *message);

    GError* g_error_new_valist (GQuark domain,
                                gint code,
                                const(gchar) *format,
                                va_list args);

    void g_error_free (GError *error);

    GError* g_error_copy (const(GError) *error);

    gboolean g_error_matches (const(GError) *error,
                              GQuark domain,
                              gint code);

    void g_set_error (GError **err,
                      GQuark domain,
                      gint code,
                      const(gchar) *format, ...);

    void g_set_error_literal (GError **err,
                              GQuark domain,
                              gint code,
                              const(gchar) *message);

    void g_propagate_error (GError **dest,
                            GError *src);

    void g_clear_error (GError **err);

    void g_prefix_error (GError **err, const(gchar) *format, ...);

    void g_propagate_prefixed_error (GError **dest, GError *src,
                                     const(gchar) *format, ...);

}

