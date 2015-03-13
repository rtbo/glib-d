/*
 * Distributed under the Boost Software License, Version 1.0.
 *    (See accompanying file LICENSE_1_0.txt or copy at
 *          http://www.boost.org/LICENSE_1_0.txt)
 */
module gobject.gparam;

import gobject.gvalue;
import gobject.gtype;
import glib;

// /* --- standard type macros --- */
// /**
//  * G_TYPE_IS_PARAM:
//  * @type: a #GType ID
//  *
//  * Checks whether @type "is a" %G_TYPE_PARAM.
//  */
// #define G_TYPE_IS_PARAM(type)		(G_TYPE_FUNDAMENTAL (type) == G_TYPE_PARAM)
// /**
//  * G_PARAM_SPEC:
//  * @pspec: a valid #GParamSpec
//  *
//  * Casts a derived #GParamSpec object (e.g. of type #GParamSpecInt) into
//  * a #GParamSpec object.
//  */
// #define G_PARAM_SPEC(pspec)		(G_TYPE_CHECK_INSTANCE_CAST ((pspec), G_TYPE_PARAM, GParamSpec))
// /**
//  * G_IS_PARAM_SPEC:
//  * @pspec: a #GParamSpec
//  *
//  * Checks whether @pspec "is a" valid #GParamSpec structure of type %G_TYPE_PARAM
//  * or derived.
//  */
// #if GLIB_VERSION_MAX_ALLOWED >= GLIB_VERSION_2_42
// #define G_IS_PARAM_SPEC(pspec)		(G_TYPE_CHECK_INSTANCE_FUNDAMENTAL_TYPE ((pspec), G_TYPE_PARAM))
// #else
// #define G_IS_PARAM_SPEC(pspec)		(G_TYPE_CHECK_INSTANCE_TYPE ((pspec), G_TYPE_PARAM))
// #endif
// /**
//  * G_PARAM_SPEC_CLASS:
//  * @pclass: a valid #GParamSpecClass
//  *
//  * Casts a derived #GParamSpecClass structure into a #GParamSpecClass structure.
//  */
// #define G_PARAM_SPEC_CLASS(pclass)      (G_TYPE_CHECK_CLASS_CAST ((pclass), G_TYPE_PARAM, GParamSpecClass))
// /**
//  * G_IS_PARAM_SPEC_CLASS:
//  * @pclass: a #GParamSpecClass
//  *
//  * Checks whether @pclass "is a" valid #GParamSpecClass structure of type
//  * %G_TYPE_PARAM or derived.
//  */
// #define G_IS_PARAM_SPEC_CLASS(pclass)   (G_TYPE_CHECK_CLASS_TYPE ((pclass), G_TYPE_PARAM))
// /**
//  * G_PARAM_SPEC_GET_CLASS:
//  * @pspec: a valid #GParamSpec
//  *
//  * Retrieves the #GParamSpecClass of a #GParamSpec.
//  */
// #define G_PARAM_SPEC_GET_CLASS(pspec)	(G_TYPE_INSTANCE_GET_CLASS ((pspec), G_TYPE_PARAM, GParamSpecClass))
//
//
// /* --- convenience macros --- */
// /**
//  * G_PARAM_SPEC_TYPE:
//  * @pspec: a valid #GParamSpec
//  *
//  * Retrieves the #GType of this @pspec.
//  */
// #define G_PARAM_SPEC_TYPE(pspec)	(G_TYPE_FROM_INSTANCE (pspec))
// /**
//  * G_PARAM_SPEC_TYPE_NAME:
//  * @pspec: a valid #GParamSpec
//  *
//  * Retrieves the #GType name of this @pspec.
//  */
// #define G_PARAM_SPEC_TYPE_NAME(pspec)	(g_type_name (G_PARAM_SPEC_TYPE (pspec)))
// /**
//  * G_PARAM_SPEC_VALUE_TYPE:
//  * @pspec: a valid #GParamSpec
//  *
//  * Retrieves the #GType to initialize a #GValue for this parameter.
//  */
// #define	G_PARAM_SPEC_VALUE_TYPE(pspec)	(G_PARAM_SPEC (pspec)->value_type)
// /**
//  * G_VALUE_HOLDS_PARAM:
//  * @value: a valid #GValue structure
//  *
//  * Checks whether the given #GValue can hold values derived from type %G_TYPE_PARAM.
//  *
//  * Returns: %TRUE on success.
//  */
// #define G_VALUE_HOLDS_PARAM(value)	(G_TYPE_CHECK_VALUE_TYPE ((value), G_TYPE_PARAM))
//

