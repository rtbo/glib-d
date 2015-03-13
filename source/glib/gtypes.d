/*
 * Distributed under the Boost Software License, Version 1.0.
 *    (See accompanying file LICENSE_1_0.txt or copy at
 *          http://www.boost.org/LICENSE_1_0.txt)
 */
module glib.gtypes;

import std.bitmanip;
import core.stdc.config;


enum GLIB_MAJOR_VERSION = 2;
enum GLIB_MINOR_VERSION = 42;
enum GLIB_MICRO_VERSION = 1;


alias gchar = char;
alias gshort = short;
alias glong = c_long;
alias gint = int;
alias gboolean = gint;

alias guchar = ubyte;
alias gushort = ushort;
alias gulong = c_ulong;
alias guint = uint;

alias gfloat = float;
alias gdouble = double;

alias gint8 = byte;
alias guint8 = ubyte;
alias gint16 = short;
alias guint16 = ushort;
alias gint32 = int;
alias guint32 = uint;
alias gint64 = long;
alias guint64 = ulong;

alias gssize = ptrdiff_t;
alias gsize = size_t;

alias goffset = gint64;

alias gpointer = void*;
alias gconstpointer = const(void)*;

alias gintptr = ptrdiff_t;
alias guintptr = size_t;

alias GPid = int;


enum float G_MINFLOAT = float.min_normal;
enum float G_MAXFLOAT = float.max;
enum double G_MINDOUBLE	= double.min_normal;
enum double G_MAXDOUBLE	= double.max;
enum short G_MINSHORT = short.min;
enum short G_MAXSHORT = short.max;
enum ushort G_MAXUSHORT = ushort.max;
enum int G_MININT = int.min;
enum int G_MAXINT = int.max;
enum uint G_MAXUINT = uint.max;
enum c_long G_MINLONG = c_long.min;
enum c_long G_MAXLONG = c_long.max;
enum c_ulong G_MAXULONG	= c_ulong.max;

enum gint8 G_MININT8 = gint8.min;
enum gint8 G_MAXINT8 = gint8.max;
enum guint8 G_MAXUINT8 = guint8.max;

enum gint16 G_MININT16 = gint16.min;
enum gint16 G_MAXINT16 = gint16.max;
enum guint16 G_MAXUINT16 = guint16.max;

enum gint32 G_MININT32 = gint32.min;
enum gint32 G_MAXINT32 = gint32.max;
enum guint32 G_MAXUINT32 = guint32.max;

enum gint64 G_MININT64 = gint64.min;
enum gint64 G_MAXINT64 = gint64.max;
enum guint64 G_MAXUINT64 = guint64.max;

enum gsize G_MAXSIZE = gsize.max;
enum gssize G_MINSSIZE = gssize.min;
enum gssize G_MAXSSIZE = gssize.max;

enum goffset G_MINOFFSET = goffset.min;
enum goffset G_MAXOFFSET = goffset.max;

enum size_t GLIB_SIZEOF_VOID_P = (void*).sizeof;
enum size_t GLIB_SIZEOF_LONG = c_long.sizeof;
enum size_t GLIB_SIZEOF_SIZE_T = size_t.sizeof;
enum size_t GLIB_SIZEOF_SSIZE_T = ptrdiff_t.sizeof;


enum FALSE = 0;
enum TRUE = 1;
enum NULL = null;


extern (C) {
    alias GCompareFunc = gint function(gconstpointer a, gconstpointer b);
    alias GCompareDataFunc = gint function(gconstpointer a, gconstpointer b,
                                           gpointer user_data);
    alias GEqualFunc = gboolean function(gconstpointer a, gconstpointer b);
    alias GDestroyNotify = void function(gpointer data);
    alias GFunc = void function(gpointer data, gpointer user_data);
    alias GHashFunc = guint function (gconstpointer key);
    alias GHFunc = void function(gpointer key, gpointer value,
                                 gpointer user_data);

    alias GFreeFunc = void function(gpointer data);

    alias GTranslateFunc = const(gchar)* function(const(gchar)*str,
                                                  gpointer data);
}
enum real G_E = 2.7182818284590452353602874713526624977572470937000;
enum real G_LN2 = 0.69314718055994530941723212145817656807550013436026;
enum real G_LN10 = 2.3025850929940456840179914546843642076011014886288;
enum real G_PI = 3.1415926535897932384626433832795028841971693993751;
enum real G_PI_2 = 1.5707963267948966192313216916397514420985846996876;
enum real G_PI_4 = 0.78539816339744830961566084581987572104929234984378;
enum real G_SQRT2 = 1.4142135623730950488016887242096980785696718753769;

