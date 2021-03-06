/*
 * Distributed under the Boost Software License, Version 1.0.
 *    (See accompanying file LICENSE_1_0.txt or copy at
 *          http://www.boost.org/LICENSE_1_0.txt)
 */
module gobject.gmarshal;

import gobject.gclosure;
import gobject.gvalue;
import gobject.gtype;
import glib.gtypes;

import core.stdc.stdarg;

extern (C):


/* VOID:VOID (./gmarshal.list:6) */

void g_cclosure_marshal_VOID__VOID (GClosure     *closure,
                                    GValue       *return_value,
                                    guint         n_param_values,
                                    const(GValue) *param_values,
                                    gpointer      invocation_hint,
                                    gpointer      marshal_data);

void g_cclosure_marshal_VOID__VOIDv (GClosure *closure,
                                     GValue   *return_value,
                                     gpointer  instance,
                                     va_list   args,
                                     gpointer  marshal_data,
                                     int       n_params,
                                     GType    *param_types);

/* VOID:BOOLEAN (./gmarshal.list:7) */

void g_cclosure_marshal_VOID__BOOLEAN (GClosure     *closure,
                                       GValue       *return_value,
                                       guint         n_param_values,
                                       const(GValue) *param_values,
                                       gpointer      invocation_hint,
                                       gpointer      marshal_data);

void g_cclosure_marshal_VOID__BOOLEANv (GClosure *closure,
                                        GValue   *return_value,
                                        gpointer  instance,
                                        va_list   args,
                                        gpointer  marshal_data,
                                        int       n_params,
                                        GType    *param_types);

/* VOID:CHAR (./gmarshal.list:8) */

void g_cclosure_marshal_VOID__CHAR (GClosure     *closure,
                                    GValue       *return_value,
                                    guint         n_param_values,
                                    const(GValue) *param_values,
                                    gpointer      invocation_hint,
                                    gpointer      marshal_data);

void g_cclosure_marshal_VOID__CHARv (GClosure *closure,
                                     GValue   *return_value,
                                     gpointer  instance,
                                     va_list   args,
                                     gpointer  marshal_data,
                                     int       n_params,
                                     GType    *param_types);

/* VOID:UCHAR (./gmarshal.list:9) */

void g_cclosure_marshal_VOID__UCHAR (GClosure     *closure,
                                     GValue       *return_value,
                                     guint         n_param_values,
                                     const(GValue) *param_values,
                                     gpointer      invocation_hint,
                                     gpointer      marshal_data);

void g_cclosure_marshal_VOID__UCHARv (GClosure *closure,
                                      GValue   *return_value,
                                      gpointer  instance,
                                      va_list   args,
                                      gpointer  marshal_data,
                                      int       n_params,
                                      GType    *param_types);

/* VOID:INT (./gmarshal.list:10) */

void g_cclosure_marshal_VOID__INT (GClosure     *closure,
                                   GValue       *return_value,
                                   guint         n_param_values,
                                   const(GValue) *param_values,
                                   gpointer      invocation_hint,
                                   gpointer      marshal_data);

void g_cclosure_marshal_VOID__INTv (GClosure *closure,
                                    GValue   *return_value,
                                    gpointer  instance,
                                    va_list   args,
                                    gpointer  marshal_data,
                                    int       n_params,
                                    GType    *param_types);

/* VOID:UINT (./gmarshal.list:11) */

void g_cclosure_marshal_VOID__UINT (GClosure     *closure,
                                    GValue       *return_value,
                                    guint         n_param_values,
                                    const(GValue) *param_values,
                                    gpointer      invocation_hint,
                                    gpointer      marshal_data);

void g_cclosure_marshal_VOID__UINTv (GClosure *closure,
                                     GValue   *return_value,
                                     gpointer  instance,
                                     va_list   args,
                                     gpointer  marshal_data,
                                     int       n_params,
                                     GType    *param_types);

/* VOID:LONG (./gmarshal.list:12) */

void g_cclosure_marshal_VOID__LONG (GClosure     *closure,
                                    GValue       *return_value,
                                    guint         n_param_values,
                                    const(GValue) *param_values,
                                    gpointer      invocation_hint,
                                    gpointer      marshal_data);

void g_cclosure_marshal_VOID__LONGv (GClosure *closure,
                                     GValue   *return_value,
                                     gpointer  instance,
                                     va_list   args,
                                     gpointer  marshal_data,
                                     int       n_params,
                                     GType    *param_types);

/* VOID:ULONG (./gmarshal.list:13) */

