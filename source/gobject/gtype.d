/*
 * Distributed under the Boost Software License, Version 1.0.
 *    (See accompanying file LICENSE_1_0.txt or copy at
 *          http://www.boost.org/LICENSE_1_0.txt)
 */
module gobject.gtype;

import gobject.gvalue;
import glib;


alias G_TYPE_FUNDAMENTAL = g_type_fundamental;



private enum G_TYPE_FUNDAMENTAL_SHIFT = 2;

GType G_TYPE_MAKE_FUNDAMENTAL(X)(X x) { return x << G_TYPE_FUNDAMENTAL_SHIFT; }

enum GType G_TYPE_FUNDAMENTAL_MAX = 255 << G_TYPE_FUNDAMENTAL_SHIFT;

enum G_TYPE_INVALID = G_TYPE_MAKE_FUNDAMENTAL (0);
enum G_TYPE_NONE = G_TYPE_MAKE_FUNDAMENTAL (1);
enum G_TYPE_INTERFACE = G_TYPE_MAKE_FUNDAMENTAL (2);
enum G_TYPE_CHAR = G_TYPE_MAKE_FUNDAMENTAL (3);
enum G_TYPE_UCHAR = G_TYPE_MAKE_FUNDAMENTAL (4);
enum G_TYPE_BOOLEAN = G_TYPE_MAKE_FUNDAMENTAL (5);
enum G_TYPE_INT = G_TYPE_MAKE_FUNDAMENTAL (6);
enum G_TYPE_UINT = G_TYPE_MAKE_FUNDAMENTAL (7);
enum G_TYPE_LONG = G_TYPE_MAKE_FUNDAMENTAL (8);
enum G_TYPE_ULONG = G_TYPE_MAKE_FUNDAMENTAL (9);
enum G_TYPE_INT64 = G_TYPE_MAKE_FUNDAMENTAL (10);
enum G_TYPE_UINT64 = G_TYPE_MAKE_FUNDAMENTAL (11);
enum G_TYPE_ENUM = G_TYPE_MAKE_FUNDAMENTAL (12);
enum G_TYPE_FLAGS = G_TYPE_MAKE_FUNDAMENTAL (13);
enum G_TYPE_FLOAT = G_TYPE_MAKE_FUNDAMENTAL (14);
enum G_TYPE_DOUBLE = G_TYPE_MAKE_FUNDAMENTAL (15);
enum G_TYPE_STRING = G_TYPE_MAKE_FUNDAMENTAL (16);
enum G_TYPE_POINTER = G_TYPE_MAKE_FUNDAMENTAL (17);
enum G_TYPE_BOXED = G_TYPE_MAKE_FUNDAMENTAL (18);
enum G_TYPE_PARAM = G_TYPE_MAKE_FUNDAMENTAL (19);
enum G_TYPE_OBJECT = G_TYPE_MAKE_FUNDAMENTAL (20);
enum G_TYPE_VARIANT = G_TYPE_MAKE_FUNDAMENTAL (21);

enum G_TYPE_RESERVED_GLIB_FIRST = (22);
enum G_TYPE_RESERVED_GLIB_LAST = (31);
enum G_TYPE_RESERVED_BSE_FIRST = (32);
enum G_TYPE_RESERVED_BSE_LAST = (48);
enum G_TYPE_RESERVED_USER_FIRST = (49);

auto G_TYPE_IS_FUNDAMENTAL(GType t) { return t <= G_TYPE_FUNDAMENTAL_MAX; }
auto G_TYPE_IS_DERIVED(GType t) { return t > G_TYPE_FUNDAMENTAL_MAX; }
auto G_TYPE_IS_INTERFACE(GType t) { return G_TYPE_FUNDAMENTAL(t) == G_TYPE_INTERFACE; }
auto G_TYPE_IS_CLASSED(GType t) { return g_type_test_flags(t, GTypeFundamentalFlags.G_TYPE_FLAG_CLASSED); }
auto G_TYPE_IS_INSTANTIATABLE(GType t) { return g_type_test_flags(t, GTypeFundamentalFlags.G_TYPE_FLAG_INSTANTIATABLE); }
auto G_TYPE_IS_DERIVABLE(GType t) { return g_type_test_flags(t, GTypeFundamentalFlags.G_TYPE_FLAG_DERIVABLE); }
auto G_TYPE_IS_DEEP_DERIVABLE(GType t) { return g_type_test_flags(t, GTypeFundamentalFlags.G_TYPE_FLAG_DEEP_DERIVABLE); }
auto G_TYPE_IS_ABSTRACT(GType t) { return g_type_test_flags(t, GTypeFlags.G_TYPE_FLAG_ABSTRACT); }
auto G_TYPE_IS_VALUE_ABSTRACT(GType t) { return g_type_test_flags(t, GTypeFlags.G_TYPE_FLAG_VALUE_ABSTRACT); }
auto G_TYPE_IS_VALUE_TYPE(GType t) { return g_type_check_is_value_type(t); }
auto G_TYPE_HAS_VALUE_TABLE(GType t) { return g_type_value_table_peek(t) !is null; }

alias GType = gsize;


union  GTypeCValue;
struct GTypePlugin;


struct GTypeClass
{
  /*< private >*/
  GType g_type;
}

struct GTypeInstance
{
  /*< private >*/
  GTypeClass *g_class;
}

struct GTypeInterface
{
  /*< private >*/
  GType g_type;         /* iface type */
  GType g_instance_type;
}

struct GTypeQuery
{
  GType		type;
  const(gchar)  *type_name;
  guint		class_size;
  guint		instance_size;
}



enum GTypeDebugFlags
{
  G_TYPE_DEBUG_NONE	= 0,
  G_TYPE_DEBUG_OBJECTS	= 1 << 0,
  G_TYPE_DEBUG_SIGNALS	= 1 << 1,
  G_TYPE_DEBUG_MASK	= 0x03
}

enum GTypeFundamentalFlags
{
  G_TYPE_FLAG_CLASSED           = (1 << 0),
  G_TYPE_FLAG_INSTANTIATABLE    = (1 << 1),
  G_TYPE_FLAG_DERIVABLE         = (1 << 2),
  G_TYPE_FLAG_DEEP_DERIVABLE    = (1 << 3)
}

enum GTypeFlags
{
  G_TYPE_FLAG_ABSTRACT		= (1 << 4),
  G_TYPE_FLAG_VALUE_ABSTRACT	= (1 << 5)
}

struct GTypeInfo
{
  /* interface types, classed types, instantiated types */
  guint16                class_size;

  GBaseInitFunc          base_init;
  GBaseFinalizeFunc      base_finalize;

