module gobject.gsignal;

import gobject.gclosure;
import gobject.gvalue;
import gobject.gparam;
import gobject.gmarshal;
import gobject.gtype;

import glib;

import core.stdc.stdarg;


extern (C):

alias GSignalCMarshaller = GClosureMarshal;
alias GSignalCVaMarshaller = GVaClosureMarshal;


alias GSignalEmissionHook = gboolean function (GSignalInvocationHint *ihint,
					 guint			n_param_values,
					 const(GValue)	       *param_values,
					 gpointer		data);
alias GSignalAccumulator = gboolean function (GSignalInvocationHint *ihint,
					 GValue		       *return_accu,
					 const(GValue)	       *handler_return,
					 gpointer               data);


enum GSignalFlags
{
  G_SIGNAL_RUN_FIRST	= 1 << 0,
  G_SIGNAL_RUN_LAST	= 1 << 1,
  G_SIGNAL_RUN_CLEANUP	= 1 << 2,
  G_SIGNAL_NO_RECURSE	= 1 << 3,
  G_SIGNAL_DETAILED	= 1 << 4,
  G_SIGNAL_ACTION	= 1 << 5,
  G_SIGNAL_NO_HOOKS	= 1 << 6,
  G_SIGNAL_MUST_COLLECT = 1 << 7,
  G_SIGNAL_DEPRECATED   = 1 << 8
}
enum G_SIGNAL_FLAGS_MASK = 0x1ff;

enum GConnectFlags
{
  G_CONNECT_AFTER	= 1 << 0,
  G_CONNECT_SWAPPED	= 1 << 1
}

enum GSignalMatchType
{
  G_SIGNAL_MATCH_ID	   = 1 << 0,
  G_SIGNAL_MATCH_DETAIL	   = 1 << 1,
  G_SIGNAL_MATCH_CLOSURE   = 1 << 2,
  G_SIGNAL_MATCH_FUNC	   = 1 << 3,
  G_SIGNAL_MATCH_DATA	   = 1 << 4,
  G_SIGNAL_MATCH_UNBLOCKED = 1 << 5
}
enum G_SIGNAL_MATCH_MASK = 0x3f;


//#define	G_SIGNAL_TYPE_STATIC_SCOPE (G_TYPE_FLAG_RESERVED_ID_BIT)

struct GSignalInvocationHint
{
  guint		signal_id;
  GQuark	detail;
  GSignalFlags	run_type;
}

struct GSignalQuery
{
  guint		signal_id;
  const(gchar)  *signal_name;
  GType		itype;
  GSignalFlags	signal_flags;
  GType		return_type; /* mangled with G_SIGNAL_TYPE_STATIC_SCOPE flag */
  guint		n_params;
  const(GType)  *param_types; /* mangled with G_SIGNAL_TYPE_STATIC_SCOPE flag */
}


/* --- signals --- */

guint                 g_signal_newv         (const(gchar)        *signal_name,
					     GType               itype,
					     GSignalFlags        signal_flags,
					     GClosure           *class_closure,
					     GSignalAccumulator	 accumulator,
					     gpointer		 accu_data,
					     GSignalCMarshaller  c_marshaller,
					     GType               return_type,
					     guint               n_params,
					     GType              *param_types);

guint                 g_signal_new_valist   (const(gchar)        *signal_name,
					     GType               itype,
					     GSignalFlags        signal_flags,
					     GClosure           *class_closure,
					     GSignalAccumulator	 accumulator,
					     gpointer		 accu_data,
					     GSignalCMarshaller  c_marshaller,
					     GType               return_type,
					     guint               n_params,
					     va_list             args);

guint                 g_signal_new          (const(gchar)        *signal_name,
					     GType               itype,
					     GSignalFlags        signal_flags,
					     guint               class_offset,
					     GSignalAccumulator	 accumulator,
					     gpointer		 accu_data,
					     GSignalCMarshaller  c_marshaller,
					     GType               return_type,
					     guint               n_params,
					     ...);

guint            g_signal_new_class_handler (const(gchar)        *signal_name,
                                             GType               itype,
                                             GSignalFlags        signal_flags,
                                             GCallback           class_handler,
                                             GSignalAccumulator  accumulator,
                                             gpointer            accu_data,
                                             GSignalCMarshaller  c_marshaller,
                                             GType               return_type,
                                             guint               n_params,
                                             ...);

void             g_signal_set_va_marshaller (guint              signal_id,
					     GType              instance_type,
					     GSignalCVaMarshaller va_marshaller);


void                  g_signal_emitv        (const(GValue)       *instance_and_params,
					     guint               signal_id,
					     GQuark              detail,
					     GValue             *return_value);

void                  g_signal_emit_valist  (gpointer            instance,
					     guint               signal_id,
					     GQuark              detail,
					     va_list             var_args);

void                  g_signal_emit         (gpointer            instance,
					     guint               signal_id,
					     GQuark              detail,
					     ...);

void                  g_signal_emit_by_name (gpointer            instance,
					     const(gchar)        *detailed_signal,
					     ...);

