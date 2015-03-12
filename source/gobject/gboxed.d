module gobject.gboxed;

import gobject.gtype;
import gobject.gvalue;
import glib.gtypes;


//#ifndef __GI_SCANNER__
//#include        <gobject/glib-types.h>
//#endif

// /* --- type macros --- */
// #define G_TYPE_IS_BOXED(type)      (G_TYPE_FUNDAMENTAL (type) == G_TYPE_BOXED)
// /**
//  * G_VALUE_HOLDS_BOXED:
//  * @value: a valid #GValue structure
//  *
//  * Checks whether the given #GValue can hold values derived
//  * from type %G_TYPE_BOXED.
//  *
//  * Returns: %TRUE on success.
//  */
// #define G_VALUE_HOLDS_BOXED(value) (G_TYPE_CHECK_VALUE_TYPE ((value), G_TYPE_BOXED))

extern(C):

alias GBoxedCopyFunc = gpointer function (gpointer boxed);
alias GBoxedFreeFunc = void function (gpointer boxed);

/* --- prototypes --- */

gpointer g_boxed_copy                     (GType boxed_type,
                                           gconstpointer  src_boxed);

void     g_boxed_free                     (GType          boxed_type,
                                           gpointer       boxed);

void     g_value_set_boxed                (GValue        *value,
                                           gconstpointer  v_boxed);

void     g_value_set_static_boxed         (GValue        *value,
                                           gconstpointer  v_boxed);

void     g_value_take_boxed               (GValue        *value,
                                           gconstpointer  v_boxed);
deprecated("use g_value_take_boxed")
void     g_value_set_boxed_take_ownership (GValue        *value,
                                           gconstpointer  v_boxed);

gpointer g_value_get_boxed                (const(GValue)  *value);

gpointer g_value_dup_boxed                (const(GValue)  *value);


/* --- convenience --- */

GType    g_boxed_type_register_static     (const(gchar)   *name,
                                           GBoxedCopyFunc boxed_copy,
                                           GBoxedFreeFunc boxed_free);

/* --- GObject boxed types --- */
/**
 * G_TYPE_CLOSURE:
 *
 * The #GType for #GClosure.
 */
// #define G_TYPE_CLOSURE (g_closure_get_type ())

/**
 * G_TYPE_VALUE:
 *
 * The type ID of the "GValue" type which is a boxed type,
 * used to pass around pointers to GValues.
 */
// #define G_TYPE_VALUE (g_value_get_type ())


pure GType   g_closure_get_type         ();

pure GType   g_value_get_type           ();

