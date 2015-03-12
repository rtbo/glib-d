module glib.ghmac;

import glib.gtypes;
import glib.gchecksum;

struct GHmac;


extern (C) {


    GHmac *        g_hmac_new                    (GChecksumType  digest_type,
                                                  const(guchar) *key,
                                                  gsize          key_len);

    GHmac *        g_hmac_copy                   (const(GHmac)  *hmac);

    GHmac *        g_hmac_ref                    (GHmac         *hmac);

    void           g_hmac_unref                  (GHmac         *hmac);

    void           g_hmac_update                 (GHmac         *hmac,
                                                  const(guchar) *data,
                                                  gssize         length);

    const(gchar) * g_hmac_get_string             (GHmac         *hmac);

    void           g_hmac_get_digest             (GHmac         *hmac,
                                                  guint8        *buffer,
                                                  gsize         *digest_len);


    gchar         *g_compute_hmac_for_data       (GChecksumType  digest_type,
                                                  const(guchar) *key,
                                                  gsize          key_len,
                                                  const(guchar) *data,
                                                  gsize          length);

    gchar         *g_compute_hmac_for_string     (GChecksumType  digest_type,
                                                  const(guchar) *key,
                                                  gsize          key_len,
                                                  const(gchar)  *str,
                                                  gssize         length);
}

