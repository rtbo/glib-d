module glib.gstring;

import glib.gtypes;
import glib.gunicode;
import glib.garray;
import glib.gutils;

import core.stdc.stdarg;

struct GString
{
  gchar  *str;
  gsize len;
  gsize allocated_len;
}


/* -- optimize g_strig_append_c --- */
GString *g_string_append_c_inline (GString *gstr, gchar c)
{
    if (gstr.len+1 < gstr.allocated_len)
    {
        gstr.str[gstr.len++] = c;
        gstr.str[gstr.len] = 0;
    }
    else {
        g_string_insert_c(gstr, -1, c);
    }
    return gstr;
}




extern (C) {


    GString*     g_string_new               (const(gchar)     *init);

    GString*     g_string_new_len           (const(gchar)     *init,
                                             gssize           len);

    GString*     g_string_sized_new         (gsize            dfl_size);

    gchar*       g_string_free              (GString         *str,
                                             gboolean         free_segment);

    GBytes*      g_string_free_to_bytes     (GString         *str);

    gboolean     g_string_equal             (const(GString)   *v,
                                             const(GString)   *v2);

    guint        g_string_hash              (const(GString)   *str);

    GString*     g_string_assign            (GString         *str,
                                             const(gchar)     *rval);

    GString*     g_string_truncate          (GString         *str,
                                             gsize            len);

    GString*     g_string_set_size          (GString         *str,
                                             gsize            len);

    GString*     g_string_insert_len        (GString         *str,
                                             gssize           pos,
                                             const(gchar)     *val,
                                             gssize           len);

    GString*     g_string_append            (GString         *str,
                                             const(gchar)     *val);

    GString*     g_string_append_len        (GString         *str,
                                             const(gchar)     *val,
                                             gssize           len);

    GString*     g_string_append_c          (GString         *str,
                                             gchar            c);

    GString*     g_string_append_unichar    (GString         *str,
                                             gunichar         wc);

    GString*     g_string_prepend           (GString         *str,
                                             const(gchar)     *val);

    GString*     g_string_prepend_c         (GString         *str,
                                             gchar            c);

    GString*     g_string_prepend_unichar   (GString         *str,
                                             gunichar         wc);

    GString*     g_string_prepend_len       (GString         *str,
                                             const(gchar)     *val,
                                             gssize           len);

    GString*     g_string_insert            (GString         *str,
                                             gssize           pos,
                                             const(gchar)     *val);

    GString*     g_string_insert_c          (GString         *str,
                                             gssize           pos,
                                             gchar            c);

    GString*     g_string_insert_unichar    (GString         *str,
                                             gssize           pos,
                                             gunichar         wc);

    GString*     g_string_overwrite         (GString         *str,
                                             gsize            pos,
                                             const(gchar)     *val);

    GString*     g_string_overwrite_len     (GString         *str,
                                             gsize            pos,
                                             const(gchar)     *val,
                                             gssize           len);

    GString*     g_string_erase             (GString         *str,
                                             gssize           pos,
                                             gssize           len);

    GString*     g_string_ascii_down        (GString         *str);

    GString*     g_string_ascii_up          (GString         *str);

    void         g_string_vprintf           (GString         *str,
                                             const(gchar)     *format,
                                             va_list          args);

    void         g_string_printf            (GString         *str,
                                             const(gchar)     *format,
                                             ...);

    void         g_string_append_vprintf    (GString         *str,
                                             const(gchar)     *format,
                                             va_list          args);

    void         g_string_append_printf     (GString         *str,
                                             const(gchar)     *format,
                                             ...);

    GString*     g_string_append_uri_escaped (GString         *str,
                                              const(gchar)     *unescaped,
                                              const(gchar)     *reserved_chars_allowed,
                                              gboolean         allow_utf8);

    deprecated
    GString *g_string_down (GString *string);
    deprecated
    GString *g_string_up   (GString *string);

}