void g_cclosure_marshal_VOID__ULONG (GClosure     *closure,
                                     GValue       *return_value,
                                     guint         n_param_values,
                                     const(GValue) *param_values,
                                     gpointer      invocation_hint,
                                     gpointer      marshal_data);

void g_cclosure_marshal_VOID__ULONGv (GClosure *closure,
                                      GValue   *return_value,
                                      gpointer  instance,
                                      va_list   args,
                                      gpointer  marshal_data,
                                      int       n_params,
                                      GType    *param_types);

/* VOID:ENUM (./gmarshal.list:14) */

void g_cclosure_marshal_VOID__ENUM (GClosure     *closure,
                                    GValue       *return_value,
                                    guint         n_param_values,
                                    const(GValue) *param_values,
                                    gpointer      invocation_hint,
                                    gpointer      marshal_data);

void g_cclosure_marshal_VOID__ENUMv (GClosure *closure,
                                     GValue   *return_value,
                                     gpointer  instance,
                                     va_list   args,
                                     gpointer  marshal_data,
                                     int       n_params,
                                     GType    *param_types);

/* VOID:FLAGS (./gmarshal.list:15) */

void g_cclosure_marshal_VOID__FLAGS (GClosure     *closure,
                                     GValue       *return_value,
                                     guint         n_param_values,
                                     const(GValue) *param_values,
                                     gpointer      invocation_hint,
                                     gpointer      marshal_data);

void g_cclosure_marshal_VOID__FLAGSv (GClosure *closure,
                                      GValue   *return_value,
                                      gpointer  instance,
                                      va_list   args,
                                      gpointer  marshal_data,
                                      int       n_params,
                                      GType    *param_types);

/* VOID:FLOAT (./gmarshal.list:16) */

void g_cclosure_marshal_VOID__FLOAT (GClosure     *closure,
                                     GValue       *return_value,
                                     guint         n_param_values,
                                     const(GValue) *param_values,
                                     gpointer      invocation_hint,
                                     gpointer      marshal_data);

void g_cclosure_marshal_VOID__FLOATv (GClosure *closure,
                                      GValue   *return_value,
                                      gpointer  instance,
                                      va_list   args,
                                      gpointer  marshal_data,
                                      int       n_params,
                                      GType    *param_types);

/* VOID:DOUBLE (./gmarshal.list:17) */

void g_cclosure_marshal_VOID__DOUBLE (GClosure     *closure,
                                      GValue       *return_value,
                                      guint         n_param_values,
                                      const(GValue) *param_values,
                                      gpointer      invocation_hint,
                                      gpointer      marshal_data);

void g_cclosure_marshal_VOID__DOUBLEv (GClosure *closure,
                                       GValue   *return_value,
                                       gpointer  instance,
                                       va_list   args,
                                       gpointer  marshal_data,
                                       int       n_params,
                                       GType    *param_types);

/* VOID:STRING (./gmarshal.list:18) */

void g_cclosure_marshal_VOID__STRING (GClosure     *closure,
                                      GValue       *return_value,
                                      guint         n_param_values,
                                      const(GValue) *param_values,
                                      gpointer      invocation_hint,
                                      gpointer      marshal_data);

void g_cclosure_marshal_VOID__STRINGv (GClosure *closure,
                                       GValue   *return_value,
                                       gpointer  instance,
                                       va_list   args,
                                       gpointer  marshal_data,
                                       int       n_params,
                                       GType    *param_types);

/* VOID:PARAM (./gmarshal.list:19) */

void g_cclosure_marshal_VOID__PARAM (GClosure     *closure,
                                     GValue       *return_value,
                                     guint         n_param_values,
                                     const(GValue) *param_values,
                                     gpointer      invocation_hint,
                                     gpointer      marshal_data);

void g_cclosure_marshal_VOID__PARAMv (GClosure *closure,
                                      GValue   *return_value,
                                      gpointer  instance,
                                      va_list   args,
                                      gpointer  marshal_data,
                                      int       n_params,
                                      GType    *param_types);

/* VOID:BOXED (./gmarshal.list:20) */

void g_cclosure_marshal_VOID__BOXED (GClosure     *closure,
                                     GValue       *return_value,
                                     guint         n_param_values,
                                     const(GValue) *param_values,
                                     gpointer      invocation_hint,
                                     gpointer      marshal_data);

void g_cclosure_marshal_VOID__BOXEDv (GClosure *closure,
                                      GValue   *return_value,
                                      gpointer  instance,
                                      va_list   args,
                                      gpointer  marshal_data,
                                      int       n_params,
                                      GType    *param_types);