enum G_LITTLE_ENDIAN = 1234;
enum G_BIG_ENDIAN =    4321;
version (LittleEndian) enum G_BYTE_ORDER = G_LITTLE_ENDIAN;
else enum G_BYTE_ORDER = G_BIG_ENDIAN;



guint16 GUINT16_SWAP_LE_BE(V)(V val) {
    return
        cast(guint16)((cast(guint16)val >> 8) | (cast(guint16)val << 8));
}

guint32 GUINT32_SWAP_LE_BE(V)(V val) {
    return
        (((cast(guint32)val) & 0x000000ff) << 24) |
        (((cast(guint32)val) & 0x0000ff00) << 8) |
        (((cast(guint32)val) & 0x00ff0000) >> 8) |
        (((cast(guint32)val) & 0xff000000) >> 24);
}

guint64 GUINT64_SWAP_LE_BE(V)(V val) {
    return
        (((cast(guint64)val) & 0x00000000000000ffL) << 56) |
        (((cast(guint64)val) & 0x000000000000ff00L) << 40) |
        (((cast(guint64)val) & 0x0000000000ff0000L) << 24) |
        (((cast(guint64)val) & 0x00000000ff000000L) << 8)  |
        (((cast(guint64)val) & 0x000000ff00000000L) >> 8)  |
        (((cast(guint64)val) & 0x0000ff0000000000L) >> 24) |
        (((cast(guint64)val) & 0x00ff000000000000L) >> 40) |
        (((cast(guint64)val) & 0xff00000000000000L) >> 56);
}

template GUINT16_SWAP_LE_BE_CONSTANT(guint16 val)
{
    const guint16 GUINT16_SWAP_LE_BE_CONSTANT =
        (cast(guint16)val >> 8) | (cast(guint16)val << 8);
}

template GUINT32_SWAP_LE_BE_CONSTANT(guint32 val)
{
    const guint32 GUINT32_SWAP_LE_BE_CONSTANT =
        (((cast(guint32)val) & 0x000000ff) << 24) |
        (((cast(guint32)val) & 0x0000ff00) << 8) |
        (((cast(guint32)val) & 0x00ff0000) >> 8) |
        (((cast(guint32)val) & 0xff000000) >> 24);
}

template GUINT64_SWAP_LE_BE_CONSTANT(guint64 val)
{
    const guint64 GUINT64_SWAP_LE_BE_CONSTANT =
        (((cast(guint64)val) & 0x00000000000000ffL) << 56) |
        (((cast(guint64)val) & 0x000000000000ff00L) << 40) |
        (((cast(guint64)val) & 0x0000000000ff0000L) << 24) |
        (((cast(guint64)val) & 0x00000000ff000000L) << 8)  |
        (((cast(guint64)val) & 0x000000ff00000000L) >> 8)  |
        (((cast(guint64)val) & 0x0000ff0000000000L) >> 24) |
        (((cast(guint64)val) & 0x00ff000000000000L) >> 40) |
        (((cast(guint64)val) & 0xff00000000000000L) >> 56);
}


auto GINT16_TO_LE(gint16 val) {
    version(LittleEndian) return val;
    else return cast(gint16) GUINT16_SWAP_LE_BE(val);
}
auto GINT16_TO_BE(gint16 val) {
    version(BigEndian) return val;
    else return cast(gint16) GUINT16_SWAP_LE_BE(val);
}

