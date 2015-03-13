/*
 * Distributed under the Boost Software License, Version 1.0.
 *    (See accompanying file LICENSE_1_0.txt or copy at
 *          http://www.boost.org/LICENSE_1_0.txt)
 */
module glib.gchecksum;

import glib.gtypes;
import glib.garray;
import glib.gbytes;


enum GChecksumType {
  G_CHECKSUM_MD5,
  G_CHECKSUM_SHA1,
  G_CHECKSUM_SHA256,
  G_CHECKSUM_SHA512
}


struct GChecksum;


extern (C) {

    gssize        g_checksum_type_get_length    (GChecksumType checksum_type);


    GChecksum *   g_checksum_new                (GChecksumType checksum_type);

    void          g_checksum_reset              (GChecksum *checksum);

    GChecksum *   g_checksum_copy               (const(GChecksum) *checksum);

    void          g_checksum_free               (GChecksum *checksum);

    void          g_checksum_update             (GChecksum *checksum,
                                                 const(guchar) *data,
                                                 gssize length);

    const(gchar) * g_checksum_get_string         (GChecksum *checksum);

    void          g_checksum_get_digest         (GChecksum *checksum,
                                                 guint8 *buffer,
                                                 gsize *digest_len);


    gchar        *g_compute_checksum_for_data   (GChecksumType checksum_type,
                                                 const(guchar) *data,
                                                 gsize length);

    gchar        *g_compute_checksum_for_string (GChecksumType checksum_type,
                                                 const(gchar) *str,
                                                 gssize length);


    gchar        *g_compute_checksum_for_bytes  (GChecksumType checksum_type,
                                                 GBytes *data);
}
