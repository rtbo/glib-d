module glib.gmarkup;

import glib.gtypes;
import glib.gerror;
import glib.gslist;

import core.stdc.stdarg;


enum GMarkupError
{
  G_MARKUP_ERROR_BAD_UTF8,
  G_MARKUP_ERROR_EMPTY,
  G_MARKUP_ERROR_PARSE,
  /* The following are primarily intended for specific GMarkupParser
   * implementations to set.
   */
  G_MARKUP_ERROR_UNKNOWN_ELEMENT,
  G_MARKUP_ERROR_UNKNOWN_ATTRIBUTE,
  G_MARKUP_ERROR_INVALID_CONTENT,
  G_MARKUP_ERROR_MISSING_ATTRIBUTE
}

//enum G_MARKUP_ERROR = g_markup_error_quark ();

extern (C)
GQuark g_markup_error_quark ();

enum GMarkupParseFlags
{
  G_MARKUP_DO_NOT_USE_THIS_UNSUPPORTED_FLAG = 1 << 0,
  G_MARKUP_TREAT_CDATA_AS_TEXT              = 1 << 1,
  G_MARKUP_PREFIX_ERROR_POSITION            = 1 << 2,
  G_MARKUP_IGNORE_QUALIFIED                 = 1 << 3
}

struct GMarkupParseContext;

extern (C) {

    struct GMarkupParser
    {
      /* Called for open tags <foo bar="baz"> */
      void function (GMarkupParseContext *context,
                              const(gchar)         *element_name,
                              const(gchar)        **attribute_names,
                              const(gchar)        **attribute_values,
                              gpointer             user_data,
                              GError             **error) start_element;

      void function (GMarkupParseContext *context,
                              const(gchar)         *element_name,
                              gpointer             user_data,
                              GError             **error) end_element;

      /* Called for character data */
      /* text is not nul-terminated */
      void function (GMarkupParseContext *context,
                              const(gchar)         *text,
                              gsize                text_len,
                              gpointer             user_data,
                              GError             **error) text;

      /* Called for strings that should be re-saved verbatim in this same
       * position, but are not otherwise interpretable.  At the moment
       * this includes comments and processing instructions.
       */
      /* text is not nul-terminated. */
      void function (GMarkupParseContext *context,
                              const(gchar)         *passthrough_text,
                              gsize                text_len,
                              gpointer             user_data,
                              GError             **error) passthrough;

      /* Called on error, including one set by other
       * methods in the vtable. The GError should not be freed.
       */
      void function (GMarkupParseContext *context,
                              GError              *error,
                              gpointer             user_data) error;
    }


    GMarkupParseContext *g_markup_parse_context_new   (const(GMarkupParser) *parser,
                                                       GMarkupParseFlags    flags,
                                                       gpointer             user_data,
                                                       GDestroyNotify       user_data_dnotify);

    GMarkupParseContext *g_markup_parse_context_ref   (GMarkupParseContext *context);

    void                 g_markup_parse_context_unref (GMarkupParseContext *context);

    void                 g_markup_parse_context_free  (GMarkupParseContext *context);

    gboolean             g_markup_parse_context_parse (GMarkupParseContext *context,
                                                       const(gchar)         *text,
                                                       gssize               text_len,
                                                       GError             **error);

    void                 g_markup_parse_context_push  (GMarkupParseContext *context,
                                                       const(GMarkupParser) *parser,
                                                       gpointer             user_data);

    gpointer             g_markup_parse_context_pop   (GMarkupParseContext *context);


    gboolean             g_markup_parse_context_end_parse (GMarkupParseContext *context,
                                                           GError             **error);

    const(gchar) *        g_markup_parse_context_get_element (GMarkupParseContext *context);

    const(GSList) *       g_markup_parse_context_get_element_stack (GMarkupParseContext *context);


    void                 g_markup_parse_context_get_position (GMarkupParseContext *context,
                                                              gint                *line_number,
                                                              gint                *char_number);

    gpointer             g_markup_parse_context_get_user_data (GMarkupParseContext *context);


    gchar* g_markup_escape_text (const(gchar) *text,
                                 gssize       length);


    gchar *g_markup_printf_escaped (const(char) *format,
                    ...);

    gchar *g_markup_vprintf_escaped (const(char) *format,
                     va_list     args);

}

enum GMarkupCollectType
{
  G_MARKUP_COLLECT_INVALID,
  G_MARKUP_COLLECT_STRING,
  G_MARKUP_COLLECT_STRDUP,
  G_MARKUP_COLLECT_BOOLEAN,
  G_MARKUP_COLLECT_TRISTATE,

  G_MARKUP_COLLECT_OPTIONAL = (1 << 16)
}


extern (C)
gboolean   g_markup_collect_attributes (const(gchar)         *element_name,
                                        const(gchar)        **attribute_names,
                                        const(gchar)        **attribute_values,
                                        GError             **error,
                                        GMarkupCollectType   first_type,
                                        const(gchar)         *first_attr,
                                        ...);

