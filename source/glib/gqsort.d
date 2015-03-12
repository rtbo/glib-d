module glib.gqsort;

import glib.gtypes;


extern (C)
void g_qsort_with_data (gconstpointer    pbase,
			gint             total_elems,
			gsize            size,
			GCompareDataFunc compare_func,
			gpointer         user_data);

