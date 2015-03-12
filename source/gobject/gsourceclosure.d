module gobject.gsourceclosure;

import gobject.gclosure;

import glib;


extern (C):

void g_source_set_closure        (GSource  *source,
				  GClosure *closure);

void g_source_set_dummy_callback (GSource  *source);

