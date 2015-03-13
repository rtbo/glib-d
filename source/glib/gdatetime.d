/*
 * Distributed under the Boost Software License, Version 1.0.
 *    (See accompanying file LICENSE_1_0.txt or copy at
 *          http://www.boost.org/LICENSE_1_0.txt)
 */
module glib.gdatetime;

import glib.gtypes;
import glib.gtimezone;



enum gint64 G_TIME_SPAN_DAY         = 86400000000;
enum gint64 G_TIME_SPAN_HOUR        = 3600000000;
enum gint64 G_TIME_SPAN_MINUTE      = 60000000;
enum gint64 G_TIME_SPAN_SECOND      = 1000000;
enum gint64 G_TIME_SPAN_MILLISECOND = 1000;

alias GTimeSpan = gint64;

struct GDateTime;


extern (C) {

void           g_date_time_unref                     (GDateTime      *datetime);

GDateTime *    g_date_time_ref                       (GDateTime      *datetime);


GDateTime *    g_date_time_new_now                   (GTimeZone      *tz);

GDateTime *    g_date_time_new_now_local             ();

GDateTime *    g_date_time_new_now_utc               ();


GDateTime *    g_date_time_new_from_unix_local       (gint64          t);

GDateTime *    g_date_time_new_from_unix_utc         (gint64          t);


GDateTime *    g_date_time_new_from_timeval_local    (const(GTimeVal)*tv);

GDateTime *    g_date_time_new_from_timeval_utc      (const(GTimeVal)*tv);


GDateTime *    g_date_time_new                       (GTimeZone      *tz,
                                                      gint            year,
                                                      gint            month,
                                                      gint            day,
                                                      gint            hour,
                                                      gint            minute,
                                                      gdouble         seconds);

GDateTime *    g_date_time_new_local                 (gint            year,
                                                      gint            month,
                                                      gint            day,
                                                      gint            hour,
                                                      gint            minute,
                                                      gdouble         seconds);

GDateTime *    g_date_time_new_utc                   (gint            year,
                                                      gint            month,
                                                      gint            day,
                                                      gint            hour,
                                                      gint            minute,
                                                      gdouble         seconds);


GDateTime *    g_date_time_add                       (GDateTime      *datetime,
                                                      GTimeSpan       timespan);


GDateTime *    g_date_time_add_years                 (GDateTime      *datetime,
                                                      gint            years);

GDateTime *    g_date_time_add_months                (GDateTime      *datetime,
                                                      gint            months);

GDateTime *    g_date_time_add_weeks                 (GDateTime      *datetime,
                                                      gint            weeks);

GDateTime *    g_date_time_add_days                  (GDateTime      *datetime,
                                                      gint            days);


GDateTime *    g_date_time_add_hours                 (GDateTime      *datetime,
                                                      gint            hours);

GDateTime *    g_date_time_add_minutes               (GDateTime      *datetime,
                                                      gint            minutes);

GDateTime *    g_date_time_add_seconds               (GDateTime      *datetime,
                                                      gdouble         seconds);


GDateTime *    g_date_time_add_full                  (GDateTime      *datetime,
                                                      gint            years,
                                                      gint            months,
                                                      gint            days,
                                                      gint            hours,
                                                      gint            minutes,
                                                      gdouble         seconds);


gint           g_date_time_compare                   (gconstpointer   dt1,
                                                      gconstpointer   dt2);

GTimeSpan      g_date_time_difference                (GDateTime      *end,
                                                       GDateTime      *begin);

guint          g_date_time_hash                      (gconstpointer   datetime);

gboolean       g_date_time_equal                     (gconstpointer   dt1,
                                                      gconstpointer   dt2);


void           g_date_time_get_ymd                   (GDateTime      *datetime,
                                                      gint           *year,
                                                      gint           *month,
                                                      gint           *day);


gint           g_date_time_get_year                  (GDateTime      *datetime);

gint           g_date_time_get_month                 (GDateTime      *datetime);

gint           g_date_time_get_day_of_month          (GDateTime      *datetime);


gint           g_date_time_get_week_numbering_year   (GDateTime      *datetime);

gint           g_date_time_get_week_of_year          (GDateTime      *datetime);

gint           g_date_time_get_day_of_week           (GDateTime      *datetime);


gint           g_date_time_get_day_of_year           (GDateTime      *datetime);


gint           g_date_time_get_hour                  (GDateTime      *datetime);

gint           g_date_time_get_minute                (GDateTime      *datetime);

gint           g_date_time_get_second                (GDateTime      *datetime);

gint           g_date_time_get_microsecond           (GDateTime      *datetime);

gdouble        g_date_time_get_seconds               (GDateTime      *datetime);


gint64         g_date_time_to_unix                   (GDateTime      *datetime);

gboolean       g_date_time_to_timeval                (GDateTime      *datetime,
                                                      GTimeVal       *tv);


GTimeSpan      g_date_time_get_utc_offset            (GDateTime      *datetime);

const(gchar) * g_date_time_get_timezone_abbreviation (GDateTime      *datetime);

gboolean       g_date_time_is_daylight_savings       (GDateTime      *datetime);


GDateTime *    g_date_time_to_timezone               (GDateTime      *datetime,
                                                      GTimeZone      *tz);

GDateTime *    g_date_time_to_local                  (GDateTime      *datetime);

GDateTime *    g_date_time_to_utc                    (GDateTime      *datetime);


gchar *        g_date_time_format                    (GDateTime      *datetime,
                                                      const(gchar)   *format);

}

