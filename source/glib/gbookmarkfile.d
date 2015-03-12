module glib.gbookmarkfile;

import glib.gtypes;
import glib.gerror;

import core.stdc.time;

//enum G_BOOKMARK_FILE_ERROR = g_bookmark_file_error_quark ();


enum GBookmarkFileError
{
  G_BOOKMARK_FILE_ERROR_INVALID_URI,
  G_BOOKMARK_FILE_ERROR_INVALID_VALUE,
  G_BOOKMARK_FILE_ERROR_APP_NOT_REGISTERED,
  G_BOOKMARK_FILE_ERROR_URI_NOT_FOUND,
  G_BOOKMARK_FILE_ERROR_READ,
  G_BOOKMARK_FILE_ERROR_UNKNOWN_ENCODING,
  G_BOOKMARK_FILE_ERROR_WRITE,
  G_BOOKMARK_FILE_ERROR_FILE_NOT_FOUND
}

struct GBookmarkFile;



extern(C) {

    GQuark g_bookmark_file_error_quark ();


    GBookmarkFile *g_bookmark_file_new ();

    void g_bookmark_file_free (GBookmarkFile  *bookmark);


    gboolean g_bookmark_file_load_from_file (GBookmarkFile  *bookmark,
                                const(gchar)   *filename,
                                GError        **error);

    gboolean g_bookmark_file_load_from_data (GBookmarkFile  *bookmark,
                                const(gchar)   *data,
                                gsize           length,
                                GError        **error);

    gboolean g_bookmark_file_load_from_data_dirs (GBookmarkFile  *bookmark,
                                const(gchar)   *file,
                                gchar         **full_path,
                                GError        **error);

    gchar *  g_bookmark_file_to_data (GBookmarkFile  *bookmark,
                                gsize          *length,
                                GError        **error);

    gboolean g_bookmark_file_to_file (GBookmarkFile  *bookmark,
                                const(gchar)   *filename,
                                GError        **error);


    void     g_bookmark_file_set_title (GBookmarkFile  *bookmark,
                                const(gchar)    *uri,
                                const(gchar)    *title);

    gchar *  g_bookmark_file_get_title (GBookmarkFile  *bookmark,
                                const(gchar)   *uri,
                                GError        **error);

    void     g_bookmark_file_set_description (GBookmarkFile  *bookmark,
                                const(gchar)   *uri,
                                const(gchar)   *description);

    gchar * g_bookmark_file_get_description (GBookmarkFile  *bookmark,
                                const(gchar)   *uri,
                                GError        **error);

    void g_bookmark_file_set_mime_type (GBookmarkFile  *bookmark,
                                const(gchar)   *uri,
                                const(gchar)   *mime_type);

    gchar * g_bookmark_file_get_mime_type (GBookmarkFile  *bookmark,
                                const(gchar)   *uri,
                                GError        **error);

    void g_bookmark_file_set_groups (GBookmarkFile  *bookmark,
                                const(gchar)   *uri,
                                const(gchar)  **groups,
                                gsize           length);

    void g_bookmark_file_add_group (GBookmarkFile  *bookmark,
                                const(gchar)   *uri,
                                const(gchar)   *group);

    gboolean g_bookmark_file_has_group (GBookmarkFile  *bookmark,
                                const(gchar)   *uri,
                                const(gchar)   *group,
                                GError        **error);

    gchar ** g_bookmark_file_get_groups (GBookmarkFile  *bookmark,
                                const(gchar)   *uri,
                                gsize          *length,
                                GError        **error);

    void g_bookmark_file_add_application (GBookmarkFile  *bookmark,
                                const(gchar)   *uri,
                                const(gchar)   *name,
                                const(gchar)   *exec);

    gboolean g_bookmark_file_has_application (GBookmarkFile  *bookmark,
                                const(gchar)   *uri,
                                const(gchar)   *name,
                                GError        **error);

    gchar ** g_bookmark_file_get_applications (GBookmarkFile  *bookmark,
                                const(gchar)   *uri,
                                gsize          *length,
                                GError        **error);

    gboolean g_bookmark_file_set_app_info (GBookmarkFile  *bookmark,
                                const(gchar)   *uri,
                                const(gchar)   *name,
                                const(gchar)   *exec,
                                gint            count,
                                time_t          stamp,
                                GError        **error);

    gboolean g_bookmark_file_get_app_info (GBookmarkFile  *bookmark,
                                const(gchar)   *uri,
                                const(gchar)   *name,
                                gchar         **exec,
                                guint          *count,
                                time_t         *stamp,
                                GError        **error);

    void g_bookmark_file_set_is_private (GBookmarkFile  *bookmark,
                                const(gchar)   *uri,
                                gboolean        is_private);

    gboolean g_bookmark_file_get_is_private (GBookmarkFile  *bookmark,
                                const(gchar)    *uri,
                                GError        **error);

    void g_bookmark_file_set_icon (GBookmarkFile  *bookmark,
                                const(gchar)   *uri,
                                const(gchar)   *href,
                                const(gchar)   *mime_type);

    gboolean g_bookmark_file_get_icon (GBookmarkFile  *bookmark,
                                const(gchar)   *uri,
                                gchar         **href,
                                gchar         **mime_type,
                                GError        **error);

    void g_bookmark_file_set_added (GBookmarkFile  *bookmark,
                                const(gchar)   *uri,
                                time_t          added);

    time_t g_bookmark_file_get_added (GBookmarkFile  *bookmark,
                                const(gchar)   *uri,
                                GError        **error);

    void g_bookmark_file_set_modified (GBookmarkFile  *bookmark,
                                const(gchar)   *uri,
                                time_t          modified);

    time_t g_bookmark_file_get_modified (GBookmarkFile  *bookmark,
                                const(gchar)   *uri,
                                GError        **error);

    void g_bookmark_file_set_visited (GBookmarkFile  *bookmark,
                                const(gchar)   *uri,
                                time_t          visited);

    time_t g_bookmark_file_get_visited (GBookmarkFile  *bookmark,
                                const(gchar)   *uri,
                                GError        **error);

    gboolean g_bookmark_file_has_item (GBookmarkFile  *bookmark,
                                const(gchar)   *uri);

    gint g_bookmark_file_get_size (GBookmarkFile  *bookmark);

    gchar ** g_bookmark_file_get_uris (GBookmarkFile  *bookmark,
                                gsize          *length);

    gboolean g_bookmark_file_remove_group (GBookmarkFile  *bookmark,
                                const(gchar)   *uri,
                                const(gchar)   *group,
                                GError        **error);

    gboolean g_bookmark_file_remove_application (GBookmarkFile  *bookmark,
                                const(gchar)   *uri,
                                const(gchar)   *name,
                                GError        **error);

    gboolean g_bookmark_file_remove_item (GBookmarkFile  *bookmark,
                                const(gchar)   *uri,
                                GError        **error);

    gboolean g_bookmark_file_move_item (GBookmarkFile  *bookmark,
                                const(gchar)   *old_uri,
                                const(gchar)   *new_uri,
                                GError        **error);
}

