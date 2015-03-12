module glib.genviron;

import glib.gtypes;


extern (C) {

    gchar **      g_listenv          ();

    gchar **      g_get_environ      ();

    const(gchar)* g_environ_getenv   (gchar       **envp,
                                      const(gchar) *variable);

    gchar **      g_environ_setenv   (gchar       **envp,
                                      const(gchar) *variable,
                                      const(gchar) *value,
                                      gboolean      overwrite);

    gchar **      g_environ_unsetenv (gchar       **envp,
                                      const(gchar) *variable);

    version(Win32) {

        const(gchar)*g_getenv_utf8   (const(gchar) *variable);

        gboolean     g_setenv_utf8   (const(gchar) *variable,
                                      const(gchar) *value,
                                      gboolean      overwrite);

        void         g_unsetenv_utf8 (const(gchar)  *variable);

        alias g_getenv = g_getenv_utf8;
        alias g_setenv = g_setenv_utf8;
        alias g_unsetenv = g_unsetenv_utf8;

    }
    else {

        const(gchar) * g_getenv          (const(gchar)  *variable);

        gboolean      g_setenv           (const(gchar) *variable,
                                          const(gchar) *value,
                                          gboolean      overwrite);

        void          g_unsetenv         (const(gchar) *variable);

    }

}

