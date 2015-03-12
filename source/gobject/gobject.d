module gobject.gobject;

import gobject.gtype;
import gobject.gvalue;
import gobject.gparam;
import gobject.gclosure;
import gobject.gsignal;
import gobject.gboxed;

import glib;

import core.stdc.stdarg;

extern (C):

// /**
//  * G_TYPE_IS_OBJECT:
//  * @type: Type id to check
//  *
//  * Check if the passed in type id is a %G_TYPE_OBJECT or derived from it.
//  *
//  * Returns: %FALSE or %TRUE, indicating whether @type is a %G_TYPE_OBJECT.
//  */
bool G_TYPE_IS_OBJECT(T)(T t) { return G_TYPE_FUNDAMENTAL(t) == G_TYPE_OBJECT; }
// #define G_TYPE_IS_OBJECT(type)      (G_TYPE_FUNDAMENTAL (type) == G_TYPE_OBJECT)

// /**
//  * G_OBJECT:
//  * @object: Object which is subject to casting.
//  *
//  * Casts a #GObject or derived pointer into a (GObject*) pointer.
//  * Depending on the current debugging level, this function may invoke
//  * certain runtime checks to identify invalid casts.
//  */
// #define G_OBJECT(object)            (G_TYPE_CHECK_INSTANCE_CAST ((object), G_TYPE_OBJECT, GObject))
// /**
//  * G_OBJECT_CLASS:
//  * @class: a valid #GObjectClass
//  *
//  * Casts a derived #GObjectClass structure into a #GObjectClass structure.
//  */
// #define G_OBJECT_CLASS(class)       (G_TYPE_CHECK_CLASS_CAST ((class), G_TYPE_OBJECT, GObjectClass))
// /**
//  * G_IS_OBJECT:
//  * @object: Instance to check for being a %G_TYPE_OBJECT.
//  *
//  * Checks whether a valid #GTypeInstance pointer is of type %G_TYPE_OBJECT.
//  */
// #if GLIB_VERSION_MAX_ALLOWED >= GLIB_VERSION_2_42
// #define G_IS_OBJECT(object)         (G_TYPE_CHECK_INSTANCE_FUNDAMENTAL_TYPE ((object), G_TYPE_OBJECT))
// #else
// #define G_IS_OBJECT(object)         (G_TYPE_CHECK_INSTANCE_TYPE ((object), G_TYPE_OBJECT))
// #endif
// /**
//  * G_IS_OBJECT_CLASS:
//  * @class: a #GObjectClass
//  *
//  * Checks whether @class "is a" valid #GObjectClass structure of type
//  * %G_TYPE_OBJECT or derived.
//  */
// #define G_IS_OBJECT_CLASS(class)    (G_TYPE_CHECK_CLASS_TYPE ((class), G_TYPE_OBJECT))
// /**
//  * G_OBJECT_GET_CLASS:
//  * @object: a #GObject instance.
//  *
//  * Get the class structure associated to a #GObject instance.
//  *
//  * Returns: pointer to object class structure.
//  */
// #define G_OBJECT_GET_CLASS(object)  (G_TYPE_INSTANCE_GET_CLASS ((object), G_TYPE_OBJECT, GObjectClass))
// /**
//  * G_OBJECT_TYPE:
//  * @object: Object to return the type id for.
//  *
//  * Get the type id of an object.
//  *
//  * Returns: Type id of @object.
//  */
auto G_OBJECT_TYPE(O)(O object) { return G_TYPE_FROM_INSTANCE(object); }
// #define G_OBJECT_TYPE(object)       (G_TYPE_FROM_INSTANCE (object))

// /**
//  * G_OBJECT_TYPE_NAME:
//  * @object: Object to return the type name for.
//  *
//  * Get the name of an object's type.
//  *
//  * Returns: Type name of @object. The string is owned by the type system and
//  *  should not be freed.
//  */
auto G_OBJECT_TYPE_NAME(O)(O object) { return g_type_name(G_OBJECT_TYPE(object)); }
// #define G_OBJECT_TYPE_NAME(object)  (g_type_name (G_OBJECT_TYPE (object)))