auto GUINT16_TO_LE(guint16 val) {
    version(LittleEndian) return val;
    else return GUINT16_SWAP_LE_BE(val);
}
auto GUINT16_TO_BE(guint16 val) {
    version(BigEndian) return val;
    else return GUINT16_SWAP_LE_BE(val);
}



auto GINT32_TO_LE(gint32 val) {
    version(LittleEndian) return val;
    else return cast(gint32) GUINT32_SWAP_LE_BE(val);
}
auto GINT32_TO_BE(gint32 val) {
    version(BigEndian) return val;
    else return cast(gint32) GUINT32_SWAP_LE_BE(val);
}

auto GUINT32_TO_LE(guint32 val) {
    version(LittleEndian) return val;
    else return GUINT32_SWAP_LE_BE(val);
}
auto GUINT32_TO_BE(guint32 val) {
    version(BigEndian) return val;
    else return GUINT32_SWAP_LE_BE(val);
}



auto GINT64_TO_LE(gint64 val) {
    version(LittleEndian) return val;
    else return cast(gint64) GUINT64_SWAP_LE_BE(val);
}
auto GINT64_TO_BE(gint64 val) {
    version(BigEndian) return val;
    else return cast(gint64) GUINT64_SWAP_LE_BE(val);
}

auto GUINT64_TO_LE(guint64 val) {
    version(LittleEndian) return val;
    else return GUINT64_SWAP_LE_BE(val);
}
auto GUINT64_TO_BE(guint64 val) {
    version(BigEndian) return val;
    else return GUINT64_SWAP_LE_BE(val);
}

static if (c_ulong.sizeof == 4) {
    alias GLONG_TO_LE = GINT32_TO_LE;
    alias GLONG_TO_BE = GINT32_TO_BE;
    alias GULONG_TO_LE = GUINT32_TO_LE;
    alias GULONG_TO_BE = GUINT32_TO_BE;
}
else {
    static assert(c_ulong.sizeof == 8);
    alias GLONG_TO_LE = GINT64_TO_LE;
    alias GLONG_TO_BE = GINT64_TO_BE;
    alias GULONG_TO_LE = GUINT64_TO_LE;
    alias GULONG_TO_BE = GUINT64_TO_BE;
}

static if (size_t.sizeof == 4) {
    alias GSSIZE_TO_LE = GINT32_TO_LE;
    alias GSSIZE_TO_BE = GINT32_TO_BE;
    alias GSIZE_TO_LE = GUINT32_TO_LE;
    alias GSIZE_TO_BE = GUINT32_TO_BE;
}
else {
    static assert(size_t.sizeof == 8);
    alias GSSIZE_TO_LE = GINT64_TO_LE;
    alias GSSIZE_TO_BE = GINT64_TO_BE;
    alias GSIZE_TO_LE = GUINT64_TO_LE;
    alias GSIZE_TO_BE = GUINT64_TO_BE;
}

alias GINT_TO_LE = GINT32_TO_LE;
alias GINT_TO_BE = GINT32_TO_BE;
alias GUINT_TO_LE = GUINT32_TO_LE;
alias GUINT_TO_BE = GUINT32_TO_BE;




auto GINT16_FROM_LE(V)(V val) { return (GINT16_TO_LE (val)); }
auto GUINT16_FROM_LE(V)(V val) { return (GUINT16_TO_LE (val)); }
auto GINT16_FROM_BE(V)(V val) { return (GINT16_TO_BE (val)); }
auto GUINT16_FROM_BE(V)(V val) { return (GUINT16_TO_BE (val)); }
auto GINT32_FROM_LE(V)(V val) { return (GINT32_TO_LE (val)); }
auto GUINT32_FROM_LE(V)(V val) { return (GUINT32_TO_LE (val)); }
auto GINT32_FROM_BE(V)(V val) { return (GINT32_TO_BE (val)); }
auto GUINT32_FROM_BE(V)(V val) { return (GUINT32_TO_BE (val)); }