enum GParamFlags
{
  G_PARAM_READABLE            = 1 << 0,
  G_PARAM_WRITABLE            = 1 << 1,
  G_PARAM_READWRITE           = (G_PARAM_READABLE | G_PARAM_WRITABLE),
  G_PARAM_CONSTRUCT	      = 1 << 2,
  G_PARAM_CONSTRUCT_ONLY      = 1 << 3,
  G_PARAM_LAX_VALIDATION      = 1 << 4,
  G_PARAM_STATIC_NAME	      = 1 << 5,
  G_PARAM_STATIC_NICK	      = 1 << 6,
  G_PARAM_STATIC_BLURB	      = 1 << 7,
  /* User defined flags go here */
  G_PARAM_EXPLICIT_NOTIFY     = 1 << 30,
  G_PARAM_DEPRECATED          = 1 << 31
}


enum G_PARAM_STATIC_STRINGS = GParamFlags.G_PARAM_STATIC_NAME |
        GParamFlags.G_PARAM_STATIC_NICK |
        GParamFlags.G_PARAM_STATIC_BLURB;


enum G_PARAM_MASK = 0x000000ff;
/**
 * G_PARAM_USER_SHIFT:
 *
 * Minimum shift count to be used for user defined flags, to be stored in
 * #GParamSpec.flags. The maximum allowed is 10.
 */
enum G_PARAM_USER_SHIFT = 8;

struct GParamSpecPool;

