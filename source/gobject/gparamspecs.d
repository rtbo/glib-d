module gobject.gparamspecs;

import gobject.gvalue;
import gobject.genums;
import gobject.gboxed;
import gobject.gobject;
import gobject.gparam;
import gobject.gtype;

import glib;

import std.bitmanip;


// /* --- type macros --- */
// /**
//  * G_TYPE_PARAM_CHAR:
//  *
//  * The #GType of #GParamSpecChar.
//  */
// #define	G_TYPE_PARAM_CHAR		   (g_param_spec_types[0])
// /**
//  * G_IS_PARAM_SPEC_CHAR:
//  * @pspec: a valid #GParamSpec instance
//  *
//  * Checks whether the given #GParamSpec is of type %G_TYPE_PARAM_CHAR.
//  *
//  * Returns: %TRUE on success.
//  */
// #define G_IS_PARAM_SPEC_CHAR(pspec)        (G_TYPE_CHECK_INSTANCE_TYPE ((pspec), G_TYPE_PARAM_CHAR))
// /**
//  * G_PARAM_SPEC_CHAR:
//  * @pspec: a valid #GParamSpec instance
//  *
//  * Cast a #GParamSpec instance into a #GParamSpecChar.
//  */
// #define G_PARAM_SPEC_CHAR(pspec)           (G_TYPE_CHECK_INSTANCE_CAST ((pspec), G_TYPE_PARAM_CHAR, GParamSpecChar))
//
// /**
//  * G_TYPE_PARAM_UCHAR:
//  *
//  * The #GType of #GParamSpecUChar.
//  */
// #define	G_TYPE_PARAM_UCHAR		   (g_param_spec_types[1])
// /**
//  * G_IS_PARAM_SPEC_UCHAR:
//  * @pspec: a valid #GParamSpec instance
//  *
//  * Checks whether the given #GParamSpec is of type %G_TYPE_PARAM_UCHAR.
//  *
//  * Returns: %TRUE on success.
//  */
// #define G_IS_PARAM_SPEC_UCHAR(pspec)       (G_TYPE_CHECK_INSTANCE_TYPE ((pspec), G_TYPE_PARAM_UCHAR))
// /**
//  * G_PARAM_SPEC_UCHAR:
//  * @pspec: a valid #GParamSpec instance
//  *
//  * Cast a #GParamSpec instance into a #GParamSpecUChar.
//  */
// #define G_PARAM_SPEC_UCHAR(pspec)          (G_TYPE_CHECK_INSTANCE_CAST ((pspec), G_TYPE_PARAM_UCHAR, GParamSpecUChar))
//
// /**
//  * G_TYPE_PARAM_BOOLEAN:
//  *
//  * The #GType of #GParamSpecBoolean.
//  */
// #define	G_TYPE_PARAM_BOOLEAN		   (g_param_spec_types[2])
// /**
//  * G_IS_PARAM_SPEC_BOOLEAN:
//  * @pspec: a valid #GParamSpec instance
//  *
//  * Checks whether the given #GParamSpec is of type %G_TYPE_PARAM_BOOLEAN.
//  *
//  * Returns: %TRUE on success.
//  */
// #define G_IS_PARAM_SPEC_BOOLEAN(pspec)     (G_TYPE_CHECK_INSTANCE_TYPE ((pspec), G_TYPE_PARAM_BOOLEAN))
// /**
//  * G_PARAM_SPEC_BOOLEAN:
//  * @pspec: a valid #GParamSpec instance
//  *
//  * Cast a #GParamSpec instance into a #GParamSpecBoolean.
//  */
// #define G_PARAM_SPEC_BOOLEAN(pspec)        (G_TYPE_CHECK_INSTANCE_CAST ((pspec), G_TYPE_PARAM_BOOLEAN, GParamSpecBoolean))
//
// /**
//  * G_TYPE_PARAM_INT:
//  *
//  * The #GType of #GParamSpecInt.
//  */
// #define	G_TYPE_PARAM_INT		   (g_param_spec_types[3])
// /**
//  * G_IS_PARAM_SPEC_INT:
//  * @pspec: a valid #GParamSpec instance
//  *
//  * Checks whether the given #GParamSpec is of type %G_TYPE_PARAM_INT.
//  *
//  * Returns: %TRUE on success.
//  */
// #define G_IS_PARAM_SPEC_INT(pspec)         (G_TYPE_CHECK_INSTANCE_TYPE ((pspec), G_TYPE_PARAM_INT))
// /**
//  * G_PARAM_SPEC_INT:
//  * @pspec: a valid #GParamSpec instance
//  *
//  * Cast a #GParamSpec instance into a #GParamSpecInt.
//  */
// #define G_PARAM_SPEC_INT(pspec)            (G_TYPE_CHECK_INSTANCE_CAST ((pspec), G_TYPE_PARAM_INT, GParamSpecInt))
//
// /**
//  * G_TYPE_PARAM_UINT:
//  *
//  * The #GType of #GParamSpecUInt.
//  */
// #define	G_TYPE_PARAM_UINT		   (g_param_spec_types[4])
// /**
//  * G_IS_PARAM_SPEC_UINT:
//  * @pspec: a valid #GParamSpec instance
//  *
//  * Checks whether the given #GParamSpec is of type %G_TYPE_PARAM_UINT.
//  *
//  * Returns: %TRUE on success.
//  */
// #define G_IS_PARAM_SPEC_UINT(pspec)        (G_TYPE_CHECK_INSTANCE_TYPE ((pspec), G_TYPE_PARAM_UINT))
// /**
//  * G_PARAM_SPEC_UINT:
//  * @pspec: a valid #GParamSpec instance
//  *
//  * Cast a #GParamSpec instance into a #GParamSpecUInt.
//  */
// #define G_PARAM_SPEC_UINT(pspec)           (G_TYPE_CHECK_INSTANCE_CAST ((pspec), G_TYPE_PARAM_UINT, GParamSpecUInt))
//
// /**
//  * G_TYPE_PARAM_LONG:
//  *
//  * The #GType of #GParamSpecLong.
//  */
// #define	G_TYPE_PARAM_LONG		   (g_param_spec_types[5])
// /**
//  * G_IS_PARAM_SPEC_LONG:
//  * @pspec: a valid #GParamSpec instance
//  *
//  * Checks whether the given #GParamSpec is of type %G_TYPE_PARAM_LONG.
//  *
//  * Returns: %TRUE on success.
//  */
// #define G_IS_PARAM_SPEC_LONG(pspec)        (G_TYPE_CHECK_INSTANCE_TYPE ((pspec), G_TYPE_PARAM_LONG))
// /**
//  * G_PARAM_SPEC_LONG:
//  * @pspec: a valid #GParamSpec instance
//  *
//  * Cast a #GParamSpec instance into a #GParamSpecLong.
//  */
// #define G_PARAM_SPEC_LONG(pspec)           (G_TYPE_CHECK_INSTANCE_CAST ((pspec), G_TYPE_PARAM_LONG, GParamSpecLong))
//
// /**
//  * G_TYPE_PARAM_ULONG:
//  *
//  * The #GType of #GParamSpecULong.
//  */
// #define	G_TYPE_PARAM_ULONG		   (g_param_spec_types[6])
// /**
//  * G_IS_PARAM_SPEC_ULONG:
//  * @pspec: a valid #GParamSpec instance
//  *
//  * Checks whether the given #GParamSpec is of type %G_TYPE_PARAM_ULONG.
//  *
//  * Returns: %TRUE on success.
//  */
// #define G_IS_PARAM_SPEC_ULONG(pspec)       (G_TYPE_CHECK_INSTANCE_TYPE ((pspec), G_TYPE_PARAM_ULONG))
// /**
//  * G_PARAM_SPEC_ULONG:
//  * @pspec: a valid #GParamSpec instance
//  *
//  * Cast a #GParamSpec instance into a #GParamSpecULong.
//  */
// #define G_PARAM_SPEC_ULONG(pspec)          (G_TYPE_CHECK_INSTANCE_CAST ((pspec), G_TYPE_PARAM_ULONG, GParamSpecULong))
//
// /**
//  * G_TYPE_PARAM_INT64:
//  *
//  * The #GType of #GParamSpecInt64.
//  */
// #define	G_TYPE_PARAM_INT64		   (g_param_spec_types[7])
// /**
//  * G_IS_PARAM_SPEC_INT64:
//  * @pspec: a valid #GParamSpec instance
//  *
//  * Checks whether the given #GParamSpec is of type %G_TYPE_PARAM_INT64.
//  *
//  * Returns: %TRUE on success.
//  */
// #define G_IS_PARAM_SPEC_INT64(pspec)       (G_TYPE_CHECK_INSTANCE_TYPE ((pspec), G_TYPE_PARAM_INT64))
// /**
//  * G_PARAM_SPEC_INT64:
//  * @pspec: a valid #GParamSpec instance
//  *
//  * Cast a #GParamSpec instance into a #GParamSpecInt64.
//  */
// #define G_PARAM_SPEC_INT64(pspec)          (G_TYPE_CHECK_INSTANCE_CAST ((pspec), G_TYPE_PARAM_INT64, GParamSpecInt64))
//
// /**
//  * G_TYPE_PARAM_UINT64:
//  *
//  * The #GType of #GParamSpecUInt64.
//  */
// #define	G_TYPE_PARAM_UINT64		   (g_param_spec_types[8])
// /**
//  * G_IS_PARAM_SPEC_UINT64:
//  * @pspec: a valid #GParamSpec instance
//  *
//  * Checks whether the given #GParamSpec is of type %G_TYPE_PARAM_UINT64.
//  *
//  * Returns: %TRUE on success.
//  */
// #define G_IS_PARAM_SPEC_UINT64(pspec)      (G_TYPE_CHECK_INSTANCE_TYPE ((pspec), G_TYPE_PARAM_UINT64))
// /**
//  * G_PARAM_SPEC_UINT64:
//  * @pspec: a valid #GParamSpec instance
//  *
//  * Cast a #GParamSpec instance into a #GParamSpecUInt64.
//  */
// #define G_PARAM_SPEC_UINT64(pspec)         (G_TYPE_CHECK_INSTANCE_CAST ((pspec), G_TYPE_PARAM_UINT64, GParamSpecUInt64))
//
// /**
//  * G_TYPE_PARAM_UNICHAR:
//  *
//  * The #GType of #GParamSpecUnichar.
//  */
// #define	G_TYPE_PARAM_UNICHAR		   (g_param_spec_types[9])
// /**
//  * G_PARAM_SPEC_UNICHAR:
//  * @pspec: a valid #GParamSpec instance
//  *
//  * Cast a #GParamSpec instance into a #GParamSpecUnichar.
//  */
// #define G_PARAM_SPEC_UNICHAR(pspec)        (G_TYPE_CHECK_INSTANCE_CAST ((pspec), G_TYPE_PARAM_UNICHAR, GParamSpecUnichar))
// /**
//  * G_IS_PARAM_SPEC_UNICHAR:
//  * @pspec: a valid #GParamSpec instance
//  *
//  * Checks whether the given #GParamSpec is of type %G_TYPE_PARAM_UNICHAR.
//  *
//  * Returns: %TRUE on success.
//  */
// #define G_IS_PARAM_SPEC_UNICHAR(pspec)     (G_TYPE_CHECK_INSTANCE_TYPE ((pspec), G_TYPE_PARAM_UNICHAR))
//
// /**
//  * G_TYPE_PARAM_ENUM:
//  *
//  * The #GType of #GParamSpecEnum.
//  */
// #define	G_TYPE_PARAM_ENUM		   (g_param_spec_types[10])
// /**
//  * G_IS_PARAM_SPEC_ENUM:
//  * @pspec: a valid #GParamSpec instance
//  *
//  * Checks whether the given #GParamSpec is of type %G_TYPE_PARAM_ENUM.
//  *
//  * Returns: %TRUE on success.
//  */
// #define G_IS_PARAM_SPEC_ENUM(pspec)        (G_TYPE_CHECK_INSTANCE_TYPE ((pspec), G_TYPE_PARAM_ENUM))
// /**
//  * G_PARAM_SPEC_ENUM:
//  * @pspec: a valid #GParamSpec instance
//  *
//  * Cast a #GParamSpec instance into a #GParamSpecEnum.
//  */
// #define G_PARAM_SPEC_ENUM(pspec)           (G_TYPE_CHECK_INSTANCE_CAST ((pspec), G_TYPE_PARAM_ENUM, GParamSpecEnum))
//
// /**
//  * G_TYPE_PARAM_FLAGS:
//  *
//  * The #GType of #GParamSpecFlags.
//  */
// #define	G_TYPE_PARAM_FLAGS		   (g_param_spec_types[11])
// /**
//  * G_IS_PARAM_SPEC_FLAGS:
//  * @pspec: a valid #GParamSpec instance
//  *
//  * Checks whether the given #GParamSpec is of type %G_TYPE_PARAM_FLAGS.
//  *
//  * Returns: %TRUE on success.
//  */
// #define G_IS_PARAM_SPEC_FLAGS(pspec)       (G_TYPE_CHECK_INSTANCE_TYPE ((pspec), G_TYPE_PARAM_FLAGS))
// /**
//  * G_PARAM_SPEC_FLAGS:
//  * @pspec: a valid #GParamSpec instance
//  *
//  * Cast a #GParamSpec instance into a #GParamSpecFlags.
//  */
// #define G_PARAM_SPEC_FLAGS(pspec)          (G_TYPE_CHECK_INSTANCE_CAST ((pspec), G_TYPE_PARAM_FLAGS, GParamSpecFlags))
//
// /**
//  * G_TYPE_PARAM_FLOAT:
//  *
//  * The #GType of #GParamSpecFloat.
//  */
// #define	G_TYPE_PARAM_FLOAT		   (g_param_spec_types[12])
// /**
//  * G_IS_PARAM_SPEC_FLOAT:
//  * @pspec: a valid #GParamSpec instance
//  *
//  * Checks whether the given #GParamSpec is of type %G_TYPE_PARAM_FLOAT.
//  *
//  * Returns: %TRUE on success.
//  */
// #define G_IS_PARAM_SPEC_FLOAT(pspec)       (G_TYPE_CHECK_INSTANCE_TYPE ((pspec), G_TYPE_PARAM_FLOAT))
// /**
//  * G_PARAM_SPEC_FLOAT:
//  * @pspec: a valid #GParamSpec instance
//  *
//  * Cast a #GParamSpec instance into a #GParamSpecFloat.
//  */
// #define G_PARAM_SPEC_FLOAT(pspec)          (G_TYPE_CHECK_INSTANCE_CAST ((pspec), G_TYPE_PARAM_FLOAT, GParamSpecFloat))
//
// /**
//  * G_TYPE_PARAM_DOUBLE:
//  *
//  * The #GType of #GParamSpecDouble.
//  */
// #define	G_TYPE_PARAM_DOUBLE		   (g_param_spec_types[13])
// /**
//  * G_IS_PARAM_SPEC_DOUBLE:
//  * @pspec: a valid #GParamSpec instance
//  *
//  * Checks whether the given #GParamSpec is of type %G_TYPE_PARAM_DOUBLE.
//  *
//  * Returns: %TRUE on success.
//  */
// #define G_IS_PARAM_SPEC_DOUBLE(pspec)      (G_TYPE_CHECK_INSTANCE_TYPE ((pspec), G_TYPE_PARAM_DOUBLE))
// /**
//  * G_PARAM_SPEC_DOUBLE:
//  * @pspec: a valid #GParamSpec instance
//  *
//  * Cast a #GParamSpec instance into a #GParamSpecDouble.
//  */
// #define G_PARAM_SPEC_DOUBLE(pspec)         (G_TYPE_CHECK_INSTANCE_CAST ((pspec), G_TYPE_PARAM_DOUBLE, GParamSpecDouble))
//
// /**
//  * G_TYPE_PARAM_STRING:
//  *
//  * The #GType of #GParamSpecString.
//  */
// #define	G_TYPE_PARAM_STRING		   (g_param_spec_types[14])
// /**
//  * G_IS_PARAM_SPEC_STRING:
//  * @pspec: a valid #GParamSpec instance
//  *
//  * Checks whether the given #GParamSpec is of type %G_TYPE_PARAM_STRING.
//  *
//  * Returns: %TRUE on success.
//  */
// #define G_IS_PARAM_SPEC_STRING(pspec)      (G_TYPE_CHECK_INSTANCE_TYPE ((pspec), G_TYPE_PARAM_STRING))
// /**
//  * G_PARAM_SPEC_STRING:
//  * @pspec: a valid #GParamSpec instance
//  *
//  * Casts a #GParamSpec instance into a #GParamSpecString.
//  */
// #define G_PARAM_SPEC_STRING(pspec)         (G_TYPE_CHECK_INSTANCE_CAST ((pspec), G_TYPE_PARAM_STRING, GParamSpecString))
//
// /**
//  * G_TYPE_PARAM_PARAM:
//  *
//  * The #GType of #GParamSpecParam.
//  */
// #define	G_TYPE_PARAM_PARAM		   (g_param_spec_types[15])
// /**
//  * G_IS_PARAM_SPEC_PARAM:
//  * @pspec: a valid #GParamSpec instance
//  *
//  * Checks whether the given #GParamSpec is of type %G_TYPE_PARAM_PARAM.
//  *
//  * Returns: %TRUE on success.
//  */
// #define G_IS_PARAM_SPEC_PARAM(pspec)       (G_TYPE_CHECK_INSTANCE_TYPE ((pspec), G_TYPE_PARAM_PARAM))
// /**
//  * G_PARAM_SPEC_PARAM:
//  * @pspec: a valid #GParamSpec instance
//  *
//  * Casts a #GParamSpec instance into a #GParamSpecParam.
//  */
// #define G_PARAM_SPEC_PARAM(pspec)          (G_TYPE_CHECK_INSTANCE_CAST ((pspec), G_TYPE_PARAM_PARAM, GParamSpecParam))
//
// /**
//  * G_TYPE_PARAM_BOXED:
//  *
//  * The #GType of #GParamSpecBoxed.
//  */
// #define	G_TYPE_PARAM_BOXED		   (g_param_spec_types[16])
// /**
//  * G_IS_PARAM_SPEC_BOXED:
//  * @pspec: a valid #GParamSpec instance
//  *
//  * Checks whether the given #GParamSpec is of type %G_TYPE_PARAM_BOXED.
//  *
//  * Returns: %TRUE on success.
//  */
// #define G_IS_PARAM_SPEC_BOXED(pspec)       (G_TYPE_CHECK_INSTANCE_TYPE ((pspec), G_TYPE_PARAM_BOXED))
// /**
//  * G_PARAM_SPEC_BOXED:
//  * @pspec: a valid #GParamSpec instance
//  *
//  * Cast a #GParamSpec instance into a #GParamSpecBoxed.
//  */
// #define G_PARAM_SPEC_BOXED(pspec)          (G_TYPE_CHECK_INSTANCE_CAST ((pspec), G_TYPE_PARAM_BOXED, GParamSpecBoxed))
//
// /**
//  * G_TYPE_PARAM_POINTER:
//  *
//  * The #GType of #GParamSpecPointer.
//  */
// #define	G_TYPE_PARAM_POINTER		   (g_param_spec_types[17])
// /**
//  * G_IS_PARAM_SPEC_POINTER:
//  * @pspec: a valid #GParamSpec instance
//  *
//  * Checks whether the given #GParamSpec is of type %G_TYPE_PARAM_POINTER.
//  *
//  * Returns: %TRUE on success.
//  */
// #define G_IS_PARAM_SPEC_POINTER(pspec)     (G_TYPE_CHECK_INSTANCE_TYPE ((pspec), G_TYPE_PARAM_POINTER))
// /**
//  * G_PARAM_SPEC_POINTER:
//  * @pspec: a valid #GParamSpec instance
//  *
//  * Casts a #GParamSpec instance into a #GParamSpecPointer.
//  */
// #define G_PARAM_SPEC_POINTER(pspec)        (G_TYPE_CHECK_INSTANCE_CAST ((pspec), G_TYPE_PARAM_POINTER, GParamSpecPointer))
//
// /**
//  * G_TYPE_PARAM_VALUE_ARRAY:
//  *
//  * The #GType of #GParamSpecValueArray.
//  *
//  * Deprecated: 2.32: Use #GArray instead of #GValueArray
//  */
// #define	G_TYPE_PARAM_VALUE_ARRAY	   (g_param_spec_types[18])
// /**
//  * G_IS_PARAM_SPEC_VALUE_ARRAY:
//  * @pspec: a valid #GParamSpec instance
//  *
//  * Checks whether the given #GParamSpec is of type %G_TYPE_PARAM_VALUE_ARRAY.
//  *
//  * Returns: %TRUE on success.
//  *
//  * Deprecated: 2.32: Use #GArray instead of #GValueArray
//  */
// #define G_IS_PARAM_SPEC_VALUE_ARRAY(pspec) (G_TYPE_CHECK_INSTANCE_TYPE ((pspec), G_TYPE_PARAM_VALUE_ARRAY))
// /**
//  * G_PARAM_SPEC_VALUE_ARRAY:
//  * @pspec: a valid #GParamSpec instance
//  *
//  * Cast a #GParamSpec instance into a #GParamSpecValueArray.
//  *
//  * Deprecated: 2.32: Use #GArray instead of #GValueArray
//  */
// #define G_PARAM_SPEC_VALUE_ARRAY(pspec)    (G_TYPE_CHECK_INSTANCE_CAST ((pspec), G_TYPE_PARAM_VALUE_ARRAY, GParamSpecValueArray))
//
// /**
//  * G_TYPE_PARAM_OBJECT:
//  *
//  * The #GType of #GParamSpecObject.
//  */
// #define	G_TYPE_PARAM_OBJECT		   (g_param_spec_types[19])
// /**
//  * G_IS_PARAM_SPEC_OBJECT:
//  * @pspec: a valid #GParamSpec instance
//  *
//  * Checks whether the given #GParamSpec is of type %G_TYPE_PARAM_OBJECT.
//  *
//  * Returns: %TRUE on success.
//  */
// #define G_IS_PARAM_SPEC_OBJECT(pspec)      (G_TYPE_CHECK_INSTANCE_TYPE ((pspec), G_TYPE_PARAM_OBJECT))
// /**
//  * G_PARAM_SPEC_OBJECT:
//  * @pspec: a valid #GParamSpec instance
//  *
//  * Casts a #GParamSpec instance into a #GParamSpecObject.
//  */
// #define G_PARAM_SPEC_OBJECT(pspec)         (G_TYPE_CHECK_INSTANCE_CAST ((pspec), G_TYPE_PARAM_OBJECT, GParamSpecObject))
//
// /**
//  * G_TYPE_PARAM_OVERRIDE:
//  *
//  * The #GType of #GParamSpecOverride.
//  *
//  * Since: 2.4
//  */
// #define	G_TYPE_PARAM_OVERRIDE		   (g_param_spec_types[20])
// /**
//  * G_IS_PARAM_SPEC_OVERRIDE:
//  * @pspec: a #GParamSpec
//  *
//  * Checks whether the given #GParamSpec is of type %G_TYPE_PARAM_OVERRIDE.
//  *
//  * Since: 2.4
//  * Returns: %TRUE on success.
//  */
// #define G_IS_PARAM_SPEC_OVERRIDE(pspec)    (G_TYPE_CHECK_INSTANCE_TYPE ((pspec), G_TYPE_PARAM_OVERRIDE))
// /**
//  * G_PARAM_SPEC_OVERRIDE:
//  * @pspec: a #GParamSpec
//  *
//  * Casts a #GParamSpec into a #GParamSpecOverride.
//  *
//  * Since: 2.4
//  */
// #define G_PARAM_SPEC_OVERRIDE(pspec)       (G_TYPE_CHECK_INSTANCE_CAST ((pspec), G_TYPE_PARAM_OVERRIDE, GParamSpecOverride))
//
// /**
//  * G_TYPE_PARAM_GTYPE:
//  *
//  * The #GType of #GParamSpecGType.
//  *
//  * Since: 2.10
//  */
// #define	G_TYPE_PARAM_GTYPE		   (g_param_spec_types[21])
// /**
//  * G_IS_PARAM_SPEC_GTYPE:
//  * @pspec: a #GParamSpec
//  *
//  * Checks whether the given #GParamSpec is of type %G_TYPE_PARAM_GTYPE.
//  *
//  * Since: 2.10
//  * Returns: %TRUE on success.
//  */
// #define G_IS_PARAM_SPEC_GTYPE(pspec)       (G_TYPE_CHECK_INSTANCE_TYPE ((pspec), G_TYPE_PARAM_GTYPE))
// /**
//  * G_PARAM_SPEC_GTYPE:
//  * @pspec: a #GParamSpec
//  *
//  * Casts a #GParamSpec into a #GParamSpecGType.
//  *
//  * Since: 2.10
//  */
// #define G_PARAM_SPEC_GTYPE(pspec)          (G_TYPE_CHECK_INSTANCE_CAST ((pspec), G_TYPE_PARAM_GTYPE, GParamSpecGType))
//
// /**
//  * G_TYPE_PARAM_VARIANT:
//  *
//  * The #GType of #GParamSpecVariant.
//  *
//  * Since: 2.26
//  */
// #define G_TYPE_PARAM_VARIANT                (g_param_spec_types[22])
// /**
//  * G_IS_PARAM_SPEC_VARIANT:
//  * @pspec: a #GParamSpec
//  *
//  * Checks whether the given #GParamSpec is of type %G_TYPE_PARAM_VARIANT.
//  *
//  * Returns: %TRUE on success
//  *
//  * Since: 2.26
//  */
// #define G_IS_PARAM_SPEC_VARIANT(pspec)      (G_TYPE_CHECK_INSTANCE_TYPE ((pspec), G_TYPE_PARAM_VARIANT))
// /**
//  * G_PARAM_SPEC_VARIANT:
//  * @pspec: a #GParamSpec
//  *
//  * Casts a #GParamSpec into a #GParamSpecVariant.
//  *
//  * Since: 2.26
//  */
// #define G_PARAM_SPEC_VARIANT(pspec)         (G_TYPE_CHECK_INSTANCE_CAST ((pspec), G_TYPE_PARAM_VARIANT, GParamSpecVariant))

