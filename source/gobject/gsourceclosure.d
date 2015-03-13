/*
 * Distributed under the Boost Software License, Version 1.0.
 *    (See accompanying file LICENSE_1_0.txt or copy at
 *          http://www.boost.org/LICENSE_1_0.txt)
 */
module gobject.gsourceclosure;

import gobject.gclosure;

import glib;


extern (C):

void g_source_set_closure        (GSource  *source,
				  GClosure *closure);

void g_source_set_dummy_callback (GSource  *source);