/* VOID:POINTER (./gmarshal.list:21) */

void g_cclosure_marshal_VOID__POINTER (GClosure     *closure,
                                       GValue       *return_value,
                                       guint         n_param_values,
                                       const(GValue) *param_values,
                                       gpointer      invocation_hint,
                                       gpointer      marshal_data);

void g_cclosure_marshal_VOID__POINTERv (GClosure *closure,
                                        GValue   *return_value,
                                        gpointer  instance,
                                        va_list   args,
                                        gpointer  marshal_data,
                                        int       n_params,
                                        GType    *param_types);

/* VOID:OBJECT (./gmarshal.list:22) */

void g_cclosure_marshal_VOID__OBJECT (GClosure     *closure,
                                      GValue       *return_value,
                                      guint         n_param_values,
                                      const(GValue) *param_values,
                                      gpointer      invocation_hint,
                                      gpointer      marshal_data);

void g_cclosure_marshal_VOID__OBJECTv (GClosure *closure,
                                       GValue   *return_value,
                                       gpointer  instance,
                                       va_list   args,
                                       gpointer  marshal_data,
                                       int       n_params,
                                       GType    *param_types);

/* VOID:VARIANT (./gmarshal.list:23) */

void g_cclosure_marshal_VOID__VARIANT (GClosure     *closure,
                                       GValue       *return_value,
                                       guint         n_param_values,
                                       const(GValue) *param_values,
                                       gpointer      invocation_hint,
                                       gpointer      marshal_data);

void g_cclosure_marshal_VOID__VARIANTv (GClosure *closure,
                                        GValue   *return_value,
                                        gpointer  instance,
                                        va_list   args,
                                        gpointer  marshal_data,
                                        int       n_params,
                                        GType    *param_types);

/* VOID:UINT,POINTER (./gmarshal.list:26) */

void g_cclosure_marshal_VOID__UINT_POINTER (GClosure     *closure,
                                            GValue       *return_value,
                                            guint         n_param_values,
                                            const(GValue) *param_values,
                                            gpointer      invocation_hint,
                                            gpointer      marshal_data);

void g_cclosure_marshal_VOID__UINT_POINTERv (GClosure *closure,
                                             GValue   *return_value,
                                             gpointer  instance,
                                             va_list   args,
                                             gpointer  marshal_data,
                                             int       n_params,
                                             GType    *param_types);

/* BOOL:FLAGS (./gmarshal.list:27) */

void g_cclosure_marshal_BOOLEAN__FLAGS (GClosure     *closure,
                                        GValue       *return_value,
                                        guint         n_param_values,
                                        const(GValue) *param_values,
                                        gpointer      invocation_hint,
                                        gpointer      marshal_data);

void g_cclosure_marshal_BOOLEAN__FLAGSv (GClosure *closure,
                                         GValue   *return_value,
                                         gpointer  instance,
                                         va_list   args,
                                         gpointer  marshal_data,
                                         int       n_params,
                                         GType    *param_types);

//#define g_cclosure_marshal_BOOL__FLAGS	g_cclosure_marshal_BOOLEAN__FLAGS

/* STRING:OBJECT,POINTER (./gmarshal.list:28) */

void g_cclosure_marshal_STRING__OBJECT_POINTER (GClosure     *closure,
                                                GValue       *return_value,
                                                guint         n_param_values,
                                                const(GValue) *param_values,
                                                gpointer      invocation_hint,
                                                gpointer      marshal_data);

void g_cclosure_marshal_STRING__OBJECT_POINTERv (GClosure *closure,
                                                 GValue   *return_value,
                                                 gpointer  instance,
                                                 va_list   args,
                                                 gpointer  marshal_data,
                                                 int       n_params,
                                                 GType    *param_types);

/* BOOL:BOXED,BOXED (./gmarshal.list:29) */

void g_cclosure_marshal_BOOLEAN__BOXED_BOXED (GClosure     *closure,
                                              GValue       *return_value,
                                              guint         n_param_values,
                                              const(GValue) *param_values,
                                              gpointer      invocation_hint,
                                              gpointer      marshal_data);

void g_cclosure_marshal_BOOLEAN__BOXED_BOXEDv (GClosure *closure,
                                               GValue   *return_value,
                                               gpointer  instance,
                                               va_list   args,
                                               gpointer  marshal_data,
                                               int       n_params,
                                               GType    *param_types);

alias g_cclosure_marshal_BOOL__BOXED_BOXED = g_cclosure_marshal_BOOLEAN__BOXED_BOXED;