  /* interface types, classed types, instantiated types */
  GClassInitFunc         class_init;
  GClassFinalizeFunc     class_finalize;
  gconstpointer          class_data;

  /* instantiated types */
  guint16                instance_size;
  guint16                n_preallocs;
  GInstanceInitFunc      instance_init;

  /* value handling */
  const(GTypeValueTable)	*value_table;
}

struct GTypeFundamentalInfo
{
  GTypeFundamentalFlags  type_flags;
}

struct GInterfaceInfo
{
  GInterfaceInitFunc     interface_init;
  GInterfaceFinalizeFunc interface_finalize;
  gpointer               interface_data;
}


extern (C) {

    struct GTypeValueTable
    {
      void function (GValue       *value) value_init;
      void function (GValue       *value) value_free;
      void function (const(GValue) *src_value,
                      GValue       *dest_value) value_copy;

      gpointer function (const(GValue) *value) value_peek_pointer;

      const(gchar) *collect_format;

      gchar* function (GValue       *value,
                      guint         n_collect_values,
                      GTypeCValue  *collect_values,
                      guint		collect_flags) collect_value;

      const(gchar) *lcopy_format;

      gchar* function (const(GValue) *value,
                      guint         n_collect_values,
                      GTypeCValue  *collect_values,
                      guint		collect_flags) lcopy_value;
    }


    alias GBaseInitFunc = void function (gpointer         g_class);
    alias GBaseFinalizeFunc = void function (gpointer         g_class);
    alias GClassInitFunc = void function (gpointer         g_class,
                              gpointer         class_data);
    alias GClassFinalizeFunc = void function (gpointer         g_class,
                              gpointer         class_data);
    alias GInstanceInitFunc = void function (GTypeInstance   *instance,
                              gpointer         g_class);
    alias GInterfaceInitFunc = void function (gpointer         g_iface,
                              gpointer         iface_data);
    alias GInterfaceFinalizeFunc = void function (gpointer         g_iface,
                              gpointer         iface_data);
    alias GTypeClassCacheFunc = gboolean function (gpointer	       cache_data,
                              GTypeClass      *g_class);
    alias GTypeInterfaceCheckFunc = void function (gpointer	       check_data,
                              gpointer         g_iface);



    /* --- prototypes --- */
    deprecated
    void                  g_type_init                    ();
    deprecated
    void                  g_type_init_with_debug_flags   (GTypeDebugFlags  debug_flags);

    const(gchar) *         g_type_name                    (GType            type);

    GQuark                g_type_qname                   (GType            type);

    GType                 g_type_from_name               (const(gchar)     *name);

    GType                 g_type_parent                  (GType            type);

    guint                 g_type_depth                   (GType            type);

    GType                 g_type_next_base               (GType            leaf_type,
                                  GType            root_type);

    gboolean              g_type_is_a                    (GType            type,
                                  GType            is_a_type);

    gpointer              g_type_class_ref               (GType            type);

    gpointer              g_type_class_peek              (GType            type);

    gpointer              g_type_class_peek_static       (GType            type);

    void                  g_type_class_unref             (gpointer         g_class);

    gpointer              g_type_class_peek_parent       (gpointer         g_class);

    gpointer              g_type_interface_peek          (gpointer         instance_class,
                                  GType            iface_type);

    gpointer              g_type_interface_peek_parent   (gpointer         g_iface);


    gpointer              g_type_default_interface_ref   (GType            g_type);

    gpointer              g_type_default_interface_peek  (GType            g_type);

    void                  g_type_default_interface_unref (gpointer         g_iface);

    /* g_free() the returned arrays */

    GType*                g_type_children                (GType            type,
                                  guint           *n_children);

    GType*                g_type_interfaces              (GType            type,
                                  guint           *n_interfaces);

    /* per-type _static_ data */

    void                  g_type_set_qdata               (GType            type,
                                  GQuark           quark,
                                  gpointer         data);

    gpointer              g_type_get_qdata               (GType            type,
                                  GQuark           quark);

    void		      g_type_query		     (GType	       type,
                                  GTypeQuery      *query);


    GType g_type_register_static		(GType			     parent_type,
                         const(gchar)		    *type_name,
                         const(GTypeInfo)	    *info,
                         GTypeFlags		     flags);

    GType g_type_register_static_simple     (GType                       parent_type,
                         const(gchar)                *type_name,
                         guint                       class_size,
                         GClassInitFunc              class_init,
                         guint                       instance_size,
                         GInstanceInitFunc           instance_init,
                         GTypeFlags	             flags);


    GType g_type_register_dynamic		(GType			     parent_type,
                         const(gchar)		    *type_name,
                         GTypePlugin		    *plugin,
                         GTypeFlags		     flags);

    GType g_type_register_fundamental	(GType			     type_id,
                         const(gchar)		    *type_name,
                         const(GTypeInfo)	    *info,
                         const(GTypeFundamentalInfo) *finfo,
                         GTypeFlags		     flags);

    void  g_type_add_interface_static	(GType			     instance_type,
                         GType			     interface_type,
                         const(GInterfaceInfo)	    *info);

    void  g_type_add_interface_dynamic	(GType			     instance_type,
                         GType			     interface_type,
                         GTypePlugin		    *plugin);

    void  g_type_interface_add_prerequisite (GType			     interface_type,
                         GType			     prerequisite_type);

    GType*g_type_interface_prerequisites    (GType                       interface_type,
                         guint                      *n_prerequisites);

    void     g_type_class_add_private       (gpointer                    g_class,
                                             gsize                       private_size);

    gint     g_type_add_instance_private    (GType                       class_type,
                                             gsize                       private_size);

    gpointer g_type_instance_get_private    (GTypeInstance              *instance,
                                             GType                       private_type);

    void     g_type_class_adjust_private_offset (gpointer                g_class,
                                                 gint                   *private_size_or_offset);


    void      g_type_add_class_private      (GType    		     class_type,
                         gsize    		     private_size);

    gpointer  g_type_class_get_private      (GTypeClass 		    *klass,
                         GType			     private_type);

    gint      g_type_class_get_instance_private_offset (gpointer         g_class);


    void      g_type_ensure                 (GType                       type);

    guint     g_type_get_type_registration_serial ();

}

