/*
 * Distributed under the Boost Software License, Version 1.0.
 *    (See accompanying file LICENSE_1_0.txt or copy at
 *          http://www.boost.org/LICENSE_1_0.txt)
 */
module glib.gvariant;

import glib.gtypes;
import glib.gvarianttype;
import glib.gstring;
import glib.gbytes;
import glib.gquark;
import glib.garray;
import glib.gerror;

import core.stdc.stdarg;

struct GVariant;

enum GVariantClass
{
  G_VARIANT_CLASS_BOOLEAN       = 'b',
  G_VARIANT_CLASS_BYTE          = 'y',
  G_VARIANT_CLASS_INT16         = 'n',
  G_VARIANT_CLASS_UINT16        = 'q',
  G_VARIANT_CLASS_INT32         = 'i',
  G_VARIANT_CLASS_UINT32        = 'u',
  G_VARIANT_CLASS_INT64         = 'x',
  G_VARIANT_CLASS_UINT64        = 't',
  G_VARIANT_CLASS_HANDLE        = 'h',
  G_VARIANT_CLASS_DOUBLE        = 'd',
  G_VARIANT_CLASS_STRING        = 's',
  G_VARIANT_CLASS_OBJECT_PATH   = 'o',
  G_VARIANT_CLASS_SIGNATURE     = 'g',
  G_VARIANT_CLASS_VARIANT       = 'v',
  G_VARIANT_CLASS_MAYBE         = 'm',
  G_VARIANT_CLASS_ARRAY         = 'a',
  G_VARIANT_CLASS_TUPLE         = '(',
  G_VARIANT_CLASS_DICT_ENTRY    = '{'
}

struct GVariantIter {
  /*< private >*/
  gsize x[16];
}


struct GVariantBuilder {
  /*< private >*/
  gsize x[16];
}

enum GVariantParseError
{
  G_VARIANT_PARSE_ERROR_FAILED,
  G_VARIANT_PARSE_ERROR_BASIC_TYPE_EXPECTED,
  G_VARIANT_PARSE_ERROR_CANNOT_INFER_TYPE,
  G_VARIANT_PARSE_ERROR_DEFINITE_TYPE_EXPECTED,
  G_VARIANT_PARSE_ERROR_INPUT_NOT_AT_END,
  G_VARIANT_PARSE_ERROR_INVALID_CHARACTER,
  G_VARIANT_PARSE_ERROR_INVALID_FORMAT_STRING,
  G_VARIANT_PARSE_ERROR_INVALID_OBJECT_PATH,
  G_VARIANT_PARSE_ERROR_INVALID_SIGNATURE,
  G_VARIANT_PARSE_ERROR_INVALID_TYPE_STRING,
  G_VARIANT_PARSE_ERROR_NO_COMMON_TYPE,
  G_VARIANT_PARSE_ERROR_NUMBER_OUT_OF_RANGE,
  G_VARIANT_PARSE_ERROR_NUMBER_TOO_BIG,
  G_VARIANT_PARSE_ERROR_TYPE_ERROR,
  G_VARIANT_PARSE_ERROR_UNEXPECTED_TOKEN,
  G_VARIANT_PARSE_ERROR_UNKNOWN_KEYWORD,
  G_VARIANT_PARSE_ERROR_UNTERMINATED_STRING_CONSTANT,
  G_VARIANT_PARSE_ERROR_VALUE_EXPECTED
}

//enum G_VARIANT_PARSE_ERROR = g_variant_parse_error_quark ();

struct GVariantDict {
  /*< private >*/
  gsize x[16];
}