extern (C):

struct GParamSpecChar
{
  GParamSpec    parent_instance;

  gint8         minimum;
  gint8         maximum;
  gint8         default_value;
}

struct GParamSpecUChar
{
  GParamSpec    parent_instance;

  guint8        minimum;
  guint8        maximum;
  guint8        default_value;
}

struct GParamSpecBoolean
{
  GParamSpec    parent_instance;

  gboolean      default_value;
}

struct GParamSpecInt
{
  GParamSpec    parent_instance;

  gint          minimum;
  gint          maximum;
  gint          default_value;
}

struct GParamSpecUInt
{
  GParamSpec    parent_instance;

  guint         minimum;
  guint         maximum;
  guint         default_value;
}

struct GParamSpecLong
{
  GParamSpec    parent_instance;

  glong         minimum;
  glong         maximum;
  glong         default_value;
}

struct GParamSpecULong
{
  GParamSpec    parent_instance;

  gulong        minimum;
  gulong        maximum;
  gulong        default_value;
}

struct GParamSpecInt64
{
  GParamSpec    parent_instance;

  gint64        minimum;
  gint64        maximum;
  gint64        default_value;
}

struct GParamSpecUInt64
{
  GParamSpec    parent_instance;

  guint64       minimum;
  guint64       maximum;
  guint64       default_value;
}

