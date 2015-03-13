/*
 * Distributed under the Boost Software License, Version 1.0.
 *    (See accompanying file LICENSE_1_0.txt or copy at
 *          http://www.boost.org/LICENSE_1_0.txt)
 */
module glib.gwin32;


version(Win32) {

    import glib.gtypes;

    enum MAXPATHLEN = 1024;


    extern (C) {

        gint		g_win32_ftruncate	(gint		 f,
                             guint		 size);

        gchar* 		g_win32_getlocale  ();

        gchar*          g_win32_error_message (gint error);

        gchar*          g_win32_get_package_installation_directory_of_module (gpointer hmodule);

        guint		g_win32_get_windows_version ();

        gchar*          g_win32_locale_filename_from_utf8 (const(gchar) *utf8filename);

        gchar **        g_win32_get_command_line ();

        gchar *g_win32_get_package_installation_directory_utf8    (const(gchar) *pkg,
                                                                   const(gchar) *dll_name);

        gchar *g_win32_get_package_installation_subdirectory_utf8 (const(gchar) *pkg,
                                                                   const(gchar) *dll_name,
                                                                   const(gchar) *subdir);

        alias g_win32_get_package_installation_directory = g_win32_get_package_installation_directory_utf8;
        alias g_win32_get_package_installation_subdirectory = g_win32_get_package_installation_subdirectory_utf8;

    }
}
