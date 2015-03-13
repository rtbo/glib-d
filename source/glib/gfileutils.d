/*
 * Distributed under the Boost Software License, Version 1.0.
 *    (See accompanying file LICENSE_1_0.txt or copy at
 *          http://www.boost.org/LICENSE_1_0.txt)
 */
module glib.gfileutils;

import glib.gtypes;
import glib.gerror;


//enum G_FILE_ERROR = g_file_error_quark ();

enum GFileError
{
  G_FILE_ERROR_EXIST,
  G_FILE_ERROR_ISDIR,
  G_FILE_ERROR_ACCES,
  G_FILE_ERROR_NAMETOOLONG,
  G_FILE_ERROR_NOENT,
  G_FILE_ERROR_NOTDIR,
  G_FILE_ERROR_NXIO,
  G_FILE_ERROR_NODEV,
  G_FILE_ERROR_ROFS,
  G_FILE_ERROR_TXTBSY,
  G_FILE_ERROR_FAULT,
  G_FILE_ERROR_LOOP,
  G_FILE_ERROR_NOSPC,
  G_FILE_ERROR_NOMEM,
  G_FILE_ERROR_MFILE,
  G_FILE_ERROR_NFILE,
  G_FILE_ERROR_BADF,
  G_FILE_ERROR_INVAL,
  G_FILE_ERROR_PIPE,
  G_FILE_ERROR_AGAIN,
  G_FILE_ERROR_INTR,
  G_FILE_ERROR_IO,
  G_FILE_ERROR_PERM,
  G_FILE_ERROR_NOSYS,
  G_FILE_ERROR_FAILED
}

enum GFileTest
{
  G_FILE_TEST_IS_REGULAR    = 1 << 0,
  G_FILE_TEST_IS_SYMLINK    = 1 << 1,
  G_FILE_TEST_IS_DIR        = 1 << 2,
  G_FILE_TEST_IS_EXECUTABLE = 1 << 3,
  G_FILE_TEST_EXISTS        = 1 << 4
}


extern (C) {

    GQuark     g_file_error_quark      ();

    GFileError g_file_error_from_errno (gint err_no);



    gboolean g_file_set_contents (const(gchar) *filename,
                                  const(gchar) *contents,
                                  gssize         length,
                                  GError       **error);

    gchar   *g_file_read_link    (const(gchar)  *filename,
                                  GError      **error);

    gchar   *g_mkdtemp            (gchar        *tmpl);

    gchar   *g_mkdtemp_full       (gchar        *tmpl,
                                   gint          mode);

    gint     g_mkstemp_full       (gchar        *tmpl,
                                   gint          flags,
                                   gint          mode);

    gchar   *g_dir_make_tmp       (const(gchar)  *tmpl,
                                   GError      **error);

    gchar   *g_build_path         (const(gchar) *separator,
                                   const(gchar) *first_element,
                                   ...);

    gchar   *g_build_pathv        (const(gchar)  *separator,
                                   gchar       **args);

    gchar   *g_build_filename     (const(gchar) *first_element,
                                   ...);

    gchar   *g_build_filenamev    (gchar      **args);

    gint     g_mkdir_with_parents (const(gchar) *pathname,
                                   gint         mode);


    version (Win32) {
        enum G_DIR_SEPARATOR = '\\';
        enum G_DIR_SEPARATOR_S = "\\";
        auto G_IS_DIR_SEPARATOR(C)(C c) {
            return c == G_DIR_SEPARATOR || c == '/';
        }
        enum G_SEARCHPATH_SEPARATOR = ';';
        enum G_SEARCHPATH_SEPARATOR_S = ";";
    }
    else {  /* !G_OS_WIN32 */
        enum G_DIR_SEPARATOR = '/';
        enum G_DIR_SEPARATOR_S = "/";
        auto G_IS_DIR_SEPARATOR(C)(C c) {
            return c == G_DIR_SEPARATOR;
        }
        enum G_SEARCHPATH_SEPARATOR = ':';
        enum G_SEARCHPATH_SEPARATOR_S = ":";
    }


    gboolean     g_path_is_absolute (const(gchar) *file_name);

    const(gchar) *g_path_skip_root   (const(gchar) *file_name);

    deprecated("use g_path_get_basename")
    const(gchar) *g_basename         (const(gchar) *file_name);



    gchar *g_path_get_basename (const(gchar) *file_name);

    gchar *g_path_get_dirname  (const(gchar) *file_name);

    version (Win32) {

        gboolean g_file_test_utf8         (const(gchar)  *filename,
                                           GFileTest     test);

        gboolean g_file_get_contents_utf8 (const(gchar)  *filename,
                                           gchar       **contents,
                                           gsize        *length,
                                           GError      **error);

        gint     g_mkstemp_utf8           (gchar        *tmpl);

        gint     g_file_open_tmp_utf8     (const(gchar)  *tmpl,
                                           gchar       **name_used,
                                           GError      **error);

        gchar   *g_get_current_dir_utf8   ();

        alias g_file_test = g_file_test_utf8;
        alias g_file_get_contents = g_file_get_contents_utf8;
        alias g_mkstemp = g_mkstemp_utf8;
        alias g_file_open_tmp = g_file_open_tmp_utf8;
        alias g_get_current_dir = g_get_current_dir_utf8;

    }
    else {

        gboolean g_file_test         (const(gchar)  *filename,
                                      GFileTest     test);

        gboolean g_file_get_contents (const(gchar)  *filename,
                                      gchar       **contents,
                                      gsize        *length,
                                      GError      **error);

        gint     g_mkstemp            (gchar        *tmpl);

        gint     g_file_open_tmp      (const(gchar)  *tmpl,
                                       gchar       **name_used,
                                       GError      **error);

        gchar *g_get_current_dir   ();

    }
}
