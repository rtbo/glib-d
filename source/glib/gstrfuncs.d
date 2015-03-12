module glib.gstrfuncs;

import glib.gtypes;
import core.stdc.stdarg;


enum GAsciiType {
  G_ASCII_ALNUM  = 1 << 0,
  G_ASCII_ALPHA  = 1 << 1,
  G_ASCII_CNTRL  = 1 << 2,
  G_ASCII_DIGIT  = 1 << 3,
  G_ASCII_GRAPH  = 1 << 4,
  G_ASCII_LOWER  = 1 << 5,
  G_ASCII_PRINT  = 1 << 6,
  G_ASCII_PUNCT  = 1 << 7,
  G_ASCII_SPACE  = 1 << 8,
  G_ASCII_UPPER  = 1 << 9,
  G_ASCII_XDIGIT = 1 << 10
}


extern (C) extern __gshared
const(guint16*) g_ascii_table;

auto g_ascii_isalnum(C)(C c) {
    return (g_ascii_table[c & 0xff] & G_ASCII_ALNUM) != 0;
}

auto g_ascii_isalpha(C)(C c) {
    return (g_ascii_table[c & 0xff] & G_ASCII_ALPHA) != 0;
}

auto g_ascii_iscntrl(C)(C c) {
    return (g_ascii_table[c & 0xff] & G_ASCII_CNTRL) != 0;
}

auto g_ascii_isdigit(C)(C c) {
    return (g_ascii_table[c & 0xff] & G_ASCII_DIGIT) != 0;
}

auto g_ascii_isgraph(C)(C c) {
    return (g_ascii_table[c & 0xff] & G_ASCII_GRAPH) != 0;
}

auto g_ascii_islower(C)(C c) {
    return (g_ascii_table[c & 0xff] & G_ASCII_LOWER) != 0;
}

auto g_ascii_isprint(C)(C c) {
    return (g_ascii_table[c & 0xff] & G_ASCII_PRINT) != 0;
}

auto g_ascii_ispunct(C)(C c) {
    return (g_ascii_table[c & 0xff] & G_ASCII_PUNCT) != 0;
}

auto g_ascii_isspace(C)(C c) {
    return (g_ascii_table[c & 0xff] & G_ASCII_SPACE) != 0;
}

auto g_ascii_isupper(C)(C c) {
    return (g_ascii_table[c & 0xff] & G_ASCII_UPPER) != 0;
}

auto g_ascii_isxdigit(C)(C c) {
    return (g_ascii_table[c & 0xff] & G_ASCII_XDIGIT) != 0;
}

enum	 G_STR_DELIMITERS = "_-|> <.";

/* 29 bytes should enough for all possible values that
 * g_ascii_dtostr can produce.
 * Then add 10 for good measure */
enum G_ASCII_DTOSTR_BUF_SIZE = 29 + 10;

