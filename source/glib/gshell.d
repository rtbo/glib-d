/*
 * Distributed under the Boost Software License, Version 1.0.
 *    (See accompanying file LICENSE_1_0.txt or copy at
 *          http://www.boost.org/LICENSE_1_0.txt)
 */
module glib.gshell;

import glib.gtypes;
import glib.gerror;


//enum G_SHELL_ERROR = g_shell_error_quark ();

enum GShellError
{
  /* mismatched or otherwise mangled quoting */
  G_SHELL_ERROR_BAD_QUOTING,
  /* string to be parsed was empty */
  G_SHELL_ERROR_EMPTY_STRING,
  G_SHELL_ERROR_FAILED
}

extern (C) {

    GQuark g_shell_error_quark ();


    gchar*   g_shell_quote      (const(gchar)   *unquoted_string);

    gchar*   g_shell_unquote    (const(gchar)   *quoted_string,
                                 GError       **error);

    gboolean g_shell_parse_argv (const(gchar)   *command_line,
                                 gint          *argcp,
                                 gchar       ***argvp,
                                 GError       **error);
}

