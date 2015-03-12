module glib.gpattern;

import glib.gtypes;


struct GPatternSpec;

extern (C) {

    GPatternSpec* g_pattern_spec_new       (const(gchar)  *pattern);

    void          g_pattern_spec_free      (GPatternSpec *pspec);

    gboolean      g_pattern_spec_equal     (GPatternSpec *pspec1,
                        GPatternSpec *pspec2);

    gboolean      g_pattern_match          (GPatternSpec *pspec,
                        guint         string_length,
                        const(gchar)  *str,
                        const(gchar)  *string_reversed);

    gboolean      g_pattern_match_string   (GPatternSpec *pspec,
                        const(gchar)  *str);

    gboolean      g_pattern_match_simple   (const(gchar)  *pattern,
                        const(gchar)  *str);

}