struct GParamSpecUnichar
{
  GParamSpec    parent_instance;

  gunichar      default_value;
}

struct GParamSpecEnum
{
  GParamSpec    parent_instance;

  GEnumClass   *enum_class;
  gint          default_value;
}

struct GParamSpecFlags
{
  GParamSpec    parent_instance;

  GFlagsClass  *flags_class;
  guint         default_value;
}

struct GParamSpecFloat
{
  GParamSpec    parent_instance;

  gfloat        minimum;
  gfloat        maximum;
  gfloat        default_value;
  gfloat        epsilon;
}

struct GParamSpecDouble
{
  GParamSpec    parent_instance;

  gdouble       minimum;
  gdouble       maximum;
  gdouble       default_value;
  gdouble       epsilon;
}

struct GParamSpecString
{
  GParamSpec    parent_instance;

  gchar        *default_value;
  gchar        *cset_first;
  gchar        *cset_nth;
  gchar         substitutor;
  mixin(bitfields!(
                   guint, "null_fold_if_empty", 1,
                   guint, "ensure_non_null", 1,
                   guint, "", 6));
}

struct GParamSpecParam
{
  GParamSpec    parent_instance;
}

struct GParamSpecBoxed
{
  GParamSpec    parent_instance;
};

struct GParamSpecPointer
{
  GParamSpec    parent_instance;
}

