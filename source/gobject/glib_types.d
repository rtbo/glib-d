module gobject.glib_types;

import gobject.gtype;

import glib;

// /* --- GLib boxed types --- */
// /**
//  * G_TYPE_DATE:
//  *
//  * The #GType for #GDate.
//  */
// #define G_TYPE_DATE (g_date_get_type ())
//
// /**
//  * G_TYPE_STRV:
//  *
//  * The #GType for a boxed type holding a %NULL-terminated array of strings.
//  *
//  * The code fragments in the following example show the use of a property of
//  * type #G_TYPE_STRV with g_object_class_install_property(), g_object_set()
//  * and g_object_get().
//  *
//  * |[
//  * g_object_class_install_property (object_class,
//  *                                  PROP_AUTHORS,
//  *                                  g_param_spec_boxed ("authors",
//  *                                                      _("Authors"),
//  *                                                      _("List of authors"),
//  *                                                      G_TYPE_STRV,
//  *                                                      G_PARAM_READWRITE));
//  *
//  * gchar *authors[] = { "Owen", "Tim", NULL };
//  * g_object_set (obj, "authors", authors, NULL);
//  *
//  * gchar *writers[];
//  * g_object_get (obj, "authors", &writers, NULL);
//  * /&ast; do something with writers &ast;/
//  * g_strfreev (writers);
//  * ]|
//  *
//  * Since: 2.4
//  */
// #define G_TYPE_STRV (g_strv_get_type ())
//
// /**
//  * G_TYPE_GSTRING:
//  *
//  * The #GType for #GString.
//  */
// #define G_TYPE_GSTRING (g_gstring_get_type ())
//
// /**
//  * G_TYPE_HASH_TABLE:
//  *
//  * The #GType for a boxed type holding a #GHashTable reference.
//  *
//  * Since: 2.10
//  */
// #define G_TYPE_HASH_TABLE (g_hash_table_get_type ())
//
// /**
//  * G_TYPE_REGEX:
//  *
//  * The #GType for a boxed type holding a #GRegex reference.
//  *
//  * Since: 2.14
//  */
// #define G_TYPE_REGEX (g_regex_get_type ())
//
// /**
//  * G_TYPE_MATCH_INFO:
//  *
//  * The #GType for a boxed type holding a #GMatchInfo reference.
//  *
//  * Since: 2.30
//  */
// #define G_TYPE_MATCH_INFO (g_match_info_get_type ())
//
// /**
//  * G_TYPE_ARRAY:
//  *
//  * The #GType for a boxed type holding a #GArray reference.
//  *
//  * Since: 2.22
//  */
// #define G_TYPE_ARRAY (g_array_get_type ())
//
// /**
//  * G_TYPE_BYTE_ARRAY:
//  *
//  * The #GType for a boxed type holding a #GByteArray reference.
//  *
//  * Since: 2.22
//  */
// #define G_TYPE_BYTE_ARRAY (g_byte_array_get_type ())
//
// /**
//  * G_TYPE_PTR_ARRAY:
//  *
//  * The #GType for a boxed type holding a #GPtrArray reference.
//  *
//  * Since: 2.22
//  */
// #define G_TYPE_PTR_ARRAY (g_ptr_array_get_type ())
//
// /**
//  * G_TYPE_BYTES:
//  *
//  * The #GType for #GBytes.
//  *
//  * Since: 2.32
//  */
// #define G_TYPE_BYTES (g_bytes_get_type ())
//
// /**
//  * G_TYPE_VARIANT_TYPE:
//  *
//  * The #GType for a boxed type holding a #GVariantType.
//  *
//  * Since: 2.24
//  */
// #define G_TYPE_VARIANT_TYPE (g_variant_type_get_gtype ())
//
// /**
//  * G_TYPE_ERROR:
//  *
//  * The #GType for a boxed type holding a #GError.
//  *
//  * Since: 2.26
//  */
// #define G_TYPE_ERROR (g_error_get_type ())
//
// /**
//  * G_TYPE_DATE_TIME:
//  *
//  * The #GType for a boxed type holding a #GDateTime.
//  *
//  * Since: 2.26
//  */
// #define G_TYPE_DATE_TIME (g_date_time_get_type ())
//
// /**
//  * G_TYPE_TIME_ZONE:
//  *
//  * The #GType for a boxed type holding a #GTimeZone.
//  *
//  * Since: 2.34
//  */
// #define G_TYPE_TIME_ZONE (g_time_zone_get_type ())
//
// /**
//  * G_TYPE_IO_CHANNEL:
//  *
//  * The #GType for #GIOChannel.
//  */
// #define G_TYPE_IO_CHANNEL (g_io_channel_get_type ())
//
// /**
//  * G_TYPE_IO_CONDITION:
//  *
//  * The #GType for #GIOCondition.
//  */
// #define G_TYPE_IO_CONDITION (g_io_condition_get_type ())
//
// /**
//  * G_TYPE_VARIANT_BUILDER:
//  *
//  * The #GType for a boxed type holding a #GVariantBuilder.
//  *
//  * Since: 2.30
//  */
// #define G_TYPE_VARIANT_BUILDER (g_variant_builder_get_type ())
//
// /**
//  * G_TYPE_VARIANT_DICT:
//  *
//  * The #GType for a boxed type holding a #GVariantDict.
//  *
//  * Since: 2.40
//  */
// #define G_TYPE_VARIANT_DICT (g_variant_dict_get_type ())
//
// /**
//  * G_TYPE_MAIN_LOOP:
//  *
//  * The #GType for a boxed type holding a #GMainLoop.
//  *
//  * Since: 2.30
//  */
// #define G_TYPE_MAIN_LOOP (g_main_loop_get_type ())
//
// /**
//  * G_TYPE_MAIN_CONTEXT:
//  *
//  * The #GType for a boxed type holding a #GMainContext.
//  *
//  * Since: 2.30
//  */
// #define G_TYPE_MAIN_CONTEXT (g_main_context_get_type ())
//
// /**
//  * G_TYPE_SOURCE:
//  *
//  * The #GType for a boxed type holding a #GSource.
//  *
//  * Since: 2.30
//  */
// #define G_TYPE_SOURCE (g_source_get_type ())
//
// /**
//  * G_TYPE_POLLFD:
//  *
//  * The #GType for a boxed type holding a #GPollFD.
//  *
//  * Since: 2.36
//  */
// #define G_TYPE_POLLFD (g_pollfd_get_type ())
//
// /**
//  * G_TYPE_MARKUP_PARSE_CONTEXT:
//  *
//  * The #GType for a boxed type holding a #GMarkupParseContext.
//  *
//  * Since: 2.36
//  */
// #define G_TYPE_MARKUP_PARSE_CONTEXT (g_markup_parse_context_get_type ())
//
// /**
//  * G_TYPE_KEY_FILE:
//  *
//  * The #GType for a boxed type holding a #GKeyFile.
//  *
//  * Since: 2.32
//  */
// #define G_TYPE_KEY_FILE (g_key_file_get_type ())
//
// /**
//  * G_TYPE_MAPPED_FILE:
//  *
//  * The #GType for a boxed type holding a #GMappedFile.
//  *
//  * Since: 2.40
//  */
// #define G_TYPE_MAPPED_FILE (g_mapped_file_get_type ())
//
// /**
//  * G_TYPE_THREAD:
//  *
//  * The #GType for a boxed type holding a #GThread.
//  *
//  * Since: 2.36
//  */
// #define G_TYPE_THREAD (g_thread_get_type ())
//
// /**
//  * G_TYPE_CHECKSUM:
//  *
//  * The #GType for a boxed type holding a #GChecksum.
//  *
//  * Since: 2.36
//  */
// #define G_TYPE_CHECKSUM (g_checksum_get_type ())


