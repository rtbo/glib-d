module glib.gutils;

import glib.gtypes;

import core.stdc.stdarg;


enum GUserDirectory {
  G_USER_DIRECTORY_DESKTOP,
  G_USER_DIRECTORY_DOCUMENTS,
  G_USER_DIRECTORY_DOWNLOAD,
  G_USER_DIRECTORY_MUSIC,
  G_USER_DIRECTORY_PICTURES,
  G_USER_DIRECTORY_PUBLIC_SHARE,
  G_USER_DIRECTORY_TEMPLATES,
  G_USER_DIRECTORY_VIDEOS,

  G_USER_N_DIRECTORIES
}



struct GDebugKey
{
  const(gchar) *key;
  guint	       value;
}


enum GFormatSizeFlags
{
  G_FORMAT_SIZE_DEFAULT     = 0,
  G_FORMAT_SIZE_LONG_FORMAT = 1 << 0,
  G_FORMAT_SIZE_IEC_UNITS   = 1 << 1
}


extern (C) {


    const(gchar) *         g_get_user_name        ();

    const(gchar) *         g_get_real_name        ();

    const(gchar) *         g_get_home_dir         ();

    const(gchar) *         g_get_tmp_dir          ();

    const(gchar) *         g_get_host_name	     ();

    const(gchar) *         g_get_prgname          ();

    void                  g_set_prgname          (const(gchar) *prgname);

    const(gchar) *         g_get_application_name ();

    void                  g_set_application_name (const(gchar) *application_name);


    void      g_reload_user_special_dirs_cache     ();

    const(gchar) *         g_get_user_data_dir      ();

    const(gchar) *         g_get_user_config_dir    ();

    const(gchar) *         g_get_user_cache_dir     ();

    const(gchar*)* g_get_system_data_dirs   ();

    const(gchar*) * g_get_system_config_dirs ();

    const(gchar) * g_get_user_runtime_dir ();

    const(gchar) * g_get_user_special_dir (GUserDirectory directory);

    guint                 g_parse_debug_string (const(gchar)     *str,
                            const(GDebugKey) *keys,
                            guint            nkeys);


    gint                  g_snprintf           (gchar       *str,
                            gulong       n,
                            const(gchar) *format,
                            ...);

    gint                  g_vsnprintf          (gchar       *str,
                            gulong       n,
                            const(gchar) *format,
                            va_list      args);


    void                  g_nullify_pointer    (gpointer    *nullify_location);

    gchar *g_format_size_full   (guint64          size,
                                 GFormatSizeFlags flags);

    gchar *g_format_size        (guint64          size);

    deprecated("use g_format_size")
    gchar *g_format_size_for_display (goffset size);


    void g_abort ();

    gchar*  g_find_program_in_path  (const(gchar) *program);

}


/* Bit tests
 */
// G_INLINE_FUNC gint	g_bit_nth_lsf (gulong  mask,
// 				       gint    nth_bit) G_GNUC_CONST;
// G_INLINE_FUNC gint	g_bit_nth_msf (gulong  mask,
// 				       gint    nth_bit) G_GNUC_CONST;
// G_INLINE_FUNC guint	g_bit_storage (gulong  number) G_GNUC_CONST;
//
// /* inline function implementations
//  */
// #if defined (G_CAN_INLINE) || defined (__G_UTILS_C__)
// G_INLINE_FUNC gint
// g_bit_nth_lsf (gulong mask,
// 	       gint   nth_bit)
// {
//   if (G_UNLIKELY (nth_bit < -1))
//     nth_bit = -1;
//   while (nth_bit < ((GLIB_SIZEOF_LONG * 8) - 1))
//     {
//       nth_bit++;
//       if (mask & (1UL << nth_bit))
// 	return nth_bit;
//     }
//   return -1;
// }
// G_INLINE_FUNC gint
// g_bit_nth_msf (gulong mask,
// 	       gint   nth_bit)
// {
//   if (nth_bit < 0 || G_UNLIKELY (nth_bit > GLIB_SIZEOF_LONG * 8))
//     nth_bit = GLIB_SIZEOF_LONG * 8;
//   while (nth_bit > 0)
//     {
//       nth_bit--;
//       if (mask & (1UL << nth_bit))
// 	return nth_bit;
//     }
//   return -1;
// }
// G_INLINE_FUNC guint
// g_bit_storage (gulong number)
// {
// #if defined(__GNUC__) && (__GNUC__ >= 4) && defined(__OPTIMIZE__)
//   return G_LIKELY (number) ?
// 	   ((GLIB_SIZEOF_LONG * 8U - 1) ^ (guint) __builtin_clzl(number)) + 1 : 1;
// #else
//   guint n_bits = 0;
//
//   do
//     {
//       n_bits++;
//       number >>= 1;
//     }
//   while (number);
//   return n_bits;
// #endif
// }
// #endif  /* G_CAN_INLINE || __G_UTILS_C__ */