// /**
//  * G_OBJECT_CLASS_TYPE:
//  * @class: a valid #GObjectClass
//  *
//  * Get the type id of a class structure.
//  *
//  * Returns: Type id of @class.
//  */
// #define G_OBJECT_CLASS_TYPE(class)  (G_TYPE_FROM_CLASS (class))
// /**
//  * G_OBJECT_CLASS_NAME:
//  * @class: a valid #GObjectClass
//  *
//  * Return the name of a class structure's type.
//  *
//  * Returns: Type name of @class. The string is owned by the type system and
//  *  should not be freed.
//  */
// #define G_OBJECT_CLASS_NAME(class)  (g_type_name (G_OBJECT_CLASS_TYPE (class)))
// /**
//  * G_VALUE_HOLDS_OBJECT:
//  * @value: a valid #GValue structure
//  *
//  * Checks whether the given #GValue can hold values derived from type %G_TYPE_OBJECT.
//  *
//  * Returns: %TRUE on success.
//  */
// #define G_VALUE_HOLDS_OBJECT(value) (G_TYPE_CHECK_VALUE_TYPE ((value), G_TYPE_OBJECT))
//
// /* --- type macros --- */
// /**
//  * G_TYPE_INITIALLY_UNOWNED:
//  *
//  * The type for #GInitiallyUnowned.
//  */
// #define G_TYPE_INITIALLY_UNOWNED	      (g_initially_unowned_get_type())
// /**
//  * G_INITIALLY_UNOWNED:
//  * @object: Object which is subject to casting.
//  *
//  * Casts a #GInitiallyUnowned or derived pointer into a (GInitiallyUnowned*)
//  * pointer. Depending on the current debugging level, this function may invoke
//  * certain runtime checks to identify invalid casts.
//  */
// #define G_INITIALLY_UNOWNED(object)           (G_TYPE_CHECK_INSTANCE_CAST ((object), G_TYPE_INITIALLY_UNOWNED, GInitiallyUnowned))
// /**
//  * G_INITIALLY_UNOWNED_CLASS:
//  * @class: a valid #GInitiallyUnownedClass
//  *
//  * Casts a derived #GInitiallyUnownedClass structure into a
//  * #GInitiallyUnownedClass structure.
//  */
// #define G_INITIALLY_UNOWNED_CLASS(class)      (G_TYPE_CHECK_CLASS_CAST ((class), G_TYPE_INITIALLY_UNOWNED, GInitiallyUnownedClass))
// /**
//  * G_IS_INITIALLY_UNOWNED:
//  * @object: Instance to check for being a %G_TYPE_INITIALLY_UNOWNED.
//  *
//  * Checks whether a valid #GTypeInstance pointer is of type %G_TYPE_INITIALLY_UNOWNED.
//  */
// #define G_IS_INITIALLY_UNOWNED(object)        (G_TYPE_CHECK_INSTANCE_TYPE ((object), G_TYPE_INITIALLY_UNOWNED))
// /**
//  * G_IS_INITIALLY_UNOWNED_CLASS:
//  * @class: a #GInitiallyUnownedClass
//  *
//  * Checks whether @class "is a" valid #GInitiallyUnownedClass structure of type
//  * %G_TYPE_INITIALLY_UNOWNED or derived.
//  */
// #define G_IS_INITIALLY_UNOWNED_CLASS(class)   (G_TYPE_CHECK_CLASS_TYPE ((class), G_TYPE_INITIALLY_UNOWNED))
// /**
//  * G_INITIALLY_UNOWNED_GET_CLASS:
//  * @object: a #GInitiallyUnowned instance.
//  *
//  * Get the class structure associated to a #GInitiallyUnowned instance.
//  *
//  * Returns: pointer to object class structure.
//  */
// #define G_INITIALLY_UNOWNED_GET_CLASS(object) (G_TYPE_INSTANCE_GET_CLASS ((object), G_TYPE_INITIALLY_UNOWNED, GInitiallyUnownedClass))
// /* GInitiallyUnowned ia a GObject with initially floating reference count */


/* --- typedefs & structures --- */
alias GInitiallyUnowned = GObject;
alias GInitiallyUnownedClass = GObjectClass;
//typedef struct _GObjectConstructParam    GObjectConstructParam;

alias GObjectGetPropertyFunc = void function (GObject      *object,
                                         guint         property_id,
                                         GValue       *value,
                                         GParamSpec   *pspec);

alias GObjectSetPropertyFunc = void function (GObject      *object,
                                         guint         property_id,
                                         const GValue *value,
                                         GParamSpec   *pspec);

alias GObjectFinalizeFunc = void function (GObject      *object);

alias GWeakNotify = void function (gpointer      data,
					 GObject      *where_the_object_was);

struct GObject
{
  GTypeInstance  g_type_instance;

  /*< private >*/
  guint ref_count;
  GData         *qdata;
}

struct  GObjectClass
{
  GTypeClass   g_type_class;

  /*< private >*/
  GSList      *construct_properties;

  /*< public >*/
  /* seldom overidden */
  GObject*   function     (GType                  type,
                                 guint                  n_construct_properties,
                                 GObjectConstructParam *construct_properties) constructor;
  /* overridable methods */
  void       function		(GObject        *object,
                                         guint           property_id,
                                         const(GValue)   *value,
                                         GParamSpec     *pspec) set_property;
  void       function		(GObject        *object,
                                         guint           property_id,
                                         GValue         *value,
                                         GParamSpec     *pspec) get_property;
  void       function			(GObject        *object) dispose;
  void       function		(GObject        *object) finalize;
  /* seldom overidden */
  void       function (GObject      *object,
					     guint	   n_pspecs,
					     GParamSpec  **pspecs) dispatch_properties_changed;
  /* signals */
  void	     function			(GObject	*object,
					 GParamSpec	*pspec) notify;