// #define G_TYPE_CHECK_INSTANCE(instance)				(_G_TYPE_CHI ((GTypeInstance*) (instance)))
// /**
//  * G_TYPE_CHECK_INSTANCE_CAST:
//  * @instance: Location of a #GTypeInstance structure
//  * @g_type: The type to be returned
//  * @c_type: The corresponding C type of @g_type
//  *
//  * Checks that @instance is an instance of the type identified by @g_type
//  * and issues a warning if this is not the case. Returns @instance casted
//  * to a pointer to @c_type.
//  *
//  * This macro should only be used in type implementations.
//  */
// #define G_TYPE_CHECK_INSTANCE_CAST(instance, g_type, c_type)    (_G_TYPE_CIC ((instance), (g_type), c_type))
// /**
//  * G_TYPE_CHECK_INSTANCE_TYPE:
//  * @instance: Location of a #GTypeInstance structure.
//  * @g_type: The type to be checked
//  *
//  * Checks if @instance is an instance of the type identified by @g_type.
//  *
//  * This macro should only be used in type implementations.
//  *
//  * Returns: %TRUE on success
//  */
// #define G_TYPE_CHECK_INSTANCE_TYPE(instance, g_type)            (_G_TYPE_CIT ((instance), (g_type)))
// /**
//  * G_TYPE_CHECK_INSTANCE_FUNDAMENTAL_TYPE:
//  * @instance: Location of a #GTypeInstance structure.
//  * @g_type: The fundamental type to be checked
//  *
//  * Checks if @instance is an instance of the fundamental type identified by @g_type.
//  *
//  * This macro should only be used in type implementations.
//  *
//  * Returns: %TRUE on success
//  */
// #define G_TYPE_CHECK_INSTANCE_FUNDAMENTAL_TYPE(instance, g_type)            (_G_TYPE_CIFT ((instance), (g_type)))
// /**
//  * G_TYPE_INSTANCE_GET_CLASS:
//  * @instance: Location of the #GTypeInstance structure
//  * @g_type: The #GType of the class to be returned
//  * @c_type: The C type of the class structure
//  *
//  * Get the class structure of a given @instance, casted
//  * to a specified ancestor type @g_type of the instance.
//  *
//  * Note that while calling a GInstanceInitFunc(), the class pointer
//  * gets modified, so it might not always return the expected pointer.
//  *
//  * This macro should only be used in type implementations.
//  *
//  * Returns: a pointer to the class structure
//  */
// #define G_TYPE_INSTANCE_GET_CLASS(instance, g_type, c_type)     (_G_TYPE_IGC ((instance), (g_type), c_type))
// /**
//  * G_TYPE_INSTANCE_GET_INTERFACE:
//  * @instance: Location of the #GTypeInstance structure
//  * @g_type: The #GType of the interface to be returned
//  * @c_type: The C type of the interface structure
//  *
//  * Get the interface structure for interface @g_type of a given @instance.
//  *
//  * This macro should only be used in type implementations.
//  *
//  * Returns: a pointer to the interface structure
//  */
// #define G_TYPE_INSTANCE_GET_INTERFACE(instance, g_type, c_type) (_G_TYPE_IGI ((instance), (g_type), c_type))
// /**
//  * G_TYPE_CHECK_CLASS_CAST:
//  * @g_class: Location of a #GTypeClass structure
//  * @g_type: The type to be returned
//  * @c_type: The corresponding C type of class structure of @g_type
//  *
//  * Checks that @g_class is a class structure of the type identified by @g_type
//  * and issues a warning if this is not the case. Returns @g_class casted
//  * to a pointer to @c_type.
//  *
//  * This macro should only be used in type implementations.
//  */
// #define G_TYPE_CHECK_CLASS_CAST(g_class, g_type, c_type)        (_G_TYPE_CCC ((g_class), (g_type), c_type))
// /**
//  * G_TYPE_CHECK_CLASS_TYPE:
//  * @g_class: Location of a #GTypeClass structure
//  * @g_type: The type to be checked
//  *
//  * Checks if @g_class is a class structure of the type identified by
//  * @g_type.
//  *
//  * This macro should only be used in type implementations.
//  *
//  * Returns: %TRUE on success
//  */
// #define G_TYPE_CHECK_CLASS_TYPE(g_class, g_type)                (_G_TYPE_CCT ((g_class), (g_type)))
// /**
//  * G_TYPE_CHECK_VALUE:
//  * @value: a #GValue
//  *
//  * Checks if @value has been initialized to hold values
//  * of a value type.
//  *
//  * This macro should only be used in type implementations.
//  *
//  * Returns: %TRUE on success
//  */
// #define G_TYPE_CHECK_VALUE(value)				(_G_TYPE_CHV ((value)))
// /**
//  * G_TYPE_CHECK_VALUE_TYPE:
//  * @value: a #GValue
//  * @g_type: The type to be checked
//  *
//  * Checks if @value has been initialized to hold values
//  * of type @g_type.
//  *
//  * This macro should only be used in type implementations.
//  *
//  * Returns: %TRUE on success
//  */
// #define G_TYPE_CHECK_VALUE_TYPE(value, g_type)			(_G_TYPE_CVH ((value), (g_type)))
// /**
//  * G_TYPE_FROM_INSTANCE:
//  * @instance: Location of a valid #GTypeInstance structure
//  *
//  * Get the type identifier from a given @instance structure.
//  *
//  * This macro should only be used in type implementations.
//  *
//  * Returns: the #GType
//  */
auto G_TYPE_FROM_INSTANCE(I)(I instance) { return G_TYPE_FROM_CLASS((cast(GTypeInstance*)instance).g_class); }
// #define G_TYPE_FROM_INSTANCE(instance)                          (G_TYPE_FROM_CLASS (((GTypeInstance*) (instance))->g_class))
// /**
//  * G_TYPE_FROM_CLASS:
//  * @g_class: Location of a valid #GTypeClass structure
//  *
//  * Get the type identifier from a given @class structure.
//  *
//  * This macro should only be used in type implementations.
//  *
//  * Returns: the #GType
//  */
auto G_TYPE_FROM_CLASS(GC)(GC g_class) { return (cast(GTypeClass*)g_class).g_type; }
// #define G_TYPE_FROM_CLASS(g_class)                              (((GTypeClass*) (g_class))->g_type)
// /**
//  * G_TYPE_FROM_INTERFACE:
//  * @g_iface: Location of a valid #GTypeInterface structure
//  *
//  * Get the type identifier from a given @interface structure.
//  *
//  * This macro should only be used in type implementations.
//  *
//  * Returns: the #GType
//  */
auto G_TYPE_FROM_INTERFACE(GI)(GI g_iface) { return (cast(GTypeInterface*)g_iface).g_type; }
// #define G_TYPE_FROM_INTERFACE(g_iface)                          (((GTypeInterface*) (g_iface))->g_type)
//
// /**
//  * G_TYPE_INSTANCE_GET_PRIVATE:
//  * @instance: the instance of a type deriving from @private_type
//  * @g_type: the type identifying which private data to retrieve
//  * @c_type: The C type for the private structure
//  *
//  * Gets the private structure for a particular type.
//  * The private structure must have been registered in the
//  * class_init function with g_type_class_add_private().
//  *
//  * This macro should only be used in type implementations.
//  *
//  * Since: 2.4
//  * Returns: a pointer to the private data structure
//  */
// #define G_TYPE_INSTANCE_GET_PRIVATE(instance, g_type, c_type)   ((c_type*) g_type_instance_get_private ((GTypeInstance*) (instance), (g_type)))
//
// /**
//  * G_TYPE_CLASS_GET_PRIVATE:
//  * @klass: the class of a type deriving from @private_type
//  * @g_type: the type identifying which private data to retrieve
//  * @c_type: The C type for the private structure
//  *
//  * Gets the private class structure for a particular type.
//  * The private structure must have been registered in the
//  * get_type() function with g_type_add_class_private().
//  *
//  * This macro should only be used in type implementations.
//  *
//  * Since: 2.24
//  * Returns: a pointer to the private data structure
//  */
// #define G_TYPE_CLASS_GET_PRIVATE(klass, g_type, c_type)   ((c_type*) g_type_class_get_private ((GTypeClass*) (klass), (g_type)))



