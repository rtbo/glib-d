/*
 * Distributed under the Boost Software License, Version 1.0.
 *    (See accompanying file LICENSE_1_0.txt or copy at
 *          http://www.boost.org/LICENSE_1_0.txt)
 */
module gobject.gtypemodule;

import gobject.gobject;
import gobject.genums;
import gobject.gtype;

import glib;


// #define G_TYPE_TYPE_MODULE              (g_type_module_get_type ())
// #define G_TYPE_MODULE(module)           (G_TYPE_CHECK_INSTANCE_CAST ((module), G_TYPE_TYPE_MODULE, GTypeModule))
// #define G_TYPE_MODULE_CLASS(class)      (G_TYPE_CHECK_CLASS_CAST ((class), G_TYPE_TYPE_MODULE, GTypeModuleClass))
// #define G_IS_TYPE_MODULE(module)        (G_TYPE_CHECK_INSTANCE_TYPE ((module), G_TYPE_TYPE_MODULE))
// #define G_IS_TYPE_MODULE_CLASS(class)   (G_TYPE_CHECK_CLASS_TYPE ((class), G_TYPE_TYPE_MODULE))
// #define G_TYPE_MODULE_GET_CLASS(module) (G_TYPE_INSTANCE_GET_CLASS ((module), G_TYPE_TYPE_MODULE, GTypeModuleClass))


extern (C):

struct GTypeModule
{
  GObject parent_instance;

  guint use_count;
  GSList *type_infos;
  GSList *interface_infos;

  /*< public >*/
  gchar *name;
}

struct GTypeModuleClass
{
  GObjectClass parent_class;

  /*< public >*/
  gboolean function   (GTypeModule *mod) load;
  void     function (GTypeModule *mod) unload;

  /*< private >*/
  /* Padding for future expansion */
  void function () reserved1;
  void function () reserved2;
  void function () reserved3;
  void function () reserved4;
}