  /* called when done constructing */
  void	     function		(GObject	*object) constructed;

  /*< private >*/
  gsize		flags;

  /* padding */
  gpointer[6]	pdummy;
}

struct GObjectConstructParam
{
  GParamSpec *pspec;
  GValue     *value;
}

/**
 * GInitiallyUnowned:
 *
 * All the fields in the GInitiallyUnowned structure
 * are private to the #GInitiallyUnowned implementation and should never be
 * accessed directly.
 */
/**
 * GInitiallyUnownedClass:
 *
 * The class structure for the GInitiallyUnowned type.
 */


/* --- prototypes --- */

GType       g_initially_unowned_get_type      ();

void        g_object_class_install_property   (GObjectClass   *oclass,
					       guint           property_id,
					       GParamSpec     *pspec);

GParamSpec* g_object_class_find_property      (GObjectClass   *oclass,
					       const(gchar)    *property_name);

GParamSpec**g_object_class_list_properties    (GObjectClass   *oclass,
					       guint	      *n_properties);

void        g_object_class_override_property  (GObjectClass   *oclass,
					       guint           property_id,
					       const(gchar)    *name);

void        g_object_class_install_properties (GObjectClass   *oclass,
                                               guint           n_pspecs,
                                               GParamSpec    **pspecs);


void        g_object_interface_install_property (gpointer     g_iface,
						 GParamSpec  *pspec);

GParamSpec* g_object_interface_find_property    (gpointer     g_iface,
						 const(gchar) *property_name);

GParamSpec**g_object_interface_list_properties  (gpointer     g_iface,
						 guint       *n_properties_p);


pure GType       g_object_get_type                 ();

gpointer    g_object_new                      (GType           object_type,
					       const(gchar)    *first_property_name,
					       ...);

gpointer    g_object_newv		      (GType           object_type,
					       guint	       n_parameters,
					       GParameter     *parameters);

GObject*    g_object_new_valist               (GType           object_type,
					       const(gchar)    *first_property_name,
					       va_list         var_args);

void	    g_object_set                      (gpointer	       object,
					       const(gchar)    *first_property_name,
					       ...);

void        g_object_get                      (gpointer        object,
					       const(gchar)    *first_property_name,
					       ...);

gpointer    g_object_connect                  (gpointer	       object,
					       const(gchar)    *signal_spec,
					       ...);

void	    g_object_disconnect               (gpointer	       object,
					       const(gchar)    *signal_spec,
					       ...);

void        g_object_set_valist               (GObject        *object,
					       const(gchar)    *first_property_name,
					       va_list         var_args);

void        g_object_get_valist               (GObject        *object,
					       const(gchar)    *first_property_name,
					       va_list         var_args);

void        g_object_set_property             (GObject        *object,
					       const(gchar)    *property_name,
					       const(GValue)   *value);

void        g_object_get_property             (GObject        *object,
					       const(gchar)    *property_name,
					       GValue         *value);

void        g_object_freeze_notify            (GObject        *object);

void        g_object_notify                   (GObject        *object,
					       const(gchar)    *property_name);

void        g_object_notify_by_pspec          (GObject        *object,
					       GParamSpec     *pspec);

void        g_object_thaw_notify              (GObject        *object);

gboolean    g_object_is_floating    	      (gpointer        object);

gpointer    g_object_ref_sink       	      (gpointer	       object);

gpointer    g_object_ref                      (gpointer        object);

void        g_object_unref                    (gpointer        object);

void	    g_object_weak_ref		      (GObject	      *object,
					       GWeakNotify     notify,
					       gpointer	       data);

void	    g_object_weak_unref		      (GObject	      *object,
					       GWeakNotify     notify,
					       gpointer	       data);

void        g_object_add_weak_pointer         (GObject        *object,
                                               gpointer       *weak_pointer_location);

void        g_object_remove_weak_pointer      (GObject        *object,
                                               gpointer       *weak_pointer_location);

alias GToggleNotify = void function (gpointer      data,
			       GObject      *object,
			       gboolean      is_last_ref);


void g_object_add_toggle_ref    (GObject       *object,
				 GToggleNotify  notify,
				 gpointer       data);

void g_object_remove_toggle_ref (GObject       *object,
				 GToggleNotify  notify,
				 gpointer       data);


gpointer    g_object_get_qdata                (GObject        *object,
					       GQuark          quark);