guint                 g_signal_lookup       (const(gchar)        *name,
					     GType               itype);

const(gchar) *         g_signal_name         (guint               signal_id);

void                  g_signal_query        (guint               signal_id,
					     GSignalQuery       *query);

guint*                g_signal_list_ids     (GType               itype,
					     guint              *n_ids);

gboolean	      g_signal_parse_name   (const(gchar)	*detailed_signal,
					     GType		 itype,
					     guint		*signal_id_p,
					     GQuark		*detail_p,
					     gboolean		 force_detail_quark);

GSignalInvocationHint* g_signal_get_invocation_hint (gpointer    instance);


/* --- signal emissions --- */

void	g_signal_stop_emission		    (gpointer		  instance,
					     guint		  signal_id,
					     GQuark		  detail);

void	g_signal_stop_emission_by_name	    (gpointer		  instance,
					     const(gchar)	 *detailed_signal);

gulong	g_signal_add_emission_hook	    (guint		  signal_id,
					     GQuark		  detail,
					     GSignalEmissionHook  hook_func,
					     gpointer	       	  hook_data,
					     GDestroyNotify	  data_destroy);

void	g_signal_remove_emission_hook	    (guint		  signal_id,
					     gulong		  hook_id);


/* --- signal handlers --- */

gboolean g_signal_has_handler_pending	      (gpointer		  instance,
					       guint		  signal_id,
					       GQuark		  detail,
					       gboolean		  may_be_blocked);

gulong	 g_signal_connect_closure_by_id	      (gpointer		  instance,
					       guint		  signal_id,
					       GQuark		  detail,
					       GClosure		 *closure,
					       gboolean		  after);

gulong	 g_signal_connect_closure	      (gpointer		  instance,
					       const(gchar)       *detailed_signal,
					       GClosure		 *closure,
					       gboolean		  after);

gulong	 g_signal_connect_data		      (gpointer		  instance,
					       const(gchar)	 *detailed_signal,
					       GCallback	  c_handler,
					       gpointer		  data,
					       GClosureNotify	  destroy_data,
					       GConnectFlags	  connect_flags);

void	 g_signal_handler_block		      (gpointer		  instance,
					       gulong		  handler_id);

void	 g_signal_handler_unblock	      (gpointer		  instance,
					       gulong		  handler_id);

void	 g_signal_handler_disconnect	      (gpointer		  instance,
					       gulong		  handler_id);

gboolean g_signal_handler_is_connected	      (gpointer		  instance,
					       gulong		  handler_id);

gulong	 g_signal_handler_find		      (gpointer		  instance,
					       GSignalMatchType	  mask,
					       guint		  signal_id,
					       GQuark		  detail,
					       GClosure		 *closure,
					       gpointer		  func,
					       gpointer		  data);

guint	 g_signal_handlers_block_matched      (gpointer		  instance,
					       GSignalMatchType	  mask,
					       guint		  signal_id,
					       GQuark		  detail,
					       GClosure		 *closure,
					       gpointer		  func,
					       gpointer		  data);

guint	 g_signal_handlers_unblock_matched    (gpointer		  instance,
					       GSignalMatchType	  mask,
					       guint		  signal_id,
					       GQuark		  detail,
					       GClosure		 *closure,
					       gpointer		  func,
					       gpointer		  data);

guint	 g_signal_handlers_disconnect_matched (gpointer		  instance,
					       GSignalMatchType	  mask,
					       guint		  signal_id,
					       GQuark		  detail,
					       GClosure		 *closure,
					       gpointer		  func,
					       gpointer		  data);


/* --- overriding and chaining --- */

void    g_signal_override_class_closure       (guint              signal_id,
                                               GType              instance_type,
                                               GClosure          *class_closure);

void    g_signal_override_class_handler       (const(gchar)       *signal_name,
                                               GType              instance_type,
                                               GCallback          class_handler);

void    g_signal_chain_from_overridden        (const(GValue)      *instance_and_params,
                                               GValue            *return_value);

void   g_signal_chain_from_overridden_handler (gpointer           instance,
                                               ...);