struct GParamSpecValueArray
{
  GParamSpec    parent_instance;
  GParamSpec   *element_spec;
  guint		fixed_n_elements;
}

struct GParamSpecObject
{
  GParamSpec    parent_instance;
}

struct GParamSpecOverride
{
  /*< private >*/
  GParamSpec    parent_instance;
  GParamSpec   *overridden;
}

struct GParamSpecGType
{
  GParamSpec    parent_instance;
  GType         is_a_type;
}

struct GParamSpecVariant
{
  GParamSpec    parent_instance;
  GVariantType *type;
  GVariant     *default_value;

  /*< private >*/
  gpointer      padding[4];
}


GParamSpec*	g_param_spec_char	 (const(gchar)	 *name,
					  const(gchar)	 *nick,
					  const(gchar)	 *blurb,
					  gint8		  minimum,
					  gint8		  maximum,
					  gint8		  default_value,
					  GParamFlags	  flags);

GParamSpec*	g_param_spec_uchar	 (const(gchar)	 *name,
					  const(gchar)	 *nick,
					  const(gchar)	 *blurb,
					  guint8	  minimum,
					  guint8	  maximum,
					  guint8	  default_value,
					  GParamFlags	  flags);

GParamSpec*	g_param_spec_boolean	 (const(gchar)	 *name,
					  const(gchar)	 *nick,
					  const(gchar)	 *blurb,
					  gboolean	  default_value,
					  GParamFlags	  flags);