// /* --- GType boilerplate --- */
// /**
//  * G_DEFINE_TYPE:
//  * @TN: The name of the new type, in Camel case.
//  * @t_n: The name of the new type, in lowercase, with words
//  *  separated by '_'.
//  * @T_P: The #GType of the parent type.
//  *
//  * A convenience macro for type implementations, which declares a class
//  * initialization function, an instance initialization function (see #GTypeInfo
//  * for information about these) and a static variable named `t_n_parent_class`
//  * pointing to the parent class. Furthermore, it defines  a *_get_type() function.
//  * See G_DEFINE_TYPE_EXTENDED() for an example.
//  *
//  * Since: 2.4
//  */
// #define G_DEFINE_TYPE(TN, t_n, T_P)			    G_DEFINE_TYPE_EXTENDED (TN, t_n, T_P, 0, {})
// /**
//  * G_DEFINE_TYPE_WITH_CODE:
//  * @TN: The name of the new type, in Camel case.
//  * @t_n: The name of the new type in lowercase, with words separated by '_'.
//  * @T_P: The #GType of the parent type.
//  * @_C_: Custom code that gets inserted in the *_get_type() function.
//  *
//  * A convenience macro for type implementations.
//  * Similar to G_DEFINE_TYPE(), but allows you to insert custom code into the
//  * *_get_type() function, e.g. interface implementations via G_IMPLEMENT_INTERFACE().
//  * See G_DEFINE_TYPE_EXTENDED() for an example.
//  *
//  * Since: 2.4
//  */
// #define G_DEFINE_TYPE_WITH_CODE(TN, t_n, T_P, _C_)	    _G_DEFINE_TYPE_EXTENDED_BEGIN (TN, t_n, T_P, 0) {_C_;} _G_DEFINE_TYPE_EXTENDED_END()
// /**
//  * G_DEFINE_TYPE_WITH_PRIVATE:
//  * @TN: The name of the new type, in Camel case.
//  * @t_n: The name of the new type, in lowercase, with words
//  *  separated by '_'.
//  * @T_P: The #GType of the parent type.
//  *
//  * A convenience macro for type implementations, which declares a class
//  * initialization function, an instance initialization function (see #GTypeInfo
//  * for information about these), a static variable named `t_n_parent_class`
//  * pointing to the parent class, and adds private instance data to the type.
//  * Furthermore, it defines a *_get_type() function. See G_DEFINE_TYPE_EXTENDED()
//  * for an example.
//  *
//  * Note that private structs added with this macros must have a struct
//  * name of the form @TN Private.
//  *
//  * Since: 2.38
//  */
// #define G_DEFINE_TYPE_WITH_PRIVATE(TN, t_n, T_P)            G_DEFINE_TYPE_EXTENDED (TN, t_n, T_P, 0, G_ADD_PRIVATE (TN))
// /**
//  * G_DEFINE_ABSTRACT_TYPE:
//  * @TN: The name of the new type, in Camel case.
//  * @t_n: The name of the new type, in lowercase, with words
//  *  separated by '_'.
//  * @T_P: The #GType of the parent type.
//  *
//  * A convenience macro for type implementations.
//  * Similar to G_DEFINE_TYPE(), but defines an abstract type.
//  * See G_DEFINE_TYPE_EXTENDED() for an example.
//  *
//  * Since: 2.4
//  */
// #define G_DEFINE_ABSTRACT_TYPE(TN, t_n, T_P)		    G_DEFINE_TYPE_EXTENDED (TN, t_n, T_P, G_TYPE_FLAG_ABSTRACT, {})
// /**
//  * G_DEFINE_ABSTRACT_TYPE_WITH_CODE:
//  * @TN: The name of the new type, in Camel case.
//  * @t_n: The name of the new type, in lowercase, with words
//  *  separated by '_'.
//  * @T_P: The #GType of the parent type.
//  * @_C_: Custom code that gets inserted in the @type_name_get_type() function.
//  *
//  * A convenience macro for type implementations.
//  * Similar to G_DEFINE_TYPE_WITH_CODE(), but defines an abstract type and
//  * allows you to insert custom code into the *_get_type() function, e.g.
//  * interface implementations  via G_IMPLEMENT_INTERFACE().
//  * See G_DEFINE_TYPE_EXTENDED() for an example.
//  *
//  * Since: 2.4
//  */
// #define G_DEFINE_ABSTRACT_TYPE_WITH_CODE(TN, t_n, T_P, _C_) _G_DEFINE_TYPE_EXTENDED_BEGIN (TN, t_n, T_P, G_TYPE_FLAG_ABSTRACT) {_C_;} _G_DEFINE_TYPE_EXTENDED_END()
// /**
//  * G_DEFINE_ABSTRACT_TYPE_WITH_PRIVATE:
//  * @TN: The name of the new type, in Camel case.
//  * @t_n: The name of the new type, in lowercase, with words
//  *  separated by '_'.
//  * @T_P: The #GType of the parent type.
//  *
//  * Similar to G_DEFINE_TYPE_WITH_PRIVATE(), but defines an abstract type.
//  * See G_DEFINE_TYPE_EXTENDED() for an example.
//  *
//  * Since: 2.38
//  */
// #define G_DEFINE_ABSTRACT_TYPE_WITH_PRIVATE(TN, t_n, T_P)   G_DEFINE_TYPE_EXTENDED (TN, t_n, T_P, G_TYPE_FLAG_ABSTRACT, G_ADD_PRIVATE (TN))
// /**
//  * G_DEFINE_TYPE_EXTENDED:
//  * @TN: The name of the new type, in Camel case.
//  * @t_n: The name of the new type, in lowercase, with words
//  *    separated by '_'.
//  * @T_P: The #GType of the parent type.
//  * @_f_: #GTypeFlags to pass to g_type_register_static()
//  * @_C_: Custom code that gets inserted in the *_get_type() function.
//  *
//  * The most general convenience macro for type implementations, on which
//  * G_DEFINE_TYPE(), etc are based.
//  *
//  * |[<!-- language="C" -->
//  * G_DEFINE_TYPE_EXTENDED (GtkGadget,
//  *                         gtk_gadget,
//  *                         GTK_TYPE_WIDGET,
//  *                         0,
//  *                         G_IMPLEMENT_INTERFACE (TYPE_GIZMO,
//  *                                                gtk_gadget_gizmo_init));
//  * ]|
//  * expands to
//  * |[<!-- language="C" -->
//  * static void     gtk_gadget_init       (GtkGadget      *self);
//  * static void     gtk_gadget_class_init (GtkGadgetClass *klass);
//  * static gpointer gtk_gadget_parent_class = NULL;
//  * static void     gtk_gadget_class_intern_init (gpointer klass)
//  * {
//  *   gtk_gadget_parent_class = g_type_class_peek_parent (klass);
//  *   gtk_gadget_class_init ((GtkGadgetClass*) klass);
//  * }
//  *
//  * GType
//  * gtk_gadget_get_type (void)
//  * {
//  *   static volatile gsize g_define_type_id__volatile = 0;
//  *   if (g_once_init_enter (&g_define_type_id__volatile))
//  *     {
//  *       GType g_define_type_id =
//  *         g_type_register_static_simple (GTK_TYPE_WIDGET,
//  *                                        g_intern_static_string ("GtkGadget"),
//  *                                        sizeof (GtkGadgetClass),
//  *                                        (GClassInitFunc) gtk_gadget_class_intern_init,
//  *                                        sizeof (GtkGadget),
//  *                                        (GInstanceInitFunc) gtk_gadget_init,
//  *                                        0);
//  *       {
//  *         const GInterfaceInfo g_implement_interface_info = {
//  *           (GInterfaceInitFunc) gtk_gadget_gizmo_init
//  *         };
//  *         g_type_add_interface_static (g_define_type_id, TYPE_GIZMO, &g_implement_interface_info);
//  *       }
//  *       g_once_init_leave (&g_define_type_id__volatile, g_define_type_id);
//  *     }
//  *   return g_define_type_id__volatile;
//  * }
//  * ]|
//  * The only pieces which have to be manually provided are the definitions of
//  * the instance and class structure and the definitions of the instance and
//  * class init functions.
//  *
//  * Since: 2.4
//  */
// #define G_DEFINE_TYPE_EXTENDED(TN, t_n, T_P, _f_, _C_)	    _G_DEFINE_TYPE_EXTENDED_BEGIN (TN, t_n, T_P, _f_) {_C_;} _G_DEFINE_TYPE_EXTENDED_END()
//
// /**
//  * G_DEFINE_INTERFACE:
//  * @TN: The name of the new type, in Camel case.
//  * @t_n: The name of the new type, in lowercase, with words separated by '_'.
//  * @T_P: The #GType of the prerequisite type for the interface, or 0
//  * (%G_TYPE_INVALID) for no prerequisite type.
//  *
//  * A convenience macro for #GTypeInterface definitions, which declares
//  * a default vtable initialization function and defines a *_get_type()
//  * function.
//  *
//  * The macro expects the interface initialization function to have the
//  * name `t_n ## _default_init`, and the interface structure to have the
//  * name `TN ## Interface`.
//  *
//  * Since: 2.24
//  */
// #define G_DEFINE_INTERFACE(TN, t_n, T_P)		    G_DEFINE_INTERFACE_WITH_CODE(TN, t_n, T_P, ;)
//
// /**
//  * G_DEFINE_INTERFACE_WITH_CODE:
//  * @TN: The name of the new type, in Camel case.
//  * @t_n: The name of the new type, in lowercase, with words separated by '_'.
//  * @T_P: The #GType of the prerequisite type for the interface, or 0
//  * (%G_TYPE_INVALID) for no prerequisite type.
//  * @_C_: Custom code that gets inserted in the *_get_type() function.
//  *
//  * A convenience macro for #GTypeInterface definitions. Similar to
//  * G_DEFINE_INTERFACE(), but allows you to insert custom code into the
//  * *_get_type() function, e.g. additional interface implementations
//  * via G_IMPLEMENT_INTERFACE(), or additional prerequisite types. See
//  * G_DEFINE_TYPE_EXTENDED() for a similar example using
//  * G_DEFINE_TYPE_WITH_CODE().
//  *
//  * Since: 2.24
//  */
// #define G_DEFINE_INTERFACE_WITH_CODE(TN, t_n, T_P, _C_)     _G_DEFINE_INTERFACE_EXTENDED_BEGIN(TN, t_n, T_P) {_C_;} _G_DEFINE_INTERFACE_EXTENDED_END()
//
// /**
//  * G_IMPLEMENT_INTERFACE:
//  * @TYPE_IFACE: The #GType of the interface to add
//  * @iface_init: The interface init function
//  *
//  * A convenience macro to ease interface addition in the `_C_` section
//  * of G_DEFINE_TYPE_WITH_CODE() or G_DEFINE_ABSTRACT_TYPE_WITH_CODE().
//  * See G_DEFINE_TYPE_EXTENDED() for an example.
//  *
//  * Note that this macro can only be used together with the G_DEFINE_TYPE_*
//  * macros, since it depends on variable names from those macros.
//  *
//  * Since: 2.4
//  */
// #define G_IMPLEMENT_INTERFACE(TYPE_IFACE, iface_init)       { \
//   const GInterfaceInfo g_implement_interface_info = { \
//     (GInterfaceInitFunc) iface_init, NULL, NULL \
//   }; \
//   g_type_add_interface_static (g_define_type_id, TYPE_IFACE, &g_implement_interface_info); \
// }
//
// /**
//  * G_ADD_PRIVATE:
//  * @TypeName: the name of the type in CamelCase
//  *
//  * A convenience macro to ease adding private data to instances of a new type
//  * in the @_C_ section of G_DEFINE_TYPE_WITH_CODE() or
//  * G_DEFINE_ABSTRACT_TYPE_WITH_CODE().
//  *
//  * For instance:
//  *
//  * |[<!-- language="C" -->
//  *   typedef struct _MyObject MyObject;
//  *   typedef struct _MyObjectClass MyObjectClass;
//  *
//  *   typedef struct {
//  *     gint foo;
//  *     gint bar;
//  *   } MyObjectPrivate;
//  *
//  *   G_DEFINE_TYPE_WITH_CODE (MyObject, my_object, G_TYPE_OBJECT,
//  *                            G_ADD_PRIVATE (MyObject))
//  * ]|
//  *
//  * Will add MyObjectPrivate as the private data to any instance of the MyObject
//  * type.
//  *
//  * G_DEFINE_TYPE_* macros will automatically create a private function
//  * based on the arguments to this macro, which can be used to safely
//  * retrieve the private data from an instance of the type; for instance:
//  *
//  * |[<!-- language="C" -->
//  *   gint
//  *   my_object_get_foo (MyObject *obj)
//  *   {
//  *     MyObjectPrivate *priv = my_object_get_instance_private (obj);
//  *
//  *     return priv->foo;
//  *   }
//  *
//  *   void
//  *   my_object_set_bar (MyObject *obj,
//  *                      gint      bar)
//  *   {
//  *     MyObjectPrivate *priv = my_object_get_instance_private (obj);
//  *
//  *     if (priv->bar != bar)
//  *       priv->bar = bar;
//  *   }
//  * ]|
//  *
//  * Note that this macro can only be used together with the G_DEFINE_TYPE_*
//  * macros, since it depends on variable names from those macros.
//  *
//  * Also note that private structs added with these macros must have a struct
//  * name of the form `TypeNamePrivate`.
//  *
//  * Since: 2.38
//  */
// #define G_ADD_PRIVATE(TypeName) { \
//   TypeName##_private_offset = \
//     g_type_add_instance_private (g_define_type_id, sizeof (TypeName##Private)); \
// }
//
// /**
//  * G_PRIVATE_OFFSET:
//  * @TypeName: the name of the type in CamelCase
//  * @field: the name of the field in the private data structure
//  *
//  * Evaluates to the offset of the @field inside the instance private data
//  * structure for @TypeName.
//  *
//  * Note that this macro can only be used together with the G_DEFINE_TYPE_*
//  * and G_ADD_PRIVATE() macros, since it depends on variable names from
//  * those macros.
//  *
//  * Since: 2.38
//  */
// #define G_PRIVATE_OFFSET(TypeName, field) \
//   (TypeName##_private_offset + (G_STRUCT_OFFSET (TypeName##Private, field)))
//
// /**
//  * G_PRIVATE_FIELD_P:
//  * @TypeName: the name of the type in CamelCase
//  * @inst: the instance of @TypeName you wish to access
//  * @field_name: the name of the field in the private data structure
//  *
//  * Evaluates to a pointer to the @field_name inside the @inst private data
//  * structure for @TypeName.
//  *
//  * Note that this macro can only be used together with the G_DEFINE_TYPE_*
//  * and G_ADD_PRIVATE() macros, since it depends on variable names from
//  * those macros.
//  *
//  * Since: 2.38
//  */
// #define G_PRIVATE_FIELD_P(TypeName, inst, field_name) \
//   G_STRUCT_MEMBER_P (inst, G_PRIVATE_OFFSET (TypeName, field_name))
//
// /**
//  * G_PRIVATE_FIELD:
//  * @TypeName: the name of the type in CamelCase
//  * @inst: the instance of @TypeName you wish to access
//  * @field_type: the type of the field in the private data structure
//  * @field_name: the name of the field in the private data structure
//  *
//  * Evaluates to the @field_name inside the @inst private data
//  * structure for @TypeName.
//  *
//  * Note that this macro can only be used together with the G_DEFINE_TYPE_*
//  * and G_ADD_PRIVATE() macros, since it depends on variable names from
//  * those macros.
//  *
//  * Since: 2.38
//  */
// #define G_PRIVATE_FIELD(TypeName, inst, field_type, field_name) \
//   G_STRUCT_MEMBER (field_type, inst, G_PRIVATE_OFFSET (TypeName, field_name))
//
// /* we need to have this macro under conditional expansion, as it references
//  * a function that has been added in 2.38. see bug:
//  * https://bugzilla.gnome.org/show_bug.cgi?id=703191
//  */
// #if GLIB_VERSION_MAX_ALLOWED >= GLIB_VERSION_2_38
// #define _G_DEFINE_TYPE_EXTENDED_CLASS_INIT(TypeName, type_name) \
// static void     type_name##_class_intern_init (gpointer klass) \
// { \
//   type_name##_parent_class = g_type_class_peek_parent (klass); \
//   if (TypeName##_private_offset != 0) \
//     g_type_class_adjust_private_offset (klass, &TypeName##_private_offset); \
//   type_name##_class_init ((TypeName##Class*) klass); \
// }
//
// #else
// #define _G_DEFINE_TYPE_EXTENDED_CLASS_INIT(TypeName, type_name) \
// static void     type_name##_class_intern_init (gpointer klass) \
// { \
//   type_name##_parent_class = g_type_class_peek_parent (klass); \
//   type_name##_class_init ((TypeName##Class*) klass); \
// }
// #endif /* GLIB_VERSION_MAX_ALLOWED >= GLIB_VERSION_2_38 */
//
// #define _G_DEFINE_TYPE_EXTENDED_BEGIN(TypeName, type_name, TYPE_PARENT, flags) \
// \
// static void     type_name##_init              (TypeName        *self); \
// static void     type_name##_class_init        (TypeName##Class *klass); \
// static gpointer type_name##_parent_class = NULL; \
// static gint     TypeName##_private_offset; \
// \
// _G_DEFINE_TYPE_EXTENDED_CLASS_INIT(TypeName, type_name) \
// \
// G_GNUC_UNUSED \
// static inline gpointer \
// type_name##_get_instance_private (TypeName *self) \
// { \
//   return (G_STRUCT_MEMBER_P (self, TypeName##_private_offset)); \
// } \
// \
// GType \
// type_name##_get_type (void) \
// { \
//   static volatile gsize g_define_type_id__volatile = 0; \
//   if (g_once_init_enter (&g_define_type_id__volatile))  \
//     { \
//       GType g_define_type_id = \
//         g_type_register_static_simple (TYPE_PARENT, \
//                                        g_intern_static_string (#TypeName), \
//                                        sizeof (TypeName##Class), \
//                                        (GClassInitFunc) type_name##_class_intern_init, \
//                                        sizeof (TypeName), \
//                                        (GInstanceInitFunc) type_name##_init, \
//                                        (GTypeFlags) flags); \
//       { /* custom code follows */
// #define _G_DEFINE_TYPE_EXTENDED_END()	\
//         /* following custom code */	\
//       }					\
//       g_once_init_leave (&g_define_type_id__volatile, g_define_type_id); \
//     }					\
//   return g_define_type_id__volatile;	\
// } /* closes type_name##_get_type() */
//
// #define _G_DEFINE_INTERFACE_EXTENDED_BEGIN(TypeName, type_name, TYPE_PREREQ) \
// \
// static void     type_name##_default_init        (TypeName##Interface *klass); \
// \
// GType \
// type_name##_get_type (void) \
// { \
//   static volatile gsize g_define_type_id__volatile = 0; \
//   if (g_once_init_enter (&g_define_type_id__volatile))  \
//     { \
//       GType g_define_type_id = \
//         g_type_register_static_simple (G_TYPE_INTERFACE, \
//                                        g_intern_static_string (#TypeName), \
//                                        sizeof (TypeName##Interface), \
//                                        (GClassInitFunc)type_name##_default_init, \
//                                        0, \
//                                        (GInstanceInitFunc)NULL, \
//                                        (GTypeFlags) 0); \
//       if (TYPE_PREREQ) \
//         g_type_interface_add_prerequisite (g_define_type_id, TYPE_PREREQ); \
//       { /* custom code follows */
// #define _G_DEFINE_INTERFACE_EXTENDED_END()	\
//         /* following custom code */		\
//       }						\
//       g_once_init_leave (&g_define_type_id__volatile, g_define_type_id); \
//     }						\
//   return g_define_type_id__volatile;			\
// } /* closes type_name##_get_type() */
//
// /**
//  * G_DEFINE_BOXED_TYPE:
//  * @TypeName: The name of the new type, in Camel case
//  * @type_name: The name of the new type, in lowercase, with words
//  *  separated by '_'
//  * @copy_func: the #GBoxedCopyFunc for the new type
//  * @free_func: the #GBoxedFreeFunc for the new type
//  *
//  * A convenience macro for boxed type implementations, which defines a
//  * type_name_get_type() function registering the boxed type.
//  *
//  * Since: 2.26
//  */
// #define G_DEFINE_BOXED_TYPE(TypeName, type_name, copy_func, free_func) G_DEFINE_BOXED_TYPE_WITH_CODE (TypeName, type_name, copy_func, free_func, {})
// /**
//  * G_DEFINE_BOXED_TYPE_WITH_CODE:
//  * @TypeName: The name of the new type, in Camel case
//  * @type_name: The name of the new type, in lowercase, with words
//  *  separated by '_'
//  * @copy_func: the #GBoxedCopyFunc for the new type
//  * @free_func: the #GBoxedFreeFunc for the new type
//  * @_C_: Custom code that gets inserted in the *_get_type() function
//  *
//  * A convenience macro for boxed type implementations.
//  * Similar to G_DEFINE_BOXED_TYPE(), but allows to insert custom code into the
//  * type_name_get_type() function, e.g. to register value transformations with
//  * g_value_register_transform_func().
//  *
//  * Since: 2.26
//  */
// #define G_DEFINE_BOXED_TYPE_WITH_CODE(TypeName, type_name, copy_func, free_func, _C_) _G_DEFINE_BOXED_TYPE_BEGIN (TypeName, type_name, copy_func, free_func) {_C_;} _G_DEFINE_TYPE_EXTENDED_END()
//
// /* Only use this in non-C++ on GCC >= 2.7, except for Darwin/ppc64.
//  * See https://bugzilla.gnome.org/show_bug.cgi?id=647145
//  */
// #if !defined (__cplusplus) && (__GNUC__ > 2 || (__GNUC__ == 2 && __GNUC_MINOR__ >= 7)) && !(defined (__APPLE__) && defined (__ppc64__))
// #define _G_DEFINE_BOXED_TYPE_BEGIN(TypeName, type_name, copy_func, free_func) \
// GType \
// type_name##_get_type (void) \
// { \
//   static volatile gsize g_define_type_id__volatile = 0; \
//   if (g_once_init_enter (&g_define_type_id__volatile))  \
//     { \
//       GType (* _g_register_boxed) \
//         (const gchar *, \
//          union \
//            { \
//              TypeName * (*do_copy_type) (TypeName *); \
//              TypeName * (*do_const_copy_type) (const TypeName *); \
//              GBoxedCopyFunc do_copy_boxed; \
//            } __attribute__((__transparent_union__)), \
//          union \
//            { \
//              void (* do_free_type) (TypeName *); \
//              GBoxedFreeFunc do_free_boxed; \
//            } __attribute__((__transparent_union__)) \
//         ) = g_boxed_type_register_static; \
//       GType g_define_type_id = \
//         _g_register_boxed (g_intern_static_string (#TypeName), copy_func, free_func); \
//       { /* custom code follows */
// #else
// #define _G_DEFINE_BOXED_TYPE_BEGIN(TypeName, type_name, copy_func, free_func) \
// GType \
// type_name##_get_type (void) \
// { \
//   static volatile gsize g_define_type_id__volatile = 0; \
//   if (g_once_init_enter (&g_define_type_id__volatile))  \
//     { \
//       GType g_define_type_id = \
//         g_boxed_type_register_static (g_intern_static_string (#TypeName), \
//                                       (GBoxedCopyFunc) copy_func, \
//                                       (GBoxedFreeFunc) free_func); \
//       { /* custom code follows */
// #endif /* __GNUC__ */
//
// /**
//  * G_DEFINE_POINTER_TYPE:
//  * @TypeName: The name of the new type, in Camel case
//  * @type_name: The name of the new type, in lowercase, with words
//  *  separated by '_'
//  *
//  * A convenience macro for pointer type implementations, which defines a
//  * type_name_get_type() function registering the pointer type.
//  *
//  * Since: 2.26
//  */
// #define G_DEFINE_POINTER_TYPE(TypeName, type_name) G_DEFINE_POINTER_TYPE_WITH_CODE (TypeName, type_name, {})
// /**
//  * G_DEFINE_POINTER_TYPE_WITH_CODE:
//  * @TypeName: The name of the new type, in Camel case
//  * @type_name: The name of the new type, in lowercase, with words
//  *  separated by '_'
//  * @_C_: Custom code that gets inserted in the *_get_type() function
//  *
//  * A convenience macro for pointer type implementations.
//  * Similar to G_DEFINE_POINTER_TYPE(), but allows to insert
//  * custom code into the type_name_get_type() function.
//  *
//  * Since: 2.26
//  */
// #define G_DEFINE_POINTER_TYPE_WITH_CODE(TypeName, type_name, _C_) _G_DEFINE_POINTER_TYPE_BEGIN (TypeName, type_name) {_C_;} _G_DEFINE_TYPE_EXTENDED_END()
//
// #define _G_DEFINE_POINTER_TYPE_BEGIN(TypeName, type_name) \
// GType \
// type_name##_get_type (void) \
// { \
//   static volatile gsize g_define_type_id__volatile = 0; \
//   if (g_once_init_enter (&g_define_type_id__volatile))  \
//     { \
//       GType g_define_type_id = \
//         g_pointer_type_register_static (g_intern_static_string (#TypeName)); \
//       { /* custom code follows */
//
/* --- protected (for fundamental type implementations) --- */
extern (C) {

    GTypePlugin*	 g_type_get_plugin		(GType		     type);

    GTypePlugin*	 g_type_interface_get_plugin	(GType		     instance_type,
                             GType               interface_type);

    GType		 g_type_fundamental_next	();

    GType		 g_type_fundamental		(GType		     type_id);

    GTypeInstance*   g_type_create_instance         (GType               type);

    void             g_type_free_instance           (GTypeInstance      *instance);


    void		 g_type_add_class_cache_func    (gpointer	     cache_data,
                             GTypeClassCacheFunc cache_func);

    void		 g_type_remove_class_cache_func (gpointer	     cache_data,
                             GTypeClassCacheFunc cache_func);

    void             g_type_class_unref_uncached    (gpointer            g_class);


    void             g_type_add_interface_check     (gpointer	         check_data,
                             GTypeInterfaceCheckFunc check_func);

    void             g_type_remove_interface_check  (gpointer	         check_data,
                             GTypeInterfaceCheckFunc check_func);


    GTypeValueTable* g_type_value_table_peek        (GType		     type);


    /*< private >*/

    pure gboolean	 g_type_check_instance          (GTypeInstance      *instance);

    GTypeInstance*   g_type_check_instance_cast     (GTypeInstance      *instance,
                             GType               iface_type);

    pure gboolean         g_type_check_instance_is_a	(GTypeInstance      *instance,
                             GType               iface_type);

    pure gboolean         g_type_check_instance_is_fundamentally_a (GTypeInstance *instance,
                                                               GType          fundamental_type);

    GTypeClass*      g_type_check_class_cast        (GTypeClass         *g_class,
                             GType               is_a_type);

    pure gboolean         g_type_check_class_is_a        (GTypeClass         *g_class,
                             GType               is_a_type);

    pure gboolean	 g_type_check_is_value_type     (GType		     type);

    pure gboolean	 g_type_check_value             (GValue		    *value);

    pure gboolean	 g_type_check_value_holds	(GValue		    *value,
                             GType		     type);

    pure gboolean         g_type_test_flags              (GType               type,
                             guint               flags);


    /* --- debugging functions --- */

    const(gchar) *    g_type_name_from_instance      (GTypeInstance	*instance);

    const(gchar) *    g_type_name_from_class         (GTypeClass	*g_class);

}