extern (C) {

    struct GParamSpec
    {
      GTypeInstance  g_type_instance;

      const(gchar)   *name;          /* interned string */
      GParamFlags    flags;
      GType		 value_type;
      GType		 owner_type;	/* class or interface using this property */

      /*< private >*/
      gchar         *_nick;
      gchar         *_blurb;
      GData		*qdata;
      guint          ref_count;
      guint		 param_id;	/* sort-criteria */
    }



    struct GParamSpecClass
    {
      GTypeClass      g_type_class;

      GType		  value_type;

      void function (GParamSpec   *pspec) finalize;

      /* GParam methods */
      void function (GParamSpec   *pspec,
                         GValue       *value) value_set_default;
      gboolean function (GParamSpec   *pspec,
                         GValue       *value) value_validate;
      gint function (GParamSpec   *pspec,
                         const(GValue) *value1,
                         const(GValue) *value2) values_cmp;
      /*< private >*/
      gpointer	  dummy[4];
    }


    struct GParameter
    {
      const(gchar) *name;
      GValue       value;
    }


    /* --- prototypes --- */

    GParamSpec*	g_param_spec_ref		(GParamSpec    *pspec);

    void		g_param_spec_unref		(GParamSpec    *pspec);

    void		g_param_spec_sink		(GParamSpec    *pspec);

    GParamSpec*	g_param_spec_ref_sink   	(GParamSpec    *pspec);

    gpointer        g_param_spec_get_qdata		(GParamSpec    *pspec,
                             GQuark         quark);

    void            g_param_spec_set_qdata		(GParamSpec    *pspec,
                             GQuark         quark,
                             gpointer       data);

    void            g_param_spec_set_qdata_full	(GParamSpec    *pspec,
                             GQuark         quark,
                             gpointer       data,
                             GDestroyNotify destroy);

    gpointer        g_param_spec_steal_qdata	(GParamSpec    *pspec,
                             GQuark         quark);

    GParamSpec*     g_param_spec_get_redirect_target (GParamSpec   *pspec);


    void		g_param_value_set_default	(GParamSpec    *pspec,
                             GValue	       *value);

    gboolean	g_param_value_defaults		(GParamSpec    *pspec,
                             GValue	       *value);

    gboolean	g_param_value_validate		(GParamSpec    *pspec,
                             GValue	       *value);

    gboolean	g_param_value_convert		(GParamSpec    *pspec,
                             const(GValue)  *src_value,
                             GValue	       *dest_value,
                             gboolean	strict_validation);

    gint		g_param_values_cmp		(GParamSpec    *pspec,
                             const(GValue)  *value1,
                             const(GValue)  *value2);

    const(gchar) *   g_param_spec_get_name           (GParamSpec    *pspec);

    const(gchar) *   g_param_spec_get_nick           (GParamSpec    *pspec);

    const(gchar) *   g_param_spec_get_blurb          (GParamSpec    *pspec);

    void            g_value_set_param               (GValue	       *value,
                             GParamSpec    *param);

    GParamSpec*     g_value_get_param               (const(GValue)  *value);

    GParamSpec*     g_value_dup_param               (const(GValue)  *value);



    void           g_value_take_param               (GValue        *value,
                                 GParamSpec    *param);
    deprecated("use g_value_take_param")
    void           g_value_set_param_take_ownership (GValue        *value,
                                                     GParamSpec    *param);

    const(GValue) *  g_param_spec_get_default_value  (GParamSpec     *param);

    struct GParamSpecTypeInfo
    {
      /* type system portion */
      guint16         instance_size;                               /* obligatory */
      guint16         n_preallocs;                                 /* optional */
      void		function	(GParamSpec   *pspec) instance_init; /* optional */

      /* class portion */
      GType           value_type;				       /* obligatory */
      void          function             (GParamSpec   *pspec) finalize; /* optional */
      void          function    (GParamSpec   *pspec,  /* recommended */
                         GValue       *value) value_set_default;
      gboolean      function       (GParamSpec   *pspec,  /* optional */
                         GValue       *value) value_validate;
      gint          function           (GParamSpec   *pspec,  /* recommended */
                         const(GValue) *value1,
                         const(GValue) *value2) value_cmp;
    };

    GType	g_param_type_register_static	(const(gchar)		  *name,
                         const(GParamSpecTypeInfo) *pspec_info);

    /* For registering builting types */
    GType  _g_param_type_register_static_constant (const(gchar)              *name,
                               const(GParamSpecTypeInfo) *pspec_info,
                               GType                     opt_type);


    /* --- protected --- */

    gpointer	g_param_spec_internal		(GType	        param_type,
                             const(gchar)   *name,
                             const(gchar)   *nick,
                             const(gchar)   *blurb,
                             GParamFlags    flags);

    GParamSpecPool* g_param_spec_pool_new		(gboolean	type_prefixing);

    void		g_param_spec_pool_insert	(GParamSpecPool	*pool,
                             GParamSpec	*pspec,
                             GType		 owner_type);

    void		g_param_spec_pool_remove	(GParamSpecPool	*pool,
                             GParamSpec	*pspec);

    GParamSpec*	g_param_spec_pool_lookup	(GParamSpecPool	*pool,
                             const(gchar)	*param_name,
                             GType		 owner_type,
                             gboolean	 walk_ancestors);

    GList*		g_param_spec_pool_list_owned	(GParamSpecPool	*pool,
                             GType		 owner_type);

    GParamSpec**	g_param_spec_pool_list		(GParamSpecPool	*pool,
                             GType		 owner_type,
                             guint		*n_pspecs_p);

}

