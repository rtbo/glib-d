/*
 * Distributed under the Boost Software License, Version 1.0.
 *    (See accompanying file LICENSE_1_0.txt or copy at
 *          http://www.boost.org/LICENSE_1_0.txt)
 */
module glib.gkeyfile;

import glib.gtypes;
import glib.gerror;


enum GKeyFileError
{
  G_KEY_FILE_ERROR_UNKNOWN_ENCODING,
  G_KEY_FILE_ERROR_PARSE,
  G_KEY_FILE_ERROR_NOT_FOUND,
  G_KEY_FILE_ERROR_KEY_NOT_FOUND,
  G_KEY_FILE_ERROR_GROUP_NOT_FOUND,
  G_KEY_FILE_ERROR_INVALID_VALUE
}

//enum G_KEY_FILE_ERROR = g_key_file_error_quark();



struct GKeyFile;

enum GKeyFileFlags
{
  G_KEY_FILE_NONE              = 0,
  G_KEY_FILE_KEEP_COMMENTS     = 1 << 0,
  G_KEY_FILE_KEEP_TRANSLATIONS = 1 << 1
}


extern (C) {

    GQuark g_key_file_error_quark ();

    GKeyFile *g_key_file_new                    ();

    GKeyFile *g_key_file_ref                    (GKeyFile             *key_file);

    void      g_key_file_unref                  (GKeyFile             *key_file);

    void      g_key_file_free                   (GKeyFile             *key_file);

    void      g_key_file_set_list_separator     (GKeyFile             *key_file,
                             gchar                 separator);

    gboolean  g_key_file_load_from_file         (GKeyFile             *key_file,
                             const(gchar)          *file,
                             GKeyFileFlags         flags,
                             GError              **error);

    gboolean  g_key_file_load_from_data         (GKeyFile             *key_file,
                             const(gchar)          *data,
                             gsize                 length,
                             GKeyFileFlags         flags,
                             GError              **error);

    gboolean g_key_file_load_from_dirs          (GKeyFile             *key_file,
                             const(gchar)	  *file,
                             const(gchar)	 **search_dirs,
                             gchar		 **full_path,
                             GKeyFileFlags         flags,
                             GError              **error);

    gboolean g_key_file_load_from_data_dirs     (GKeyFile             *key_file,
                             const(gchar)          *file,
                             gchar               **full_path,
                             GKeyFileFlags         flags,
                             GError              **error);

    gchar    *g_key_file_to_data                (GKeyFile             *key_file,
                             gsize                *length,
                             GError              **error);

    gboolean  g_key_file_save_to_file           (GKeyFile             *key_file,
                                                 const(gchar)          *filename,
                                                 GError              **error);

    gchar    *g_key_file_get_start_group        (GKeyFile             *key_file);

    gchar   **g_key_file_get_groups             (GKeyFile             *key_file,
                             gsize                *length);

    gchar   **g_key_file_get_keys               (GKeyFile             *key_file,
                             const(gchar)          *group_name,
                             gsize                *length,
                             GError              **error);

    gboolean  g_key_file_has_group              (GKeyFile             *key_file,
                             const(gchar)          *group_name);

    gboolean  g_key_file_has_key                (GKeyFile             *key_file,
                             const(gchar)          *group_name,
                             const(gchar)          *key,
                             GError              **error);

    gchar    *g_key_file_get_value              (GKeyFile             *key_file,
                             const(gchar)          *group_name,
                             const(gchar)          *key,
                             GError              **error);

    void      g_key_file_set_value              (GKeyFile             *key_file,
                             const(gchar)          *group_name,
                             const(gchar)          *key,
                             const(gchar)          *value);

    gchar    *g_key_file_get_string             (GKeyFile             *key_file,
                             const(gchar)          *group_name,
                             const(gchar)          *key,
                             GError              **error);

    void      g_key_file_set_string             (GKeyFile             *key_file,
                             const(gchar)          *group_name,
                             const(gchar)          *key,
                             const(gchar)          *str);

    gchar    *g_key_file_get_locale_string      (GKeyFile             *key_file,
                             const(gchar)          *group_name,
                             const(gchar)          *key,
                             const(gchar)          *locale,
                             GError              **error);

    void      g_key_file_set_locale_string      (GKeyFile             *key_file,
                             const(gchar)          *group_name,
                             const(gchar)          *key,
                             const(gchar)          *locale,
                             const(gchar)          *str);

    gboolean  g_key_file_get_boolean            (GKeyFile             *key_file,
                             const(gchar)          *group_name,
                             const(gchar)          *key,
                             GError              **error);

    void      g_key_file_set_boolean            (GKeyFile             *key_file,
                             const(gchar)          *group_name,
                             const(gchar)          *key,
                             gboolean              value);

    gint      g_key_file_get_integer            (GKeyFile             *key_file,
                             const(gchar)          *group_name,
                             const(gchar)          *key,
                             GError              **error);

    void      g_key_file_set_integer            (GKeyFile             *key_file,
                             const(gchar)          *group_name,
                             const(gchar)          *key,
                             gint                  value);

    gint64    g_key_file_get_int64              (GKeyFile             *key_file,
                             const(gchar)          *group_name,
                             const(gchar)          *key,
                             GError              **error);

    void      g_key_file_set_int64              (GKeyFile             *key_file,
                             const(gchar)          *group_name,
                             const(gchar)          *key,
                             gint64                value);

    guint64   g_key_file_get_uint64             (GKeyFile             *key_file,
                             const(gchar)          *group_name,
                             const(gchar)          *key,
                             GError              **error);

    void      g_key_file_set_uint64             (GKeyFile             *key_file,
                             const(gchar)          *group_name,
                             const(gchar)          *key,
                             guint64               value);

    gdouble   g_key_file_get_double             (GKeyFile             *key_file,
                                                 const(gchar)          *group_name,
                                                 const(gchar)          *key,
                                                 GError              **error);

    void      g_key_file_set_double             (GKeyFile             *key_file,
                                                 const(gchar)          *group_name,
                                                 const(gchar)          *key,
                                                 gdouble               value);

    gchar   **g_key_file_get_string_list        (GKeyFile             *key_file,
                             const(gchar)          *group_name,
                             const(gchar)          *key,
                             gsize                *length,
                             GError              **error);

    void      g_key_file_set_string_list        (GKeyFile             *key_file,
                             const(gchar)          *group_name,
                             const(gchar)          *key,
                             const(gchar*)*         list,
                             gsize                 length);

    gchar   **g_key_file_get_locale_string_list (GKeyFile             *key_file,
                             const(gchar)          *group_name,
                             const(gchar)          *key,
                             const(gchar)          *locale,
                             gsize                *length,
                             GError              **error);

    void      g_key_file_set_locale_string_list (GKeyFile             *key_file,
                             const(gchar)          *group_name,
                             const(gchar)          *key,
                             const(gchar)          *locale,
                             const(gchar*)*         list,
                             gsize                 length);

    gboolean *g_key_file_get_boolean_list       (GKeyFile             *key_file,
                             const(gchar)          *group_name,
                             const(gchar)          *key,
                             gsize                *length,
                             GError              **error);

    void      g_key_file_set_boolean_list       (GKeyFile             *key_file,
                             const(gchar)          *group_name,
                             const(gchar)          *key,
                             gboolean*              list,
                             gsize                 length);

    gint     *g_key_file_get_integer_list       (GKeyFile             *key_file,
                             const(gchar)          *group_name,
                             const(gchar)          *key,
                             gsize                *length,
                             GError              **error);

    void      g_key_file_set_double_list        (GKeyFile             *key_file,
                                                 const(gchar)          *group_name,
                                                 const(gchar)          *key,
                                                 gdouble*               list,
                                                 gsize                 length);

    gdouble  *g_key_file_get_double_list        (GKeyFile             *key_file,
                                                 const(gchar)          *group_name,
                                                 const(gchar)          *key,
                                                 gsize                *length,
                                                 GError              **error);

    void      g_key_file_set_integer_list       (GKeyFile             *key_file,
                             const(gchar)          *group_name,
                             const(gchar)          *key,
                             gint*                  list,
                             gsize                 length);

    gboolean  g_key_file_set_comment            (GKeyFile             *key_file,
                                                 const(gchar)          *group_name,
                                                 const(gchar)          *key,
                                                 const(gchar)          *comment,
                                                 GError              **error);

    gchar    *g_key_file_get_comment            (GKeyFile             *key_file,
                                                 const(gchar)          *group_name,
                                                 const(gchar)          *key,
                                                 GError              **error);


    gboolean  g_key_file_remove_comment         (GKeyFile             *key_file,
                                                 const(gchar)          *group_name,
                                                 const(gchar)          *key,
                             GError              **error);

    gboolean  g_key_file_remove_key             (GKeyFile             *key_file,
                             const(gchar)          *group_name,
                             const(gchar)          *key,
                             GError              **error);

    gboolean  g_key_file_remove_group           (GKeyFile             *key_file,
                             const(gchar)          *group_name,
                             GError              **error);

}