GParamSpec*	g_param_spec_int	 (const(gchar)	 *name,
					  const(gchar)	 *nick,
					  const(gchar)	 *blurb,
					  gint		  minimum,
					  gint		  maximum,
					  gint		  default_value,
					  GParamFlags	  flags);

GParamSpec*	g_param_spec_uint	 (const(gchar)	 *name,
					  const(gchar)	 *nick,
					  const(gchar)	 *blurb,
					  guint		  minimum,
					  guint		  maximum,
					  guint		  default_value,
					  GParamFlags	  flags);

GParamSpec*	g_param_spec_long	 (const(gchar)	 *name,
					  const(gchar)	 *nick,
					  const(gchar)	 *blurb,
					  glong		  minimum,
					  glong		  maximum,
					  glong		  default_value,
					  GParamFlags	  flags);

GParamSpec*	g_param_spec_ulong	 (const(gchar)	 *name,
					  const(gchar)	 *nick,
					  const(gchar)	 *blurb,
					  gulong	  minimum,
					  gulong	  maximum,
					  gulong	  default_value,
					  GParamFlags	  flags);

GParamSpec*	g_param_spec_int64	 (const(gchar)	 *name,
					  const(gchar)	 *nick,
					  const(gchar)	 *blurb,
					  gint64       	  minimum,
					  gint64       	  maximum,
					  gint64       	  default_value,
					  GParamFlags	  flags);