// /* --- convenience --- */
// /**
//  * g_signal_connect:
//  * @instance: the instance to connect to.
//  * @detailed_signal: a string of the form "signal-name::detail".
//  * @c_handler: the #GCallback to connect.
//  * @data: data to pass to @c_handler calls.
//  *
//  * Connects a #GCallback function to a signal for a particular object.
//  *
//  * The handler will be called before the default handler of the signal.
//  *
//  * Returns: the handler id (always greater than 0 for successful connections)
//  */
// #define g_signal_connect(instance, detailed_signal, c_handler, data) \
//     g_signal_connect_data ((instance), (detailed_signal), (c_handler), (data), NULL, (GConnectFlags) 0)
// /**
//  * g_signal_connect_after:
//  * @instance: the instance to connect to.
//  * @detailed_signal: a string of the form "signal-name::detail".
//  * @c_handler: the #GCallback to connect.
//  * @data: data to pass to @c_handler calls.
//  *
//  * Connects a #GCallback function to a signal for a particular object.
//  *
//  * The handler will be called after the default handler of the signal.
//  *
//  * Returns: the handler id (always greater than 0 for successful connections)
//  */
// #define g_signal_connect_after(instance, detailed_signal, c_handler, data) \
//     g_signal_connect_data ((instance), (detailed_signal), (c_handler), (data), NULL, G_CONNECT_AFTER)
// /**
//  * g_signal_connect_swapped:
//  * @instance: the instance to connect to.
//  * @detailed_signal: a string of the form "signal-name::detail".
//  * @c_handler: the #GCallback to connect.
//  * @data: data to pass to @c_handler calls.
//  *
//  * Connects a #GCallback function to a signal for a particular object.
//  *
//  * The instance on which the signal is emitted and @data will be swapped when
//  * calling the handler. This is useful when calling pre-existing functions to
//  * operate purely on the @data, rather than the @instance: swapping the
//  * parameters avoids the need to write a wrapper function.
//  *
//  * For example, this allows the shorter code:
//  * |[<!-- language="C" -->
//  * g_signal_connect_swapped (button, "clicked",
//  *                           (GCallback) gtk_widget_hide, other_widget);
//  * ]|
//  *
//  * Rather than the cumbersome:
//  * |[<!-- language="C" -->
//  * static void
//  * button_clicked_cb (GtkButton *button, GtkWidget *other_widget)
//  * {
//  *     gtk_widget_hide (other_widget);
//  * }
//  *
//  * …
//  *
//  * g_signal_connect (button, "clicked",
//  *                   (GCallback) button_clicked_cb, other_widget);
//  * ]|
//  *
//  * Returns: the handler ID (always greater than 0 for successful connections)
//  */
// #define g_signal_connect_swapped(instance, detailed_signal, c_handler, data) \
//     g_signal_connect_data ((instance), (detailed_signal), (c_handler), (data), NULL, G_CONNECT_SWAPPED)
// /**
//  * g_signal_handlers_disconnect_by_func:
//  * @instance: The instance to remove handlers from.
//  * @func: The C closure callback of the handlers (useless for non-C closures).
//  * @data: The closure data of the handlers' closures.
//  *
//  * Disconnects all handlers on an instance that match @func and @data.
//  *
//  * Returns: The number of handlers that matched.
//  */
// #define	g_signal_handlers_disconnect_by_func(instance, func, data)						\
//     g_signal_handlers_disconnect_matched ((instance),								\
// 					  (GSignalMatchType) (G_SIGNAL_MATCH_FUNC | G_SIGNAL_MATCH_DATA),	\
// 					  0, 0, NULL, (func), (data))
//
// /**
//  * g_signal_handlers_disconnect_by_data:
//  * @instance: The instance to remove handlers from
//  * @data: the closure data of the handlers' closures
//  *
//  * Disconnects all handlers on an instance that match @data.
//  *
//  * Returns: The number of handlers that matched.
//  *
//  * Since: 2.32
//  */
// #define g_signal_handlers_disconnect_by_data(instance, data) \
//   g_signal_handlers_disconnect_matched ((instance), G_SIGNAL_MATCH_DATA, 0, 0, NULL, NULL, (data))
//
// /**
//  * g_signal_handlers_block_by_func:
//  * @instance: The instance to block handlers from.
//  * @func: The C closure callback of the handlers (useless for non-C closures).
//  * @data: The closure data of the handlers' closures.
//  *
//  * Blocks all handlers on an instance that match @func and @data.
//  *
//  * Returns: The number of handlers that matched.
//  */
// #define	g_signal_handlers_block_by_func(instance, func, data)							\
//     g_signal_handlers_block_matched      ((instance),								\
// 				          (GSignalMatchType) (G_SIGNAL_MATCH_FUNC | G_SIGNAL_MATCH_DATA),	\
// 				          0, 0, NULL, (func), (data))
// /**
//  * g_signal_handlers_unblock_by_func:
//  * @instance: The instance to unblock handlers from.
//  * @func: The C closure callback of the handlers (useless for non-C closures).
//  * @data: The closure data of the handlers' closures.
//  *
//  * Unblocks all handlers on an instance that match @func and @data.
//  *
//  * Returns: The number of handlers that matched.
//  */
// #define	g_signal_handlers_unblock_by_func(instance, func, data)							\
//     g_signal_handlers_unblock_matched    ((instance),								\
// 				          (GSignalMatchType) (G_SIGNAL_MATCH_FUNC | G_SIGNAL_MATCH_DATA),	\
// 				          0, 0, NULL, (func), (data))



gboolean g_signal_accumulator_true_handled (GSignalInvocationHint *ihint,
					    GValue                *return_accu,
					    const(GValue)          *handler_return,
					    gpointer               dummy);


gboolean g_signal_accumulator_first_wins   (GSignalInvocationHint *ihint,
                                            GValue                *return_accu,
                                            const(GValue)          *handler_return,
                                            gpointer               dummy);

/*< private >*/

void	 g_signal_handlers_destroy	      (gpointer		  instance);
void	 _g_signals_destroy		      (GType		  itype);