extern(C):

pure GType   g_date_get_type            ();

pure GType   g_strv_get_type            ();

pure GType   g_gstring_get_type         ();

pure GType   g_hash_table_get_type      ();

pure GType   g_array_get_type           ();

pure GType   g_byte_array_get_type      ();

pure GType   g_ptr_array_get_type       ();

pure GType   g_bytes_get_type           ();

pure GType   g_variant_type_get_gtype   ();

pure GType   g_regex_get_type           ();

pure GType   g_match_info_get_type      ();

pure GType   g_error_get_type           ();

pure GType   g_date_time_get_type       ();

pure GType   g_time_zone_get_type       ();

pure GType   g_io_channel_get_type      ();

pure GType   g_io_condition_get_type    ();

pure GType   g_variant_builder_get_type ();

pure GType   g_variant_dict_get_type    ();

pure GType   g_key_file_get_type        ();

pure GType   g_main_loop_get_type       ();

pure GType   g_main_context_get_type    ();

pure GType   g_source_get_type          ();

pure GType   g_pollfd_get_type          ();

pure GType   g_thread_get_type          ();

pure GType   g_checksum_get_type        ();

pure GType   g_markup_parse_context_get_type ();

pure GType   g_mapped_file_get_type ();

deprecated("use G_TYPE_VARIANT")
pure GType   g_variant_get_gtype        ();


alias GStrv = gchar**;

