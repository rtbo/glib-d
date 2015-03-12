module glib.gtimer;

import glib.gtypes;


struct GTimer;

enum G_USEC_PER_SEC = 1000000;

extern (C) {


    GTimer*  g_timer_new	         ();

    void	 g_timer_destroy         (GTimer      *timer);

    void	 g_timer_start	         (GTimer      *timer);

    void	 g_timer_stop	         (GTimer      *timer);

    void	 g_timer_reset	         (GTimer      *timer);

    void	 g_timer_continue        (GTimer      *timer);

    gdouble  g_timer_elapsed         (GTimer      *timer,
                      gulong      *microseconds);


    void     g_usleep                (gulong       microseconds);


    void     g_time_val_add          (GTimeVal    *time_,
                                      glong        microseconds);

    gboolean g_time_val_from_iso8601 (const(gchar) *iso_date,
                      GTimeVal    *time_);

    gchar*   g_time_val_to_iso8601   (GTimeVal    *time_);

}