extern (C) {


    void                            g_variant_unref                         (GVariant             *value);

    GVariant *                      g_variant_ref                           (GVariant             *value);

    GVariant *                      g_variant_ref_sink                      (GVariant             *value);

    gboolean                        g_variant_is_floating                   (GVariant             *value);

    GVariant *                      g_variant_take_ref                      (GVariant             *value);


    const(GVariantType) *            g_variant_get_type                      (GVariant             *value);

    const(gchar) *                   g_variant_get_type_string               (GVariant             *value);

    gboolean                        g_variant_is_of_type                    (GVariant             *value,
                                                                             const(GVariantType)   *type);

    gboolean                        g_variant_is_container                  (GVariant             *value);

    GVariantClass                   g_variant_classify                      (GVariant             *value);

    GVariant *                      g_variant_new_boolean                   (gboolean              value);

    GVariant *                      g_variant_new_byte                      (guchar                value);

    GVariant *                      g_variant_new_int16                     (gint16                value);

    GVariant *                      g_variant_new_uint16                    (guint16               value);

    GVariant *                      g_variant_new_int32                     (gint32                value);

    GVariant *                      g_variant_new_uint32                    (guint32               value);

    GVariant *                      g_variant_new_int64                     (gint64                value);

    GVariant *                      g_variant_new_uint64                    (guint64               value);

    GVariant *                      g_variant_new_handle                    (gint32                value);

    GVariant *                      g_variant_new_double                    (gdouble               value);

    GVariant *                      g_variant_new_string                    (const(gchar)          *str);

    GVariant *                      g_variant_new_take_string               (gchar                *str);

    GVariant *                      g_variant_new_printf                    (const(gchar) *format_string, ...);

    GVariant *                      g_variant_new_object_path               (const(gchar)          *object_path);

    gboolean                        g_variant_is_object_path                (const(gchar)          *str);

    GVariant *                      g_variant_new_signature                 (const(gchar)          *signature);

    gboolean                        g_variant_is_signature                  (const(gchar)          *str);

    GVariant *                      g_variant_new_variant                   (GVariant             *value);

    GVariant *                      g_variant_new_strv                      (const(gchar*)  *strv,
                                                                             gssize                length);

    GVariant *                      g_variant_new_objv                      (const(gchar*)  *strv,
                                                                             gssize                length);

    GVariant *                      g_variant_new_bytestring                (const(gchar)          *str);

    GVariant *                      g_variant_new_bytestring_array          (const(gchar*) *strv,
                                                                             gssize                length);

    GVariant *                      g_variant_new_fixed_array               (const(GVariantType)   *element_type,
                                                                             gconstpointer         elements,
                                                                             gsize                 n_elements,
                                                                             gsize                 element_size);

    gboolean                        g_variant_get_boolean                   (GVariant             *value);

    guchar                          g_variant_get_byte                      (GVariant             *value);

    gint16                          g_variant_get_int16                     (GVariant             *value);

    guint16                         g_variant_get_uint16                    (GVariant             *value);

    gint32                          g_variant_get_int32                     (GVariant             *value);

    guint32                         g_variant_get_uint32                    (GVariant             *value);

    gint64                          g_variant_get_int64                     (GVariant             *value);

    guint64                         g_variant_get_uint64                    (GVariant             *value);

    gint32                          g_variant_get_handle                    (GVariant             *value);

    gdouble                         g_variant_get_double                    (GVariant             *value);

    GVariant *                      g_variant_get_variant                   (GVariant             *value);

    const(gchar) *                   g_variant_get_string                    (GVariant             *value,
                                                                             gsize                *length);

    gchar *                         g_variant_dup_string                    (GVariant             *value,
                                                                             gsize                *length);

    const(gchar) **                  g_variant_get_strv                      (GVariant             *value,
                                                                             gsize                *length);

    gchar **                        g_variant_dup_strv                      (GVariant             *value,
                                                                             gsize                *length);

    const(gchar) **                  g_variant_get_objv                      (GVariant             *value,
                                                                             gsize                *length);

    gchar **                        g_variant_dup_objv                      (GVariant             *value,
                                                                             gsize                *length);

    const(gchar) *                   g_variant_get_bytestring                (GVariant             *value);

    gchar *                         g_variant_dup_bytestring                (GVariant             *value,
                                                                             gsize                *length);

    const(gchar) **                  g_variant_get_bytestring_array          (GVariant             *value,
                                                                             gsize                *length);

    gchar **                        g_variant_dup_bytestring_array          (GVariant             *value,
                                                                             gsize                *length);


    GVariant *                      g_variant_new_maybe                     (const(GVariantType)   *child_type,
                                                                             GVariant             *child);

    GVariant *                      g_variant_new_array                     (const(GVariantType)   *child_type,
                                                                             GVariant **children,
                                                                             gsize                 n_children);

    GVariant *                      g_variant_new_tuple                     (GVariant **children,
                                                                             gsize                 n_children);

    GVariant *                      g_variant_new_dict_entry                (GVariant             *key,
                                                                             GVariant             *value);


    GVariant *                      g_variant_get_maybe                     (GVariant             *value);

    gsize                           g_variant_n_children                    (GVariant             *value);

    void                            g_variant_get_child                     (GVariant             *value,
                                                                             gsize                 index_,
                                                                             const(gchar)          *format_string,
                                                                             ...);

    GVariant *                      g_variant_get_child_value               (GVariant             *value,
                                                                             gsize                 index_);

    gboolean                        g_variant_lookup                        (GVariant             *dictionary,
                                                                             const(gchar)          *key,
                                                                             const(gchar)          *format_string,
                                                                             ...);

    GVariant *                      g_variant_lookup_value                  (GVariant             *dictionary,
                                                                             const(gchar)          *key,
                                                                             const(GVariantType)   *expected_type);

    gconstpointer                   g_variant_get_fixed_array               (GVariant             *value,
                                                                             gsize                *n_elements,
                                                                             gsize                 element_size);


    gsize                           g_variant_get_size                      (GVariant             *value);

    gconstpointer                   g_variant_get_data                      (GVariant             *value);

    GBytes *                        g_variant_get_data_as_bytes             (GVariant             *value);

    void                            g_variant_store                         (GVariant             *value,
                                                                             gpointer              data);


    gchar *                         g_variant_print                         (GVariant             *value,
                                                                             gboolean              type_annotate);

    GString *                       g_variant_print_string                  (GVariant             *value,
                                                                             GString              *str,
                                                                             gboolean              type_annotate);


    guint                           g_variant_hash                          (gconstpointer         value);

    gboolean                        g_variant_equal                         (gconstpointer         one,
                                                                             gconstpointer         two);


    GVariant *                      g_variant_get_normal_form               (GVariant             *value);

    gboolean                        g_variant_is_normal_form                (GVariant             *value);

    GVariant *                      g_variant_byteswap                      (GVariant             *value);


    GVariant *                      g_variant_new_from_bytes                (const(GVariantType)   *type,
                                                                             GBytes               *bytes,
                                                                             gboolean              trusted);

    GVariant *                      g_variant_new_from_data                 (const(GVariantType)   *type,
                                                                             gconstpointer         data,
                                                                             gsize                 size,
                                                                             gboolean              trusted,
                                                                             GDestroyNotify        notify,
                                                                             gpointer              user_data);


    GVariantIter *                  g_variant_iter_new                      (GVariant             *value);

    gsize                           g_variant_iter_init                     (GVariantIter         *iter,
                                                                             GVariant             *value);

    GVariantIter *                  g_variant_iter_copy                     (GVariantIter         *iter);

    gsize                           g_variant_iter_n_children               (GVariantIter         *iter);

    void                            g_variant_iter_free                     (GVariantIter         *iter);

    GVariant *                      g_variant_iter_next_value               (GVariantIter         *iter);

    gboolean                        g_variant_iter_next                     (GVariantIter         *iter,
                                                                             const(gchar)          *format_string,
                                                                             ...);

    gboolean                        g_variant_iter_loop                     (GVariantIter         *iter,
                                                                             const(gchar)          *format_string,
                                                                             ...);



    GQuark                          g_variant_parse_error_quark             ();


    GVariantBuilder *               g_variant_builder_new                   (const(GVariantType)   *type);

    void                            g_variant_builder_unref                 (GVariantBuilder      *builder);

    GVariantBuilder *               g_variant_builder_ref                   (GVariantBuilder      *builder);

    void                            g_variant_builder_init                  (GVariantBuilder      *builder,
                                                                             const(GVariantType)   *type);

    GVariant *                      g_variant_builder_end                   (GVariantBuilder      *builder);

    void                            g_variant_builder_clear                 (GVariantBuilder      *builder);

    void                            g_variant_builder_open                  (GVariantBuilder      *builder,
                                                                             const(GVariantType)   *type);

    void                            g_variant_builder_close                 (GVariantBuilder      *builder);

    void                            g_variant_builder_add_value             (GVariantBuilder      *builder,
                                                                             GVariant             *value);

    void                            g_variant_builder_add                   (GVariantBuilder      *builder,
                                                                             const(gchar)          *format_string,
                                                                             ...);

    void                            g_variant_builder_add_parsed            (GVariantBuilder      *builder,
                                                                             const(gchar)          *format,
                                                                             ...);


    GVariant *                      g_variant_new                           (const(gchar)          *format_string,
                                                                             ...);

    void                            g_variant_get                           (GVariant             *value,
                                                                             const(gchar)          *format_string,
                                                                             ...);

    GVariant *                      g_variant_new_va                        (const(gchar)          *format_string,
                                                                             const(gchar)         **endptr,
                                                                             va_list              *app);

    void                            g_variant_get_va                        (GVariant             *value,
                                                                             const(gchar)          *format_string,
                                                                             const(gchar)         **endptr,
                                                                             va_list              *app);

    gboolean                        g_variant_check_format_string           (GVariant             *value,
                                                                             const(gchar)          *format_string,
                                                                             gboolean              copy_only);


    GVariant *                      g_variant_parse                         (const(GVariantType)   *type,
                                                                             const(gchar)          *text,
                                                                             const(gchar)          *limit,
                                                                             const(gchar)         **endptr,
                                                                             GError              **error);

    GVariant *                      g_variant_new_parsed                    (const(gchar)          *format,
                                                                             ...);

    GVariant *                      g_variant_new_parsed_va                 (const(gchar)          *format,
                                                                             va_list              *app);


    gchar *                         g_variant_parse_error_print_context     (GError               *error,
                                                                             const(gchar)          *source_str);


    gint                            g_variant_compare                       (gconstpointer one,
                                                                             gconstpointer two);


    GVariantDict *                  g_variant_dict_new                      (GVariant             *from_asv);


    void                            g_variant_dict_init                     (GVariantDict         *dict,
                                                                             GVariant             *from_asv);


    gboolean                        g_variant_dict_lookup                   (GVariantDict         *dict,
                                                                             const(gchar)          *key,
                                                                             const(gchar)          *format_string,
                                                                             ...);

    GVariant *                      g_variant_dict_lookup_value             (GVariantDict         *dict,
                                                                             const(gchar)          *key,
                                                                             const(GVariantType)   *expected_type);

    gboolean                        g_variant_dict_contains                 (GVariantDict         *dict,
                                                                             const(gchar)          *key);

    void                            g_variant_dict_insert                   (GVariantDict         *dict,
                                                                             const(gchar)          *key,
                                                                             const(gchar)          *format_string,
                                                                             ...);

    void                            g_variant_dict_insert_value             (GVariantDict         *dict,
                                                                             const(gchar)          *key,
                                                                             GVariant             *value);

    gboolean                        g_variant_dict_remove                   (GVariantDict         *dict,
                                                                             const(gchar)          *key);

    void                            g_variant_dict_clear                    (GVariantDict         *dict);

    GVariant *                      g_variant_dict_end                      (GVariantDict         *dict);

    GVariantDict *                  g_variant_dict_ref                      (GVariantDict         *dict);

    void                            g_variant_dict_unref                    (GVariantDict         *dict);

}

