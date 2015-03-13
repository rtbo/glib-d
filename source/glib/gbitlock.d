/*
 * Distributed under the Boost Software License, Version 1.0.
 *    (See accompanying file LICENSE_1_0.txt or copy at
 *          http://www.boost.org/LICENSE_1_0.txt)
 */
module glib.gbitlock;

import glib.gtypes;

extern (C) {

    void      g_bit_lock            (gint *address, gint lock_bit);

    gboolean  g_bit_trylock         (gint *address, gint lock_bit);

    void      g_bit_unlock          (gint *address, gint lock_bit);


    void      g_pointer_bit_lock    (void *address, gint lock_bit);

    gboolean  g_pointer_bit_trylock (void *address, gint lock_bit);

    void      g_pointer_bit_unlock  (void *address, gint lock_bit);
}