GParamSpec*	g_param_spec_uint64	 (const(gchar)	 *name,
					  const(gchar)	 *nick,
					  const(gchar)	 *blurb,
					  guint64	  minimum,
					  guint64	  maximum,
					  guint64	  default_value,
					  GParamFlags	  flags);

GParamSpec*	g_param_spec_unichar      (const(gchar)    *name,
				          const(gchar)    *nick,
				          const(gchar)    *blurb,
				          gunichar	  default_value,
				          GParamFlags     flags);

GParamSpec*	g_param_spec_enum	 (const(gchar)	 *name,
					  const(gchar)	 *nick,
					  const(gchar)	 *blurb,
					  GType		  enum_type,
					  gint		  default_value,
					  GParamFlags	  flags);

GParamSpec*	g_param_spec_flags	 (const(gchar)	 *name,
					  const(gchar)	 *nick,
					  const(gchar)	 *blurb,
					  GType		  flags_type,
					  guint		  default_value,
					  GParamFlags	  flags);

GParamSpec*	g_param_spec_float	 (const(gchar)	 *name,
					  const(gchar)	 *nick,
					  const(gchar)	 *blurb,
					  gfloat	  minimum,
					  gfloat	  maximum,
					  gfloat	  default_value,
					  GParamFlags	  flags);