// /* --- implementation bits --- */
// #ifndef G_DISABLE_CAST_CHECKS
// #  define _G_TYPE_CIC(ip, gt, ct) \
//     ((ct*) g_type_check_instance_cast ((GTypeInstance*) ip, gt))
// #  define _G_TYPE_CCC(cp, gt, ct) \
//     ((ct*) g_type_check_class_cast ((GTypeClass*) cp, gt))
// #else /* G_DISABLE_CAST_CHECKS */
// #  define _G_TYPE_CIC(ip, gt, ct)       ((ct*) ip)
// #  define _G_TYPE_CCC(cp, gt, ct)       ((ct*) cp)
// #endif /* G_DISABLE_CAST_CHECKS */
// #define _G_TYPE_CHI(ip)			(g_type_check_instance ((GTypeInstance*) ip))
// #define _G_TYPE_CHV(vl)			(g_type_check_value ((GValue*) vl))
// #define _G_TYPE_IGC(ip, gt, ct)         ((ct*) (((GTypeInstance*) ip)->g_class))
// #define _G_TYPE_IGI(ip, gt, ct)         ((ct*) g_type_interface_peek (((GTypeInstance*) ip)->g_class, gt))
// #define _G_TYPE_CIFT(ip, ft)            (g_type_check_instance_is_fundamentally_a ((GTypeInstance*) ip, ft))
// #ifdef	__GNUC__
// #  define _G_TYPE_CIT(ip, gt)             (G_GNUC_EXTENSION ({ \
//   GTypeInstance *__inst = (GTypeInstance*) ip; GType __t = gt; gboolean __r; \
//   if (!__inst) \
//     __r = FALSE; \
//   else if (__inst->g_class && __inst->g_class->g_type == __t) \
//     __r = TRUE; \
//   else \
//     __r = g_type_check_instance_is_a (__inst, __t); \
//   __r; \
// }))
// #  define _G_TYPE_CCT(cp, gt)             (G_GNUC_EXTENSION ({ \
//   GTypeClass *__class = (GTypeClass*) cp; GType __t = gt; gboolean __r; \
//   if (!__class) \
//     __r = FALSE; \
//   else if (__class->g_type == __t) \
//     __r = TRUE; \
//   else \
//     __r = g_type_check_class_is_a (__class, __t); \
//   __r; \
// }))
// #  define _G_TYPE_CVH(vl, gt)             (G_GNUC_EXTENSION ({ \
//   GValue *__val = (GValue*) vl; GType __t = gt; gboolean __r; \
//   if (!__val) \
//     __r = FALSE; \
//   else if (__val->g_type == __t)		\
//     __r = TRUE; \
//   else \
//     __r = g_type_check_value_holds (__val, __t); \
//   __r; \
// }))
// #else  /* !__GNUC__ */
// #  define _G_TYPE_CIT(ip, gt)             (g_type_check_instance_is_a ((GTypeInstance*) ip, gt))
// #  define _G_TYPE_CCT(cp, gt)             (g_type_check_class_is_a ((GTypeClass*) cp, gt))
// #  define _G_TYPE_CVH(vl, gt)             (g_type_check_value_holds ((GValue*) vl, gt))
// #endif /* !__GNUC__ */
// /**
//  * G_TYPE_FLAG_RESERVED_ID_BIT:
//  *
//  * A bit in the type number that's supposed to be left untouched.
//  */
// #define	G_TYPE_FLAG_RESERVED_ID_BIT	((GType) (1 << 0))

