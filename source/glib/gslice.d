/*
 * Distributed under the Boost Software License, Version 1.0.
 *    (See accompanying file LICENSE_1_0.txt or copy at
 *          http://www.boost.org/LICENSE_1_0.txt)
 */
module glib.gslice;

import glib.gtypes;


extern (C) {

    gpointer g_slice_alloc          	(gsize	       block_size);

    gpointer g_slice_alloc0         	(gsize         block_size);

    gpointer g_slice_copy                   (gsize         block_size,
                                             gconstpointer mem_block);

    void     g_slice_free1          	(gsize         block_size,
                         gpointer      mem_block);

    void     g_slice_free_chain_with_offset (gsize         block_size,
                         gpointer      mem_chain,
                         gsize         next_offset);

}

auto g_slice_new(T)() { return cast(T*)g_slice_alloc(T.sizeof); }
auto g_slice_new0(T)() { return cast(T*)g_slice_alloc0(T.sizeof); }


/* we go through extra hoops to ensure type safety */
// #define g_slice_dup(type, mem)                                  \
//   (1 ? (type*) g_slice_copy (sizeof (type), (mem))              \
//      : ((void) ((type*) 0 == (mem)), (type*) 0))
// #define g_slice_free(type, mem)				do {	\
//   if (1) g_slice_free1 (sizeof (type), (mem));			\
//   else   (void) ((type*) 0 == (mem)); 				\
// } while (0)
// #define g_slice_free_chain(type, mem_chain, next)	do {	\
//   if (1) g_slice_free_chain_with_offset (sizeof (type),		\
//                  (mem_chain), G_STRUCT_OFFSET (type, next)); 	\
//   else   (void) ((type*) 0 == (mem_chain));			\
// } while (0)


enum GSliceConfig {
  G_SLICE_CONFIG_ALWAYS_MALLOC = 1,
  G_SLICE_CONFIG_BYPASS_MAGAZINES,
  G_SLICE_CONFIG_WORKING_SET_MSECS,
  G_SLICE_CONFIG_COLOR_INCREMENT,
  G_SLICE_CONFIG_CHUNK_SIZES,
  G_SLICE_CONFIG_CONTENTION_COUNTER
}


deprecated extern (C) {

    void     g_slice_set_config	   (GSliceConfig ckey, gint64 value);

    gint64   g_slice_get_config	   (GSliceConfig ckey);

    gint64*  g_slice_get_config_state  (GSliceConfig ckey, gint64 address, guint *n_values);

}
