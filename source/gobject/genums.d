/*
 * Distributed under the Boost Software License, Version 1.0.
 *    (See accompanying file LICENSE_1_0.txt or copy at
 *          http://www.boost.org/LICENSE_1_0.txt)
 */
module gobject.genums;

import gobject.gtype;
import gobject.gvalue;

import glib;

// /* --- type macros --- */
// /**
//  * G_TYPE_IS_ENUM:
//  * @type: a #GType ID.
//  *
//  * Checks whether @type "is a" %G_TYPE_ENUM.
//  *
//  * Returns: %TRUE if @type "is a" %G_TYPE_ENUM.
//  */
// #define G_TYPE_IS_ENUM(type)	       (G_TYPE_FUNDAMENTAL (type) == G_TYPE_ENUM)
// /**
//  * G_ENUM_CLASS:
//  * @class: a valid #GEnumClass
//  *
//  * Casts a derived #GEnumClass structure into a #GEnumClass structure.
//  */
// #define G_ENUM_CLASS(class)	       (G_TYPE_CHECK_CLASS_CAST ((class), G_TYPE_ENUM, GEnumClass))
// /**
//  * G_IS_ENUM_CLASS:
//  * @class: a #GEnumClass
//  *
//  * Checks whether @class "is a" valid #GEnumClass structure of type %G_TYPE_ENUM
//  * or derived.
//  */
// #define G_IS_ENUM_CLASS(class)	       (G_TYPE_CHECK_CLASS_TYPE ((class), G_TYPE_ENUM))
// /**
//  * G_ENUM_CLASS_TYPE:
//  * @class: a #GEnumClass
//  *
//  * Get the type identifier from a given #GEnumClass structure.
//  *
//  * Returns: the #GType
//  */
// #define G_ENUM_CLASS_TYPE(class)       (G_TYPE_FROM_CLASS (class))
// /**
//  * G_ENUM_CLASS_TYPE_NAME:
//  * @class: a #GEnumClass
//  *
//  * Get the static type name from a given #GEnumClass structure.
//  *
//  * Returns: the type name.
//  */
// #define G_ENUM_CLASS_TYPE_NAME(class)  (g_type_name (G_ENUM_CLASS_TYPE (class)))
//
//
// /**
//  * G_TYPE_IS_FLAGS:
//  * @type: a #GType ID.
//  *
//  * Checks whether @type "is a" %G_TYPE_FLAGS.
//  *
//  * Returns: %TRUE if @type "is a" %G_TYPE_FLAGS.
//  */
// #define G_TYPE_IS_FLAGS(type)	       (G_TYPE_FUNDAMENTAL (type) == G_TYPE_FLAGS)
// /**
//  * G_FLAGS_CLASS:
//  * @class: a valid #GFlagsClass
//  *
//  * Casts a derived #GFlagsClass structure into a #GFlagsClass structure.
//  */
// #define G_FLAGS_CLASS(class)	       (G_TYPE_CHECK_CLASS_CAST ((class), G_TYPE_FLAGS, GFlagsClass))
// /**
//  * G_IS_FLAGS_CLASS:
//  * @class: a #GFlagsClass
//  *
//  * Checks whether @class "is a" valid #GFlagsClass structure of type %G_TYPE_FLAGS
//  * or derived.
//  */
// #define G_IS_FLAGS_CLASS(class)        (G_TYPE_CHECK_CLASS_TYPE ((class), G_TYPE_FLAGS))
// /**
//  * G_FLAGS_CLASS_TYPE:
//  * @class: a #GFlagsClass
//  *
//  * Get the type identifier from a given #GFlagsClass structure.
//  *
//  * Returns: the #GType
//  */
// #define G_FLAGS_CLASS_TYPE(class)      (G_TYPE_FROM_CLASS (class))
// /**
//  * G_FLAGS_CLASS_TYPE_NAME:
//  * @class: a #GFlagsClass
//  *
//  * Get the static type name from a given #GFlagsClass structure.
//  *
//  * Returns: the type name.
//  */
// #define G_FLAGS_CLASS_TYPE_NAME(class) (g_type_name (G_FLAGS_CLASS_TYPE (class)))
//
//
// /**
//  * G_VALUE_HOLDS_ENUM:
//  * @value: a valid #GValue structure
//  *
//  * Checks whether the given #GValue can hold values derived from type %G_TYPE_ENUM.
//  *
//  * Returns: %TRUE on success.
//  */
// #define G_VALUE_HOLDS_ENUM(value)      (G_TYPE_CHECK_VALUE_TYPE ((value), G_TYPE_ENUM))
// /**
//  * G_VALUE_HOLDS_FLAGS:
//  * @value: a valid #GValue structure
//  *
//  * Checks whether the given #GValue can hold values derived from type %G_TYPE_FLAGS.
//  *
//  * Returns: %TRUE on success.
//  */
// #define G_VALUE_HOLDS_FLAGS(value)     (G_TYPE_CHECK_VALUE_TYPE ((value), G_TYPE_FLAGS))



struct	GEnumClass
{
  GTypeClass  g_type_class;

  /*< public >*/
  gint	      minimum;
  gint	      maximum;
  guint	      n_values;
  GEnumValue *values;
}

struct	GFlagsClass
{
  GTypeClass   g_type_class;

  /*< public >*/
  guint	       mask;
  guint	       n_values;
  GFlagsValue *values;
}

struct GEnumValue
{
  gint	 value;
  const(gchar) *value_name;
  const(gchar) *value_nick;
}

struct GFlagsValue
{
  guint	 value;
  const(gchar) *value_name;
  const(gchar) *value_nick;
}



GEnumValue*	g_enum_get_value		(GEnumClass	*enum_class,
						 gint		 value);

GEnumValue*	g_enum_get_value_by_name	(GEnumClass	*enum_class,
						 const(gchar)	*name);

GEnumValue*	g_enum_get_value_by_nick	(GEnumClass	*enum_class,
						 const(gchar)	*nick);

GFlagsValue*	g_flags_get_first_value		(GFlagsClass	*flags_class,
						 guint		 value);

GFlagsValue*	g_flags_get_value_by_name	(GFlagsClass	*flags_class,
						 const(gchar)	*name);

GFlagsValue*	g_flags_get_value_by_nick	(GFlagsClass	*flags_class,
						 const(gchar)	*nick);

void            g_value_set_enum        	(GValue         *value,
						 gint            v_enum);

gint            g_value_get_enum        	(const(GValue)   *value);

void            g_value_set_flags       	(GValue         *value,
						 guint           v_flags);

guint           g_value_get_flags       	(const(GValue)   *value);




GType	g_enum_register_static	   (const(gchar)	      *name,
				    const(GEnumValue)  *const_static_values);

GType	g_flags_register_static	   (const(gchar)	      *name,
				    const(GFlagsValue) *const_static_values);
/* functions to complete the type information
 * for enums/flags implemented by plugins
 */

void	g_enum_complete_type_info  (GType	       g_enum_type,
				    GTypeInfo	      *info,
				    const(GEnumValue)  *const_values);

void	g_flags_complete_type_info (GType	       g_flags_type,
				    GTypeInfo	      *info,
				    const(GFlagsValue) *const_values);