// /**
//  * G_DEFINE_DYNAMIC_TYPE:
//  * @TN: The name of the new type, in Camel case.
//  * @t_n: The name of the new type, in lowercase, with words
//  *  separated by '_'.
//  * @T_P: The #GType of the parent type.
//  *
//  * A convenience macro for dynamic type implementations, which declares a
//  * class initialization function, an instance initialization function (see
//  * #GTypeInfo for information about these) and a static variable named
//  * @t_n<!-- -->_parent_class pointing to the parent class. Furthermore,
//  * it defines a `*_get_type()` and a static `*_register_type()` functions
//  * for use in your `module_init()`.
//  *
//  * See G_DEFINE_DYNAMIC_TYPE_EXTENDED() for an example.
//  *
//  * Since: 2.14
//  */
// #define G_DEFINE_DYNAMIC_TYPE(TN, t_n, T_P)          G_DEFINE_DYNAMIC_TYPE_EXTENDED (TN, t_n, T_P, 0, {})
// /**
//  * G_DEFINE_DYNAMIC_TYPE_EXTENDED:
//  * @TypeName: The name of the new type, in Camel case.
//  * @type_name: The name of the new type, in lowercase, with words
//  *  separated by '_'.
//  * @TYPE_PARENT: The #GType of the parent type.
//  * @flags: #GTypeFlags to pass to g_type_module_register_type()
//  * @CODE: Custom code that gets inserted in the *_get_type() function.
//  *
//  * A more general version of G_DEFINE_DYNAMIC_TYPE() which
//  * allows to specify #GTypeFlags and custom code.
//  *
//  * |[
//  * G_DEFINE_DYNAMIC_TYPE_EXTENDED (GtkGadget,
//  *                                 gtk_gadget,
//  *                                 GTK_TYPE_THING,
//  *                                 0,
//  *                                 G_IMPLEMENT_INTERFACE_DYNAMIC (TYPE_GIZMO,
//  *                                                                gtk_gadget_gizmo_init));
//  * ]|
//  * expands to
//  * |[
//  * static void     gtk_gadget_init              (GtkGadget      *self);
//  * static void     gtk_gadget_class_init        (GtkGadgetClass *klass);
//  * static void     gtk_gadget_class_finalize    (GtkGadgetClass *klass);
//  *
//  * static gpointer gtk_gadget_parent_class = NULL;
//  * static GType    gtk_gadget_type_id = 0;
//  *
//  * static void     gtk_gadget_class_intern_init (gpointer klass)
//  * {
//  *   gtk_gadget_parent_class = g_type_class_peek_parent (klass);
//  *   gtk_gadget_class_init ((GtkGadgetClass*) klass);
//  * }
//  *
//  * GType
//  * gtk_gadget_get_type (void)
//  * {
//  *   return gtk_gadget_type_id;
//  * }
//  *
//  * static void
//  * gtk_gadget_register_type (GTypeModule *type_module)
//  * {
//  *   const GTypeInfo g_define_type_info = {
//  *     sizeof (GtkGadgetClass),
//  *     (GBaseInitFunc) NULL,
//  *     (GBaseFinalizeFunc) NULL,
//  *     (GClassInitFunc) gtk_gadget_class_intern_init,
//  *     (GClassFinalizeFunc) gtk_gadget_class_finalize,
//  *     NULL,   // class_data
//  *     sizeof (GtkGadget),
//  *     0,      // n_preallocs
//  *     (GInstanceInitFunc) gtk_gadget_init,
//  *     NULL    // value_table
//  *   };
//  *   gtk_gadget_type_id = g_type_module_register_type (type_module,
//  *                                                     GTK_TYPE_THING,
//  *                                                     "GtkGadget",
//  *                                                     &g_define_type_info,
//  *                                                     (GTypeFlags) flags);
//  *   {
//  *     const GInterfaceInfo g_implement_interface_info = {
//  *       (GInterfaceInitFunc) gtk_gadget_gizmo_init
//  *     };
//  *     g_type_module_add_interface (type_module, g_define_type_id, TYPE_GIZMO, &g_implement_interface_info);
//  *   }
//  * }
//  * ]|
//  *
//  * Since: 2.14
//  */
// #define G_DEFINE_DYNAMIC_TYPE_EXTENDED(TypeName, type_name, TYPE_PARENT, flags, CODE) \
// static void     type_name##_init              (TypeName        *self); \
// static void     type_name##_class_init        (TypeName##Class *klass); \
// static void     type_name##_class_finalize    (TypeName##Class *klass); \
// static gpointer type_name##_parent_class = NULL; \
// static GType    type_name##_type_id = 0; \
// static gint     TypeName##_private_offset; \
// \
// _G_DEFINE_TYPE_EXTENDED_CLASS_INIT(TypeName, type_name) \
// \
// static inline gpointer \
// type_name##_get_instance_private (TypeName *self) \
// { \
//   return (G_STRUCT_MEMBER_P (self, TypeName##_private_offset)); \
// } \
// \
// GType \
// type_name##_get_type (void) \
// { \
//   return type_name##_type_id; \
// } \
// static void \
// type_name##_register_type (GTypeModule *type_module) \
// { \
//   GType g_define_type_id G_GNUC_UNUSED; \
//   const GTypeInfo g_define_type_info = { \
//     sizeof (TypeName##Class), \
//     (GBaseInitFunc) NULL, \
//     (GBaseFinalizeFunc) NULL, \
//     (GClassInitFunc) type_name##_class_intern_init, \
//     (GClassFinalizeFunc) type_name##_class_finalize, \
//     NULL,   /* class_data */ \
//     sizeof (TypeName), \
//     0,      /* n_preallocs */ \
//     (GInstanceInitFunc) type_name##_init, \
//     NULL    /* value_table */ \
//   }; \
//   type_name##_type_id = g_type_module_register_type (type_module, \
// 						     TYPE_PARENT, \
// 						     #TypeName, \
// 						     &g_define_type_info, \
// 						     (GTypeFlags) flags); \
//   g_define_type_id = type_name##_type_id; \
//   { CODE ; } \
// }
//
// /**
//  * G_IMPLEMENT_INTERFACE_DYNAMIC:
//  * @TYPE_IFACE: The #GType of the interface to add
//  * @iface_init: The interface init function
//  *
//  * A convenience macro to ease interface addition in the @_C_ section
//  * of G_DEFINE_DYNAMIC_TYPE_EXTENDED(). See G_DEFINE_DYNAMIC_TYPE_EXTENDED()
//  * for an example.
//  *
//  * Note that this macro can only be used together with the
//  * G_DEFINE_DYNAMIC_TYPE_EXTENDED macros, since it depends on variable
//  * names from that macro.
//  *
//  * Since: 2.24
//  */
// #define G_IMPLEMENT_INTERFACE_DYNAMIC(TYPE_IFACE, iface_init)       { \
//   const GInterfaceInfo g_implement_interface_info = { \
//     (GInterfaceInitFunc) iface_init, NULL, NULL      \
//   }; \
//   g_type_module_add_interface (type_module, g_define_type_id, TYPE_IFACE, &g_implement_interface_info); \
// }
//
// #define G_ADD_PRIVATE_DYNAMIC(TypeName)         { \
//   TypeName##_private_offset = sizeof (TypeName##Private); \
// }


pure GType    g_type_module_get_type       ();

gboolean g_type_module_use            (GTypeModule          *mod);

void     g_type_module_unuse          (GTypeModule          *mod);

void     g_type_module_set_name       (GTypeModule          *mod,
                                       const(gchar)          *name);

GType    g_type_module_register_type  (GTypeModule          *mod,
                                       GType                 parent_type,
                                       const(gchar)          *type_name,
                                       const(GTypeInfo)      *type_info,
                                       GTypeFlags            flags);

void     g_type_module_add_interface  (GTypeModule          *mod,
                                       GType                 instance_type,
                                       GType                 interface_type,
                                       const(GInterfaceInfo) *interface_info);

GType    g_type_module_register_enum  (GTypeModule          *mod,
                                       const(gchar)          *name,
                                       const(GEnumValue)     *const_static_values);

GType    g_type_module_register_flags (GTypeModule          *mod,
                                       const(gchar)          *name,
                                       const(GFlagsValue)    *const_static_values);

