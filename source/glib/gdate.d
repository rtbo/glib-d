/*
 * Distributed under the Boost Software License, Version 1.0.
 *    (See accompanying file LICENSE_1_0.txt or copy at
 *          http://www.boost.org/LICENSE_1_0.txt)
 */
module glib.gdate;

import glib.gtypes;
import glib.gquark;

import core.stdc.time;
import std.bitmanip;


alias GTime = gint32;
alias GDateYear = guint16;
alias GDateDay = guint8;

enum GDateDMY
{
  G_DATE_DAY   = 0,
  G_DATE_MONTH = 1,
  G_DATE_YEAR  = 2
}

enum GDateWeekday
{
  G_DATE_BAD_WEEKDAY  = 0,
  G_DATE_MONDAY       = 1,
  G_DATE_TUESDAY      = 2,
  G_DATE_WEDNESDAY    = 3,
  G_DATE_THURSDAY     = 4,
  G_DATE_FRIDAY       = 5,
  G_DATE_SATURDAY     = 6,
  G_DATE_SUNDAY       = 7
}

enum GDateMonth
{
  G_DATE_BAD_MONTH = 0,
  G_DATE_JANUARY   = 1,
  G_DATE_FEBRUARY  = 2,
  G_DATE_MARCH     = 3,
  G_DATE_APRIL     = 4,
  G_DATE_MAY       = 5,
  G_DATE_JUNE      = 6,
  G_DATE_JULY      = 7,
  G_DATE_AUGUST    = 8,
  G_DATE_SEPTEMBER = 9,
  G_DATE_OCTOBER   = 10,
  G_DATE_NOVEMBER  = 11,
  G_DATE_DECEMBER  = 12
}

enum uint G_DATE_BAD_JULIAN = 0;
enum uint G_DATE_BAD_DAY = 0;
enum uint G_DATE_BAD_YEAR = 0;


struct GDate
{
    mixin(bitfields!(
                guint, "julian_days", 32,
                guint, "julian", 1,
                guint, "dmy", 1,
                guint, "day", 6,
                guint, "month", 4,
                guint, "year", 16,
                guint, "", 4));

};

extern (C) {

    GDate*       g_date_new                   ();

    GDate*       g_date_new_dmy               (GDateDay     day,
                                               GDateMonth   month,
                                               GDateYear    year);

    GDate*       g_date_new_julian            (guint32      julian_day);

    void         g_date_free                  (GDate       *date);

    /* check g_date_valid() after doing an operation that might fail, like
     * _parse.  Almost all g_date operations are undefined on invalid
     * dates (the exceptions are the mutators, since you need those to
     * return to validity).
     */

    gboolean     g_date_valid                 (const(GDate)* date);

    gboolean     g_date_valid_day             (GDateDay     day);

    gboolean     g_date_valid_month           (GDateMonth month);

    gboolean     g_date_valid_year            (GDateYear  year);

    gboolean     g_date_valid_weekday         (GDateWeekday weekday);

    gboolean     g_date_valid_julian          (guint32 julian_date);

    gboolean     g_date_valid_dmy             (GDateDay     day,
                                               GDateMonth   month,
                                               GDateYear    year);


    GDateWeekday g_date_get_weekday           (const(GDate) *date);

    GDateMonth   g_date_get_month             (const(GDate) *date);

    GDateYear    g_date_get_year              (const(GDate) *date);

    GDateDay     g_date_get_day               (const(GDate) *date);

    guint32      g_date_get_julian            (const(GDate) *date);

    guint        g_date_get_day_of_year       (const(GDate) *date);
    /* First monday/sunday is the start of week 1; if we haven't reached
     * that day, return 0. These are not ISO weeks of the year; that
     * routine needs to be added.
     * these functions return the number of weeks, starting on the
     * corrsponding day
     */

    guint        g_date_get_monday_week_of_year (const(GDate) *date);

    guint        g_date_get_sunday_week_of_year (const(GDate) *date);

    guint        g_date_get_iso8601_week_of_year (const(GDate) *date);

    /* If you create a static date struct you need to clear it to get it
     * in a sane state before use. You can clear a whole array at
     * once with the ndates argument.
     */

    void         g_date_clear                 (GDate       *date,
                                               guint        n_dates);

    /* The parse routine is meant for dates typed in by a user, so it
     * permits many formats but tries to catch common typos. If your data
     * needs to be strictly validated, it is not an appropriate function.
     */

    void         g_date_set_parse             (GDate       *date,
                                               const(gchar) *str);

    void         g_date_set_time_t            (GDate       *date,
                           time_t       timet);

    void         g_date_set_time_val          (GDate       *date,
                           GTimeVal    *timeval);

    deprecated("use g_date_set_time_t")
    void         g_date_set_time              (GDate       *date,
                                               GTime        time_);

    void         g_date_set_month             (GDate       *date,
                                               GDateMonth   month);

    void         g_date_set_day               (GDate       *date,
                                               GDateDay     day);

    void         g_date_set_year              (GDate       *date,
                                               GDateYear    year);

    void         g_date_set_dmy               (GDate       *date,
                                               GDateDay     day,
                                               GDateMonth   month,
                                               GDateYear    y);

    void         g_date_set_julian            (GDate       *date,
                                               guint32      julian_date);

    gboolean     g_date_is_first_of_month     (const(GDate) *date);

    gboolean     g_date_is_last_of_month      (const(GDate) *date);

    /* To go forward by some number of weeks just go forward weeks*7 days */

    void         g_date_add_days              (GDate       *date,
                                               guint        n_days);

    void         g_date_subtract_days         (GDate       *date,
                                               guint        n_days);

    /* If you add/sub months while day > 28, the day might change */

    void         g_date_add_months            (GDate       *date,
                                               guint        n_months);

    void         g_date_subtract_months       (GDate       *date,
                                               guint        n_months);

    /* If it's feb 29, changing years can move you to the 28th */

    void         g_date_add_years             (GDate       *date,
                                               guint        n_years);

    void         g_date_subtract_years        (GDate       *date,
                                               guint        n_years);

    gboolean     g_date_is_leap_year          (GDateYear    year);

    guint8       g_date_get_days_in_month     (GDateMonth   month,
                                               GDateYear    year);

    guint8       g_date_get_monday_weeks_in_year  (GDateYear    year);

    guint8       g_date_get_sunday_weeks_in_year  (GDateYear    year);

    /* Returns the number of days between the two dates.  If date2 comes
       before date1, a negative value is return. */

    gint         g_date_days_between          (const(GDate) *date1,
                           const(GDate) *date2);

    /* qsort-friendly (with a cast...) */

    gint         g_date_compare               (const(GDate) *lhs,
                                               const(GDate) *rhs);

    void         g_date_to_struct_tm          (const(GDate) *date,
                                               tm   *tm_);


    void         g_date_clamp                 (GDate *date,
                           const(GDate) *min_date,
                           const(GDate) *max_date);

    /* Swap date1 and date2's values if date1 > date2. */

    void         g_date_order                 (GDate *date1, GDate *date2);

    /* Just like strftime() except you can only use date-related formats.
     *   Using a time format is undefined.
     */

    gsize        g_date_strftime              (gchar       *s,
                                               gsize        slen,
                                               const(gchar) *format,
                                               const(GDate) *date);
}

