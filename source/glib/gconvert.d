module glib.gconvert;

import glib.gtypes;
import glib.gerror;


enum GConvertError
{
  G_CONVERT_ERROR_NO_CONVERSION,
  G_CONVERT_ERROR_ILLEGAL_SEQUENCE,
  G_CONVERT_ERROR_FAILED,
  G_CONVERT_ERROR_PARTIAL_INPUT,
  G_CONVERT_ERROR_BAD_URI,
  G_CONVERT_ERROR_NOT_ABSOLUTE_PATH,
  G_CONVERT_ERROR_NO_MEMORY
}

//enum G_CONVERT_ERROR = g_convert_error_quark();

struct _GIConv;
alias GIConv = _GIConv*;

extern (C) {

    GQuark g_convert_error_quark ();



    GIConv g_iconv_open   (const(gchar)  *to_codeset,
                   const(gchar)  *from_codeset);

    gsize  g_iconv        (GIConv        converter,
                   gchar       **inbuf,
                   gsize        *inbytes_left,
                   gchar       **outbuf,
                   gsize        *outbytes_left);

    gint   g_iconv_close  (GIConv        converter);



    gchar* g_convert       (const(gchar)  *str,
                    gssize        len,
                    const(gchar)  *to_codeset,
                    const(gchar)  *from_codeset,
                    gsize        *bytes_read,
                    gsize        *bytes_written,
                    GError      **error);

    gchar* g_convert_with_iconv    (const(gchar)  *str,
                    gssize        len,
                    GIConv        converter,
                    gsize        *bytes_read,
                    gsize        *bytes_written,
                    GError      **error);

    gchar* g_convert_with_fallback (const(gchar)  *str,
                    gssize        len,
                    const(gchar)  *to_codeset,
                    const(gchar)  *from_codeset,
                    const(gchar)  *fallback,
                    gsize        *bytes_read,
                    gsize        *bytes_written,
                    GError      **error);



    gchar* g_locale_to_utf8   (const(gchar)  *opsysstring,
                   gssize        len,
                   gsize        *bytes_read,
                   gsize        *bytes_written,
                   GError      **error);

    gchar* g_locale_from_utf8 (const(gchar)  *utf8string,
                   gssize        len,
                   gsize        *bytes_read,
                   gsize        *bytes_written,
                   GError      **error);

    gchar *g_filename_display_name (const(gchar) *filename);

    gboolean g_get_filename_charsets (const(gchar) ***charsets);


    gchar *g_filename_display_basename (const(gchar) *filename);


    gchar **g_uri_list_extract_uris (const(gchar) *uri_list);


    version(Win32) {

        gchar* g_filename_to_utf8_utf8   (const(gchar)  *opsysstring,
                                          gssize        len,
                                          gsize        *bytes_read,
                                          gsize        *bytes_written,
                                          GError      **error);

        gchar* g_filename_from_utf8_utf8 (const(gchar)  *utf8string,
                                          gssize        len,
                                          gsize        *bytes_read,
                                          gsize        *bytes_written,
                                          GError      **error);

        gchar *g_filename_from_uri_utf8  (const(gchar)  *uri,
                                          gchar       **hostname,
                                          GError      **error);

        gchar *g_filename_to_uri_utf8    (const(gchar)  *filename,
                                          const(gchar)  *hostname,
                                          GError      **error);

        alias g_filename_to_utf8 = g_filename_to_utf8_utf8;
        alias g_filename_from_utf8 = g_filename_from_utf8_utf8;
        alias g_filename_from_uri = g_filename_from_uri_utf8;
        alias g_filename_to_uri = g_filename_to_uri_utf8;
    }
    else {

        gchar* g_filename_to_utf8   (const(gchar)  *opsysstring,
                         gssize        len,
                         gsize        *bytes_read,
                         gsize        *bytes_written,
                         GError      **error);

        gchar* g_filename_from_utf8 (const(gchar)  *utf8string,
                         gssize        len,
                         gsize        *bytes_read,
                         gsize        *bytes_written,
                         GError      **error);


        gchar *g_filename_from_uri (const(gchar) *uri,
                        gchar      **hostname,
                        GError     **error);


        gchar *g_filename_to_uri   (const(gchar) *filename,
                        const(gchar) *hostname,
                        GError     **error);

    }

}
