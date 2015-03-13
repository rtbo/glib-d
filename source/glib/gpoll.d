/*
 * Distributed under the Boost Software License, Version 1.0.
 *    (See accompanying file LICENSE_1_0.txt or copy at
 *          http://www.boost.org/LICENSE_1_0.txt)
 */
module glib.gpoll;

import glib.gtypes;



extern (C)
    alias GPollFunc = gint function (GPollFD *ufds,
                                 guint    nfsd,
                                 gint     timeout_);

struct GPollFD
{
    version(Win32) {
        static if (GLIB_SIZEOF_VOID_P == 8) {
            gint64 fd;
        }
        else {
            gint fd;
        }
    }
    else {
        gint fd;
    }

    gushort events;
    gushort revents;
}

version (Win32) {
    static if (GLIB_SIZEOF_VOID_P == 8) {
        enum G_POLLFD_FORMAT = "%#llx";
    }
    else {
        enum G_POLLFD_FORMAT = "%#x";
    }
}
else {
    enum G_POLLFD_FORMAT = "%d";
}

extern (C) gint g_poll (GPollFD *fds, guint nfds, gint timeout);