enum G_KEY_FILE_DESKTOP_GROUP = "Desktop Entry";

enum G_KEY_FILE_DESKTOP_KEY_TYPE = "Type";
enum G_KEY_FILE_DESKTOP_KEY_VERSION = "Version";
enum G_KEY_FILE_DESKTOP_KEY_NAME = "Name";
enum G_KEY_FILE_DESKTOP_KEY_GENERIC_NAME = "GenericName";
enum G_KEY_FILE_DESKTOP_KEY_NO_DISPLAY = "NoDisplay";
enum G_KEY_FILE_DESKTOP_KEY_COMMENT = "Comment";
enum G_KEY_FILE_DESKTOP_KEY_ICON = "Icon";
enum G_KEY_FILE_DESKTOP_KEY_HIDDEN = "Hidden";
enum G_KEY_FILE_DESKTOP_KEY_ONLY_SHOW_IN = "OnlyShowIn";
enum G_KEY_FILE_DESKTOP_KEY_NOT_SHOW_IN = "NotShowIn";
enum G_KEY_FILE_DESKTOP_KEY_TRY_EXEC = "TryExec";
enum G_KEY_FILE_DESKTOP_KEY_EXEC = "Exec";
enum G_KEY_FILE_DESKTOP_KEY_PATH = "Path";
enum G_KEY_FILE_DESKTOP_KEY_TERMINAL = "Terminal";
enum G_KEY_FILE_DESKTOP_KEY_MIME_TYPE = "MimeType";
enum G_KEY_FILE_DESKTOP_KEY_CATEGORIES = "Categories";
enum G_KEY_FILE_DESKTOP_KEY_STARTUP_NOTIFY = "StartupNotify";
enum G_KEY_FILE_DESKTOP_KEY_STARTUP_WM_CLASS = "StartupWMClass";
enum G_KEY_FILE_DESKTOP_KEY_URL = "URL";
enum G_KEY_FILE_DESKTOP_KEY_DBUS_ACTIVATABLE = "DBusActivatable";
enum G_KEY_FILE_DESKTOP_KEY_ACTIONS = "Actions";

enum G_KEY_FILE_DESKTOP_TYPE_APPLICATION = "Application";
enum G_KEY_FILE_DESKTOP_TYPE_LINK = "Link";
enum G_KEY_FILE_DESKTOP_TYPE_DIRECTORY = "Directory";