GParamSpec*	g_param_spec_double	 (const(gchar)	 *name,
					  const(gchar)	 *nick,
					  const(gchar)	 *blurb,
					  gdouble	  minimum,
					  gdouble	  maximum,
					  gdouble	  default_value,
					  GParamFlags	  flags);

GParamSpec*	g_param_spec_string	 (const(gchar)	 *name,
					  const(gchar)	 *nick,
					  const(gchar)	 *blurb,
					  const(gchar)	 *default_value,
					  GParamFlags	  flags);

GParamSpec*	g_param_spec_param	 (const(gchar)	 *name,
					  const(gchar)	 *nick,
					  const(gchar)	 *blurb,
					  GType		  param_type,
					  GParamFlags	  flags);

GParamSpec*	g_param_spec_boxed	 (const(gchar)	 *name,
					  const(gchar)	 *nick,
					  const(gchar)	 *blurb,
					  GType		  boxed_type,
					  GParamFlags	  flags);

GParamSpec*	g_param_spec_pointer	 (const(gchar)	 *name,
					  const(gchar)	 *nick,
					  const(gchar)	 *blurb,
					  GParamFlags	  flags);

GParamSpec*	g_param_spec_value_array (const(gchar)	 *name,
					  const(gchar)	 *nick,
					  const(gchar)	 *blurb,
					  GParamSpec	 *element_spec,
					  GParamFlags	  flags);

GParamSpec*	g_param_spec_object	 (const(gchar)	 *name,
					  const(gchar)	 *nick,
					  const(gchar)	 *blurb,
					  GType		  object_type,
					  GParamFlags	  flags);

GParamSpec*	g_param_spec_override    (const(gchar)    *name,
					  GParamSpec     *overridden);

GParamSpec*	g_param_spec_gtype	 (const(gchar)	 *name,
					  const(gchar)	 *nick,
					  const(gchar)	 *blurb,
					  GType           is_a_type,
					  GParamFlags	  flags);

GParamSpec*	g_param_spec_variant	 (const(gchar)        *name,
					  const(gchar)        *nick,
					  const(gchar)	     *blurb,
					  const(GVariantType) *type,
					  GVariant           *default_value,
					  GParamFlags         flags);


extern __gshared GType *g_param_spec_types;