extern (C) {


    pure gchar                 g_ascii_tolower  (gchar        c);

    pure gchar                 g_ascii_toupper  (gchar        c);


    pure gint                  g_ascii_digit_value  (gchar    c);

    pure gint                  g_ascii_xdigit_value (gchar    c);


    gchar*	              g_strdelimit     (gchar	     *str,
                        const(gchar)  *delimiters,
                        gchar	      new_delimiter);

    gchar*	              g_strcanon       (gchar        *str,
                        const(gchar)  *valid_chars,
                        gchar         substitutor);

    pure const(gchar) *         g_strerror       (gint	      errnum);

    pure const(gchar) *         g_strsignal      (gint	      signum);

    gchar *	              g_strreverse     (gchar	     *str);

    gsize	              g_strlcpy	       (gchar	     *dest,
                        const(gchar)  *src,
                        gsize         dest_size);

    gsize	              g_strlcat        (gchar	     *dest,
                        const(gchar)  *src,
                        gsize         dest_size);

    gchar *               g_strstr_len     (const(gchar)  *haystack,
                        gssize        haystack_len,
                        const(gchar)  *needle);

    gchar *               g_strrstr        (const(gchar)  *haystack,
                        const(gchar)  *needle);

    gchar *               g_strrstr_len    (const(gchar)  *haystack,
                        gssize        haystack_len,
                        const(gchar)  *needle);


    gboolean              g_str_has_suffix (const(gchar)  *str,
                        const(gchar)  *suffix);

    gboolean              g_str_has_prefix (const(gchar)  *str,
                        const(gchar)  *prefix);


    gdouble	              g_strtod         (const(gchar)  *nptr,
                        gchar	    **endptr);

    gdouble	              g_ascii_strtod   (const(gchar)  *nptr,
                        gchar	    **endptr);

    guint64		      g_ascii_strtoull (const(gchar) *nptr,
                        gchar      **endptr,
                        guint        base);

    gint64		      g_ascii_strtoll  (const(gchar) *nptr,
                        gchar      **endptr,
                        guint        base);

    gchar *               g_ascii_dtostr   (gchar        *buffer,
                        gint          buf_len,
                        gdouble       d);

    gchar *               g_ascii_formatd  (gchar        *buffer,
                        gint          buf_len,
                        const(gchar)  *format,
                        gdouble       d);


    gchar*                g_strchug        (gchar        *str);

    gchar*                g_strchomp       (gchar        *str);

    extern(D) gchar* g_strstrip(gchar * str) { return g_strchomp(g_strchug(str)); }


    gint                  g_ascii_strcasecmp  (const(gchar) *s1,
                           const(gchar) *s2);

    gint                  g_ascii_strncasecmp (const(gchar) *s1,
                           const(gchar) *s2,
                           gsize        n);

    gchar*                g_ascii_strdown     (const(gchar) *str,
                           gssize       len);

    gchar*                g_ascii_strup       (const(gchar) *str,
                           gssize       len);


    gboolean              g_str_is_ascii      (const(gchar) *str);

    deprecated
    gint                  g_strcasecmp     (const(gchar) *s1,
                                            const(gchar) *s2);
    deprecated
    gint                  g_strncasecmp    (const(gchar) *s1,
                                            const(gchar) *s2,
                                            guint        n);
    deprecated
    gchar*                g_strdown        (gchar       *str);
    deprecated
    gchar*                g_strup          (gchar       *str);



    gchar*	              g_strdup	       (const(gchar) *str);

    gchar*	              g_strdup_printf  (const(gchar) *format,
                        ...);

    gchar*	              g_strdup_vprintf (const(gchar) *format,
                        va_list      args);

    gchar*	              g_strndup	       (const(gchar) *str,
                        gsize        n);

    gchar*	              g_strnfill       (gsize        length,
                        gchar        fill_char);

    gchar*	              g_strconcat      (const(gchar) *string1,
                        ...);

    gchar*                g_strjoin	       (const(gchar)  *separator,
                        ...);


    gchar*                g_strcompress    (const (gchar) *source);


    gchar*                g_strescape      (const(gchar) *source,
                        const(gchar) *exceptions);


    gpointer              g_memdup	       (gconstpointer mem,
                        guint	       byte_size);


    gchar**	              g_strsplit       (const(gchar)  *string,
                        const(gchar)  *delimiter,
                        gint          max_tokens);

    gchar **	      g_strsplit_set   (const(gchar) *string,
                        const(gchar) *delimiters,
                        gint         max_tokens);

    gchar*                g_strjoinv       (const(gchar)  *separator,
                        gchar       **str_array);

    void                  g_strfreev       (gchar       **str_array);

    gchar**               g_strdupv        (gchar       **str_array);

    guint                 g_strv_length    (gchar       **str_array);


    gchar*                g_stpcpy         (gchar        *dest,
                                            const(char)   *src);


    gchar *                 g_str_to_ascii                                  (const(gchar)   *str,
                                                                             const(gchar)   *from_locale);


    gchar **                g_str_tokenize_and_fold                         (const(gchar)   *string,
                                                                             const(gchar)   *translit_locale,
                                                                             gchar       ***ascii_alternates);


    gboolean                g_str_match_string                              (const(gchar)   *search_term,
                                                                             const(gchar)   *potential_hit,
                                                                             gboolean       accept_alternates);

}

