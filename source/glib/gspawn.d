/*
 * Distributed under the Boost Software License, Version 1.0.
 *    (See accompanying file LICENSE_1_0.txt or copy at
 *          http://www.boost.org/LICENSE_1_0.txt)
 */
module glib.gspawn;

import glib.gtypes;
import glib.gerror;


//enum G_SPAWN_ERROR = g_spawn_error_quark ();


enum GSpawnError
{
  G_SPAWN_ERROR_FORK,   /* fork failed due to lack of memory */
  G_SPAWN_ERROR_READ,   /* read or select on pipes failed */
  G_SPAWN_ERROR_CHDIR,  /* changing to working dir failed */
  G_SPAWN_ERROR_ACCES,  /* execv() returned EACCES */
  G_SPAWN_ERROR_PERM,   /* execv() returned EPERM */
  G_SPAWN_ERROR_TOO_BIG,/* execv() returned E2BIG */
  G_SPAWN_ERROR_NOEXEC, /* execv() returned ENOEXEC */
  G_SPAWN_ERROR_NAMETOOLONG, /* ""  "" ENAMETOOLONG */
  G_SPAWN_ERROR_NOENT,       /* ""  "" ENOENT */
  G_SPAWN_ERROR_NOMEM,       /* ""  "" ENOMEM */
  G_SPAWN_ERROR_NOTDIR,      /* ""  "" ENOTDIR */
  G_SPAWN_ERROR_LOOP,        /* ""  "" ELOOP   */
  G_SPAWN_ERROR_TXTBUSY,     /* ""  "" ETXTBUSY */
  G_SPAWN_ERROR_IO,          /* ""  "" EIO */
  G_SPAWN_ERROR_NFILE,       /* ""  "" ENFILE */
  G_SPAWN_ERROR_MFILE,       /* ""  "" EMFLE */
  G_SPAWN_ERROR_INVAL,       /* ""  "" EINVAL */
  G_SPAWN_ERROR_ISDIR,       /* ""  "" EISDIR */
  G_SPAWN_ERROR_LIBBAD,      /* ""  "" ELIBBAD */
  G_SPAWN_ERROR_FAILED       /* other fatal failure, error->message
                              * should explain
                              */
}

//enum G_SPAWN_EXIT_ERROR = g_spawn_exit_error_quark ();


extern(C) alias GSpawnChildSetupFunc = void function (gpointer user_data);


enum GSpawnFlags
{
  G_SPAWN_DEFAULT                = 0,
  G_SPAWN_LEAVE_DESCRIPTORS_OPEN = 1 << 0,
  G_SPAWN_DO_NOT_REAP_CHILD      = 1 << 1,
  /* look for argv[0] in the path i.e. use execvp() */
  G_SPAWN_SEARCH_PATH            = 1 << 2,
  /* Dump output to /dev/null */
  G_SPAWN_STDOUT_TO_DEV_NULL     = 1 << 3,
  G_SPAWN_STDERR_TO_DEV_NULL     = 1 << 4,
  G_SPAWN_CHILD_INHERITS_STDIN   = 1 << 5,
  G_SPAWN_FILE_AND_ARGV_ZERO     = 1 << 6,
  G_SPAWN_SEARCH_PATH_FROM_ENVP  = 1 << 7,
  G_SPAWN_CLOEXEC_PIPES          = 1 << 8
}


extern (C) {


    GQuark g_spawn_error_quark ();

    GQuark g_spawn_exit_error_quark ();

    gboolean g_spawn_check_exit_status (gint      exit_status,
                        GError  **error);


    void g_spawn_close_pid (GPid pid);


    version (Win32) {



        alias g_spawn_async = g_spawn_async_utf8;
        alias g_spawn_async_with_pipes = g_spawn_async_with_pipes_utf8;
        alias g_spawn_sync = g_spawn_sync_utf8;
        alias g_spawn_command_line_sync = g_spawn_command_line_sync_utf8;
        alias g_spawn_command_line_async = g_spawn_command_line_async_utf8;


        gboolean g_spawn_async_utf8              (const(gchar)           *working_directory,
                                                  gchar                **argv,
                                                  gchar                **envp,
                                                  GSpawnFlags            flags,
                                                  GSpawnChildSetupFunc   child_setup,
                                                  gpointer               user_data,
                                                  GPid                  *child_pid,
                                                  GError               **error);

        gboolean g_spawn_async_with_pipes_utf8   (const(gchar)           *working_directory,
                                                  gchar                **argv,
                                                  gchar                **envp,
                                                  GSpawnFlags            flags,
                                                  GSpawnChildSetupFunc   child_setup,
                                                  gpointer               user_data,
                                                  GPid                  *child_pid,
                                                  gint                  *standard_input,
                                                  gint                  *standard_output,
                                                  gint                  *standard_error,
                                                  GError               **error);

        gboolean g_spawn_sync_utf8               (const(gchar)           *working_directory,
                                                  gchar                **argv,
                                                  gchar                **envp,
                                                  GSpawnFlags            flags,
                                                  GSpawnChildSetupFunc   child_setup,
                                                  gpointer               user_data,
                                                  gchar                **standard_output,
                                                  gchar                **standard_error,
                                                  gint                  *exit_status,
                                                  GError               **error);


        gboolean g_spawn_command_line_sync_utf8  (const(gchar)           *command_line,
                                                  gchar                **standard_output,
                                                  gchar                **standard_error,
                                                  gint                  *exit_status,
                                                  GError               **error);

        gboolean g_spawn_command_line_async_utf8 (const(gchar)           *command_line,
                                                  GError               **error);

    }
    else {

        gboolean g_spawn_async (const(gchar)           *working_directory,
                                gchar                **argv,
                                gchar                **envp,
                                GSpawnFlags            flags,
                                GSpawnChildSetupFunc   child_setup,
                                gpointer               user_data,
                                GPid                  *child_pid,
                                GError               **error);


        gboolean g_spawn_async_with_pipes (const(gchar)          *working_directory,
                                           gchar               **argv,
                                           gchar               **envp,
                                           GSpawnFlags           flags,
                                           GSpawnChildSetupFunc  child_setup,
                                           gpointer              user_data,
                                           GPid                 *child_pid,
                                           gint                 *standard_input,
                                           gint                 *standard_output,
                                           gint                 *standard_error,
                                           GError              **error);



        gboolean g_spawn_sync         (const(gchar)          *working_directory,
                                       gchar               **argv,
                                       gchar               **envp,
                                       GSpawnFlags           flags,
                                       GSpawnChildSetupFunc  child_setup,
                                       gpointer              user_data,
                                       gchar               **standard_output,
                                       gchar               **standard_error,
                                       gint                 *exit_status,
                                       GError              **error);


        gboolean g_spawn_command_line_sync  (const(gchar)          *command_line,
                                             gchar               **standard_output,
                                             gchar               **standard_error,
                                             gint                 *exit_status,
                                             GError              **error);

        gboolean g_spawn_command_line_async (const(gchar)          *command_line,
                                             GError              **error);

    }
}

