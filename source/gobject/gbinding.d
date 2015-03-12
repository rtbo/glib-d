module gobject.gbinding;

import gobject.gobject;
import gobject.gvalue;
import gobject.gtype;
import gobject.gclosure;

import glib;

// #define G_TYPE_BINDING_FLAGS    (g_binding_flags_get_type ())
//
// #define G_TYPE_BINDING          (g_binding_get_type ())
// #define G_BINDING(obj)          (G_TYPE_CHECK_INSTANCE_CAST ((obj), G_TYPE_BINDING, GBinding))
// #define G_IS_BINDING(obj)       (G_TYPE_CHECK_INSTANCE_TYPE ((obj), G_TYPE_BINDING))

extern(C):

struct GBinding;

alias GBindingTransformFunc = gboolean function (GBinding     *binding,
                                            const(GValue) *from_value,
                                            GValue       *to_value,
                                            gpointer      user_data);

enum GBindingFlags { /*< prefix=G_BINDING >*/
  G_BINDING_DEFAULT        = 0,

  G_BINDING_BIDIRECTIONAL  = 1 << 0,
  G_BINDING_SYNC_CREATE    = 1 << 1,
  G_BINDING_INVERT_BOOLEAN = 1 << 2
}


pure GType                 g_binding_flags_get_type      ();

pure GType                 g_binding_get_type            ();


GBindingFlags         g_binding_get_flags           (GBinding *binding);

GObject *             g_binding_get_source          (GBinding *binding);

GObject *             g_binding_get_target          (GBinding *binding);

const(gchar) *         g_binding_get_source_property (GBinding *binding);

const(gchar) *         g_binding_get_target_property (GBinding *binding);

void                  g_binding_unbind              (GBinding *binding);


GBinding *g_object_bind_property               (gpointer               source,
                                                const(gchar)           *source_property,
                                                gpointer               target,
                                                const(gchar)           *target_property,
                                                GBindingFlags          flags);

GBinding *g_object_bind_property_full          (gpointer               source,
                                                const(gchar)           *source_property,
                                                gpointer               target,
                                                const(gchar)           *target_property,
                                                GBindingFlags          flags,
                                                GBindingTransformFunc  transform_to,
                                                GBindingTransformFunc  transform_from,
                                                gpointer               user_data,
                                                GDestroyNotify         notify);

GBinding *g_object_bind_property_with_closures (gpointer               source,
                                                const(gchar)           *source_property,
                                                gpointer               target,
                                                const(gchar)           *target_property,
                                                GBindingFlags          flags,
                                                GClosure              *transform_to,
                                                GClosure              *transform_from);

