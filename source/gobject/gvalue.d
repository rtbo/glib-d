module gobject.gvalue;

import gobject.gtype;
import glib;


alias G_TYPE_IS_VALUE = g_type_check_is_value_type;
//alias G_IS_VALUE = G_TYPE_CHECK_VALUE;
auto G_VALUE_TYPE(V)(V val) { return val.g_type; }
auto G_VALUE_TYPE_NAME(V)(V val) { return g_type_name(G_VALUE_TYPE(val)); }
//auto G_VALUE_HOLDS(V, T)(V v, T t) { return G_TYPE_CHECK_VALUE_TYPE(v, t); }

enum G_VALUE_NOCOPY_CONTENTS = 1 << 27;

struct GValue
{
  /*< private >*/
  GType		g_type;
  data_t [2] data;

  /* public for GTypeValueTable methods */
  union data_t {
    gint	v_int;
    guint	v_uint;
    glong	v_long;
    gulong	v_ulong;
    gint64      v_int64;
    guint64     v_uint64;
    gfloat	v_float;
    gdouble	v_double;
    gpointer	v_pointer;
  }
}


extern(C) {

    alias GValueTransform = void function (const(GValue) *src_value,
                     GValue       *dest_value);

    /* --- prototypes --- */

    GValue*         g_value_init	   	(GValue       *value,
                         GType         g_type);

    void            g_value_copy    	(const(GValue) *src_value,
                         GValue       *dest_value);

    GValue*         g_value_reset   	(GValue       *value);

    void            g_value_unset   	(GValue       *value);

    void		g_value_set_instance	(GValue	      *value,
                         gpointer      instance);

    void            g_value_init_from_instance   (GValue       *value,
                                                  gpointer      instance);


    /* --- private --- */

    gboolean	g_value_fits_pointer	(const(GValue) *value);

    gpointer	g_value_peek_pointer	(const(GValue) *value);


    /* --- implementation details --- */

    gboolean g_value_type_compatible	(GType		 src_type,
                         GType		 dest_type);

    gboolean g_value_type_transformable	(GType           src_type,
                         GType           dest_type);

    gboolean g_value_transform		(const(GValue)   *src_value,
                         GValue         *dest_value);

    void	g_value_register_transform_func	(GType		 src_type,
                         GType		 dest_type,
                         GValueTransform transform_func);

}

