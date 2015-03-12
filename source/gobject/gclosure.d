module gobject.gclosure;

import gobject.gtype;
import gobject.gvalue;
import glib.gtypes;
import core.stdc.stdarg;

//#define	G_CLOSURE_NEEDS_MARSHAL(closure) (((GClosure*) (closure))->marshal == NULL)
//#define	G_CLOSURE_N_NOTIFIERS(cl)	 (((cl)->n_guards << 1L) + \
//                                          (cl)->n_fnotifiers + (cl)->n_inotifiers)
// #define	G_CCLOSURE_SWAP_DATA(cclosure)	 (((GClosure*) (cclosure))->derivative_flag)
// #define	G_CALLBACK(f)			 ((GCallback) (f))

extern (C) {

    alias GCallback = void function();
    alias GClosureNotify = void function (gpointer	 data,
                         GClosure	*closure);
    alias GClosureMarshal = void function (GClosure	*closure,
                         GValue         *return_value,
                         guint           n_param_values,
                         const GValue   *param_values,
                         gpointer        invocation_hint,
                         gpointer	 marshal_data);
    alias GVaClosureMarshal = void function (GClosure *closure,
                        GValue   *return_value,
                        gpointer  instance,
                        va_list   args,
                        gpointer  marshal_data,
                        int       n_params,
                        GType    *param_types);

    struct GClosureNotifyData
    {
      gpointer       data;
      GClosureNotify notify;
    }

    struct GClosure;
    // struct GClosure
    // {
    //   /*< private >*/
    //   guint	 ref_count : 15;
    //   /* meta_marshal is not used anymore but must be zero for historical reasons
    //      as it was exposed in the G_CLOSURE_N_NOTIFIERS macro */
    //   guint	 meta_marshal_nouse : 1;
    //   guint	 n_guards : 1;
    //   guint	 n_fnotifiers : 2;	/* finalization notifiers */
    //   guint	 n_inotifiers : 8;	/* invalidation notifiers */
    //   guint	 in_inotify : 1;
    //   guint	 floating : 1;
    //   /*< protected >*/
    //   guint	 derivative_flag : 1;
    //   /*< public >*/
    //   guint	 in_marshal : 1;
    //   guint	 is_invalid : 1;

    //   /*< private >*/	void   (*marshal)  (GClosure       *closure,
    //                         GValue /*out*/ *return_value,
    //                         guint           n_param_values,
    //                         const GValue   *param_values,
    //                         gpointer        invocation_hint,
    //                         gpointer	    marshal_data);
    //   /*< protected >*/	gpointer data;

    //   /*< private >*/	GClosureNotifyData *notifiers;

    //   /* invariants/constrains:
    //    * - ->marshal and ->data are _invalid_ as soon as ->is_invalid==TRUE
    //    * - invocation of all inotifiers occours prior to fnotifiers
    //    * - order of inotifiers is random
    //    *   inotifiers may _not_ free/invalidate parameter values (e.g. ->data)
    //    * - order of fnotifiers is random
    //    * - each notifier may only be removed before or during its invocation
    //    * - reference counting may only happen prior to fnotify invocation
    //    *   (in that sense, fnotifiers are really finalization handlers)
    //    */
    // }

    struct GCClosure;
    //struct GCClosure
    //{
    //  GClosure	closure;
    //  gpointer	callback;
    //}


    /* --- prototypes --- */

    GClosure* g_cclosure_new			(GCallback	callback_func,
                             gpointer	user_data,
                             GClosureNotify destroy_data);

    GClosure* g_cclosure_new_swap			(GCallback	callback_func,
                             gpointer	user_data,
                             GClosureNotify destroy_data);

    GClosure* g_signal_type_cclosure_new		(GType          itype,
                             guint          struct_offset);


    /* --- prototypes --- */

    GClosure* g_closure_ref				(GClosure	*closure);

    void	  g_closure_sink			(GClosure	*closure);

    void	  g_closure_unref			(GClosure	*closure);
    /* intimidating */

    GClosure* g_closure_new_simple			(guint		 sizeof_closure,
                             gpointer	 data);

    void	  g_closure_add_finalize_notifier	(GClosure       *closure,
                             gpointer	 notify_data,
                             GClosureNotify	 notify_func);

    void	  g_closure_remove_finalize_notifier	(GClosure       *closure,
                             gpointer	 notify_data,
                             GClosureNotify	 notify_func);

    void	  g_closure_add_invalidate_notifier	(GClosure       *closure,
                             gpointer	 notify_data,
                             GClosureNotify	 notify_func);

    void	  g_closure_remove_invalidate_notifier	(GClosure       *closure,
                             gpointer	 notify_data,
                             GClosureNotify	 notify_func);

    void	  g_closure_add_marshal_guards		(GClosure	*closure,
                             gpointer        pre_marshal_data,
                             GClosureNotify	 pre_marshal_notify,
                             gpointer        post_marshal_data,
                             GClosureNotify	 post_marshal_notify);

    void	  g_closure_set_marshal			(GClosure	*closure,
                             GClosureMarshal marshal);

    void	  g_closure_set_meta_marshal		(GClosure       *closure,
                             gpointer	 marshal_data,
                             GClosureMarshal meta_marshal);

    void	  g_closure_invalidate			(GClosure	*closure);

    void	  g_closure_invoke			(GClosure 	*closure,
                             GValue	/*out*/	*return_value,
                             guint		 n_param_values,
                             const(GValue)	*param_values,
                             gpointer	 invocation_hint);

    /* FIXME:
       OK:  data_object::destroy		-> closure_invalidate();
       MIS:	closure_invalidate()		-> disconnect(closure);
       MIS:	disconnect(closure)		-> (unlink) closure_unref();
       OK:	closure_finalize()		-> g_free (data_string);

       random remarks:
       - need marshaller repo with decent aliasing to base types
       - provide marshaller collection, virtually covering anything out there
    */


    void g_cclosure_marshal_generic (GClosure     *closure,
                                     GValue       *return_gvalue,
                                     guint         n_param_values,
                                     const(GValue) *param_values,
                                     gpointer      invocation_hint,
                                     gpointer      marshal_data);


    void g_cclosure_marshal_generic_va (GClosure *closure,
                        GValue   *return_value,
                        gpointer  instance,
                        va_list   args_list,
                        gpointer  marshal_data,
                        int       n_params,
                        GType    *param_types);

}

