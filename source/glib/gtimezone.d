module glib.gtimezone;

import glib.gtypes;


struct GTimeZone;

enum GTimeType
{
  G_TIME_TYPE_STANDARD,
  G_TIME_TYPE_DAYLIGHT,
  G_TIME_TYPE_UNIVERSAL
}

extern (C) {

    GTimeZone *     g_time_zone_new              (const(gchar)*identifier);

    GTimeZone *     g_time_zone_new_utc          ();

    GTimeZone *     g_time_zone_new_local        ();


    GTimeZone *     g_time_zone_ref              (GTimeZone   *tz);

    void            g_time_zone_unref            (GTimeZone   *tz);


    gint            g_time_zone_find_interval    (GTimeZone   *tz,
                                                  GTimeType    type,
                                                  gint64       time_);


    gint            g_time_zone_adjust_time      (GTimeZone   *tz,
                                                  GTimeType    type,
                                                  gint64      *time_);

    const(gchar) *  g_time_zone_get_abbreviation (GTimeZone   *tz,
                                                  gint         interval);

    gint32          g_time_zone_get_offset       (GTimeZone   *tz,
                                                  gint         interval);

    gboolean        g_time_zone_is_dst           (GTimeZone   *tz,
                                                  gint         interval);

}