auto GINT64_FROM_LE(V)(V val) { return (GINT64_TO_LE (val)); }
auto GUINT64_FROM_LE(V)(V val) { return (GUINT64_TO_LE (val)); }
auto GINT64_FROM_BE(V)(V val) { return (GINT64_TO_BE (val)); }
auto GUINT64_FROM_BE(V)(V val) { return (GUINT64_TO_BE (val)); }

auto GLONG_FROM_LE(V)(V val) { return (GLONG_TO_LE (val)); }
auto GULONG_FROM_LE(V)(V val) { return (GULONG_TO_LE (val)); }
auto GLONG_FROM_BE(V)(V val) { return (GLONG_TO_BE (val)); }
auto GULONG_FROM_BE(V)(V val) { return (GULONG_TO_BE (val)); }

auto GINT_FROM_LE(V)(V val) { return (GINT_TO_LE (val)); }
auto GUINT_FROM_LE(V)(V val) { return (GUINT_TO_LE (val)); }
auto GINT_FROM_BE(V)(V val) { return (GINT_TO_BE (val)); }
auto GUINT_FROM_BE(V)(V val) { return (GUINT_TO_BE (val)); }

auto GSIZE_FROM_LE(V)(V val) { return (GSIZE_TO_LE (val)); }
auto GSSIZE_FROM_LE(V)(V val) { return (GSSIZE_TO_LE (val)); }
auto GSIZE_FROM_BE(V)(V val) { return (GSIZE_TO_BE (val)); }
auto GSSIZE_FROM_BE(V)(V val) { return (GSSIZE_TO_BE (val)); }

auto g_ntohl(V)(V val) { return (GUINT32_FROM_BE (val)); }
auto g_ntohs(V)(V val) { return (GUINT16_FROM_BE (val)); }
auto g_htonl(V)(V val) { return (GUINT32_TO_BE (val)); }
auto g_htons(V)(V val) { return (GUINT16_TO_BE (val)); }



/* IEEE Standard 754 Single Precision Storage Format (gfloat):
 *
 *        31 30           23 22            0
 * +--------+---------------+---------------+
 * | s 1bit | e[30:23] 8bit | f[22:0] 23bit |
 * +--------+---------------+---------------+
 * B0------------------->B1------->B2-->B3-->
 *
 * IEEE Standard 754 Double Precision Storage Format (gdouble):
 *
 *        63 62            52 51            32   31            0
 * +--------+----------------+----------------+ +---------------+
 * | s 1bit | e[62:52] 11bit | f[51:32] 20bit | | f[31:0] 32bit |
 * +--------+----------------+----------------+ +---------------+
 * B0--------------->B1---------->B2--->B3---->  B4->B5->B6->B7->
 */
/* subtract from biased_exponent to form base2 exponent (normal numbers) */

union GFloatIEEE754
{
    struct MPN {
        version(LittleEndian) {
            mixin(bitfields!(
                        guint, "mantissa", 23,
                        guint, "biased_exponent", 8,
                        guint, "sign", 1));
        }
        else {
            mixin(bitfields!(
                        guint, "sign", 1,
                        guint, "biased_exponent", 8,
                        guint, "mantissa", 23));
        }
    }

    gfloat v_float;
    MPN mpn;
}

union GDoubleIEEE754
{
    struct MPN {
        version(LittleEndian) {
            mixin(bitfields!(
                        guint, "mantissa_low", 32,
                        guint, "mantissa_high", 20,
                        guint, "biased_exponent", 11,
                        guint, "sign", 1));
        }
        else {
            mixin(bitfields!(
                        guint, "sign", 1,
                        guint, "biased_exponent", 11,
                        guint, "mantissa_high", 20,
                        guint, "mantissa_low", 32));
        }
    }

    gdouble v_double;
    MPN mpn;
}



enum G_IEEE754_FLOAT_BIAS = 127;
enum G_IEEE754_DOUBLE_BIAS = 1023;

enum real G_LOG_2_BASE_10 = 0.30102999566398119521;


struct GTimeVal
{
  glong tv_sec;
  glong tv_usec;
}