void        g_object_set_qdata                (GObject        *object,
					       GQuark          quark,
					       gpointer        data);

void        g_object_set_qdata_full           (GObject        *object,
					       GQuark          quark,
					       gpointer        data,
					       GDestroyNotify  destroy);

gpointer    g_object_steal_qdata              (GObject        *object,
					       GQuark          quark);


gpointer    g_object_dup_qdata                (GObject        *object,
                                               GQuark          quark,
                                               GDuplicateFunc  dup_func,
					       gpointer         user_data);

gboolean    g_object_replace_qdata            (GObject        *object,
                                               GQuark          quark,
                                               gpointer        oldval,
                                               gpointer        newval,
                                               GDestroyNotify  destroy,
					       GDestroyNotify *old_destroy);


gpointer    g_object_get_data                 (GObject        *object,
					       const(gchar)    *key);

void        g_object_set_data                 (GObject        *object,
					       const(gchar)    *key,
					       gpointer        data);

void        g_object_set_data_full            (GObject        *object,
					       const(gchar)    *key,
					       gpointer        data,
					       GDestroyNotify  destroy);

gpointer    g_object_steal_data               (GObject        *object,
					       const(gchar)    *key);


gpointer    g_object_dup_data                 (GObject        *object,
                                               const(gchar)    *key,
                                               GDuplicateFunc  dup_func,
					       gpointer         user_data);

gboolean    g_object_replace_data             (GObject        *object,
                                               const(gchar)    *key,
                                               gpointer        oldval,
                                               gpointer        newval,
                                               GDestroyNotify  destroy,
					       GDestroyNotify *old_destroy);



void        g_object_watch_closure            (GObject        *object,
					       GClosure       *closure);

GClosure*   g_cclosure_new_object             (GCallback       callback_func,
					       GObject	      *object);

GClosure*   g_cclosure_new_object_swap        (GCallback       callback_func,
					       GObject	      *object);

GClosure*   g_closure_new_object              (guint           sizeof_closure,
					       GObject        *object);

void        g_value_set_object                (GValue         *value,
					       gpointer        v_object);

gpointer    g_value_get_object                (const(GValue)   *value);

gpointer    g_value_dup_object                (const(GValue)   *value);

gulong	    g_signal_connect_object           (gpointer	       instance,
					       const(gchar)    *detailed_signal,
					       GCallback       c_handler,
					       gpointer	       gobject,
					       GConnectFlags   connect_flags);

/*< protected >*/

void        g_object_force_floating           (GObject        *object);

void        g_object_run_dispose	      (GObject	      *object);



void        g_value_take_object               (GValue         *value,
					       gpointer        v_object);
deprecated("use g_value_take_object")
void        g_value_set_object_take_ownership (GValue         *value,
                                               gpointer        v_object);

deprecated
gsize	    g_object_compat_control	      (gsize	       what,
					       gpointer	       data);

/* --- implementation macros --- */
// #define G_OBJECT_WARN_INVALID_PSPEC(object, pname, property_id, pspec) \
// G_STMT_START { \
//   GObject *_glib__object = (GObject*) (object); \
//   GParamSpec *_glib__pspec = (GParamSpec*) (pspec); \
//   guint _glib__property_id = (property_id); \
//   g_warning ("%s: invalid %s id %u for \"%s\" of type '%s' in '%s'", \
//              G_STRLOC, \
//              (pname), \
//              _glib__property_id, \
//              _glib__pspec->name, \
//              g_type_name (G_PARAM_SPEC_TYPE (_glib__pspec)), \
//              G_OBJECT_TYPE_NAME (_glib__object)); \
// } G_STMT_END
// /**
//  * G_OBJECT_WARN_INVALID_PROPERTY_ID:
//  * @object: the #GObject on which set_property() or get_property() was called
//  * @property_id: the numeric id of the property
//  * @pspec: the #GParamSpec of the property
//  *
//  * This macro should be used to emit a standard warning about unexpected
//  * properties in set_property() and get_property() implementations.
//  */
// #define G_OBJECT_WARN_INVALID_PROPERTY_ID(object, property_id, pspec) \
//     G_OBJECT_WARN_INVALID_PSPEC ((object), "property", (property_id), (pspec))


void    g_clear_object (GObject **object_ptr);
// #define g_clear_object(object_ptr) g_clear_pointer ((object_ptr), g_object_unref)

struct GWeakRef {
    /*<private>*/
    union priv_t { gpointer p; }
    priv_t priv;
}


void     g_weak_ref_init       (GWeakRef *weak_ref,
                                gpointer  object);

void     g_weak_ref_clear      (GWeakRef *weak_ref);

gpointer g_weak_ref_get        (GWeakRef *weak_ref);

void     g_weak_ref_set        (GWeakRef *weak_ref,
                                gpointer  object);


