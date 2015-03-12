module glib.giochannel;

import glib.gtypes;
import glib.gconvert;
import glib.gmain;
import glib.gstring;
import glib.gerror;
import glib.gunicode;
import glib.gpoll;


enum GIOError
{
  G_IO_ERROR_NONE,
  G_IO_ERROR_AGAIN,
  G_IO_ERROR_INVAL,
  G_IO_ERROR_UNKNOWN
}

//enum G_IO_CHANNEL_ERROR = g_io_channel_error_quark();

enum GIOChannelError
{
  /* Derived from errno */
  G_IO_CHANNEL_ERROR_FBIG,
  G_IO_CHANNEL_ERROR_INVAL,
  G_IO_CHANNEL_ERROR_IO,
  G_IO_CHANNEL_ERROR_ISDIR,
  G_IO_CHANNEL_ERROR_NOSPC,
  G_IO_CHANNEL_ERROR_NXIO,
  G_IO_CHANNEL_ERROR_OVERFLOW,
  G_IO_CHANNEL_ERROR_PIPE,
  /* Other */
  G_IO_CHANNEL_ERROR_FAILED
}

enum GIOStatus
{
  G_IO_STATUS_ERROR,
  G_IO_STATUS_NORMAL,
  G_IO_STATUS_EOF,
  G_IO_STATUS_AGAIN
}

enum GSeekType
{
  G_SEEK_CUR,
  G_SEEK_SET,
  G_SEEK_END
}

enum GIOFlags
{
  G_IO_FLAG_APPEND = 1 << 0,
  G_IO_FLAG_NONBLOCK = 1 << 1,
  G_IO_FLAG_IS_READABLE = 1 << 2,	/* Read only flag */
  G_IO_FLAG_IS_WRITABLE = 1 << 3,	/* Read only flag */
  G_IO_FLAG_IS_WRITEABLE = 1 << 3,      /* Misspelling in 2.29.10 and earlier */
  G_IO_FLAG_IS_SEEKABLE = 1 << 4,	/* Read only flag */
  G_IO_FLAG_MASK = (1 << 5) - 1,
  G_IO_FLAG_GET_MASK = G_IO_FLAG_MASK,
  G_IO_FLAG_SET_MASK = G_IO_FLAG_APPEND | G_IO_FLAG_NONBLOCK
}


// TODO: define GIOChannel with bitfields
struct GIOChannel;
// struct _GIOChannel
// {
//   /*< private >*/
//   gint ref_count;
//   GIOFuncs *funcs;
//
//   gchar *encoding;
//   GIConv read_cd;
//   GIConv write_cd;
//   gchar *line_term;		/* String which indicates the end of a line of text */
//   guint line_term_len;		/* So we can have null in the line term */
//
//   gsize buf_size;
//   GString *read_buf;		/* Raw data from the channel */
//   GString *encoded_read_buf;    /* Channel data converted to UTF-8 */
//   GString *write_buf;		/* Data ready to be written to the file */
//   gchar partial_write_buf[6];	/* UTF-8 partial characters, null terminated */
//
//   /* Group the flags together, immediately after partial_write_buf, to save memory */
//
//   guint use_buffer     : 1;	/* The encoding uses the buffers */
//   guint do_encode      : 1;	/* The encoding uses the GIConv coverters */
//   guint close_on_unref : 1;	/* Close the channel on final unref */
//   guint is_readable    : 1;	/* Cached GIOFlag */
//   guint is_writeable   : 1;	/* ditto */
//   guint is_seekable    : 1;	/* ditto */
//
//   gpointer reserved1;
//   gpointer reserved2;
// };

extern (C) {


    alias GIOFunc = gboolean function (GIOChannel   *source,
                     GIOCondition  condition,
                     gpointer      data);

    struct GIOFuncs
    {
        GIOStatus function (GIOChannel   *channel,
                            gchar        *buf,
                            gsize         count,
                            gsize        *bytes_read,
                            GError      **err) io_read;

        GIOStatus function (GIOChannel   *channel,
                            const gchar  *buf,
                            gsize         count,
                            gsize        *bytes_written,
                            GError      **err) io_write;

        GIOStatus function (GIOChannel   *channel,
                            gint64        offset,
                            GSeekType     type,
                            GError      **err) io_seek;

        GIOStatus function (GIOChannel   *channel,
                            GError      **err) io_close;

        GSource* function (GIOChannel   *channel,
                           GIOCondition  condition) io_create_watch;

        void function (GIOChannel   *channel) io_free;

        GIOStatus function (GIOChannel   *channel,
                            GIOFlags      flags,
                            GError      **err) io_set_flags;

        GIOFlags function (GIOChannel   *channel) io_get_flags;
    }


    void        g_io_channel_init   (GIOChannel    *channel);

    GIOChannel *g_io_channel_ref    (GIOChannel    *channel);

    void        g_io_channel_unref  (GIOChannel    *channel);

    deprecated("use g_io_channel_read_chars")
    GIOError    g_io_channel_read   (GIOChannel    *channel,
                                     gchar         *buf,
                                     gsize          count,
                                     gsize         *bytes_read);

    deprecated("use g_io_channel_write_chars")
    GIOError  g_io_channel_write    (GIOChannel    *channel,
                                     const(gchar)  *buf,
                                     gsize          count,
                                     gsize         *bytes_written);

    deprecated("use g_io_channel_seek_position")
    GIOError  g_io_channel_seek     (GIOChannel    *channel,
                                     gint64         offset,
                                     GSeekType      type);

    deprecated("use g_io_channel_shutdown")
    void      g_io_channel_close    (GIOChannel    *channel);


    GIOStatus g_io_channel_shutdown (GIOChannel      *channel,
                     gboolean         flush,
                     GError         **err);

    guint     g_io_add_watch_full   (GIOChannel      *channel,
                     gint             priority,
                     GIOCondition     condition,
                     GIOFunc          func,
                     gpointer         user_data,
                     GDestroyNotify   notify);

    GSource * g_io_create_watch     (GIOChannel      *channel,
                     GIOCondition     condition);

    guint     g_io_add_watch        (GIOChannel      *channel,
                     GIOCondition     condition,
                     GIOFunc          func,
                     gpointer         user_data);



    void                  g_io_channel_set_buffer_size      (GIOChannel   *channel,
                                 gsize         size);

    gsize                 g_io_channel_get_buffer_size      (GIOChannel   *channel);

    GIOCondition          g_io_channel_get_buffer_condition (GIOChannel   *channel);

    GIOStatus             g_io_channel_set_flags            (GIOChannel   *channel,
                                 GIOFlags      flags,
                                 GError      **error);

    GIOFlags              g_io_channel_get_flags            (GIOChannel   *channel);

    void                  g_io_channel_set_line_term        (GIOChannel   *channel,
                                 const(gchar)  *line_term,
                                 gint          length);

    const (gchar)*         g_io_channel_get_line_term        (GIOChannel   *channel,
                                 gint         *length);

    void		      g_io_channel_set_buffered		(GIOChannel   *channel,
                                 gboolean      buffered);

    gboolean	      g_io_channel_get_buffered		(GIOChannel   *channel);

    GIOStatus             g_io_channel_set_encoding         (GIOChannel   *channel,
                                 const(gchar)  *encoding,
                                 GError      **error);

    const(gchar) *         g_io_channel_get_encoding         (GIOChannel   *channel);

    void                  g_io_channel_set_close_on_unref	(GIOChannel   *channel,
                                 gboolean      do_close);

    gboolean              g_io_channel_get_close_on_unref	(GIOChannel   *channel);



    GIOStatus   g_io_channel_flush            (GIOChannel   *channel,
                           GError      **error);

    GIOStatus   g_io_channel_read_line        (GIOChannel   *channel,
                           gchar       **str_return,
                           gsize        *length,
                           gsize        *terminator_pos,
                           GError      **error);

    GIOStatus   g_io_channel_read_line_string (GIOChannel   *channel,
                           GString      *buffer,
                           gsize        *terminator_pos,
                           GError      **error);

    GIOStatus   g_io_channel_read_to_end      (GIOChannel   *channel,
                           gchar       **str_return,
                           gsize        *length,
                           GError      **error);

    GIOStatus   g_io_channel_read_chars       (GIOChannel   *channel,
                           gchar        *buf,
                           gsize         count,
                           gsize        *bytes_read,
                           GError      **error);

    GIOStatus   g_io_channel_read_unichar     (GIOChannel   *channel,
                           gunichar     *thechar,
                           GError      **error);

    GIOStatus   g_io_channel_write_chars      (GIOChannel   *channel,
                           const(gchar)  *buf,
                           gssize        count,
                           gsize        *bytes_written,
                           GError      **error);

    GIOStatus   g_io_channel_write_unichar    (GIOChannel   *channel,
                           gunichar      thechar,
                           GError      **error);

    GIOStatus   g_io_channel_seek_position    (GIOChannel   *channel,
                           gint64        offset,
                           GSeekType     type,
                           GError      **error);


    GQuark          g_io_channel_error_quark      ();

    GIOChannelError g_io_channel_error_from_errno (gint en);


    GIOChannel* g_io_channel_unix_new    (int         fd);

    gint        g_io_channel_unix_get_fd (GIOChannel *channel);


    extern __gshared GSourceFuncs g_io_watch_funcs;



    version (Win32) {



        enum G_WIN32_MSG_HANDLE = 19981206;


        void        g_io_channel_win32_make_pollfd (GIOChannel   *channel,
                                GIOCondition  condition,
                                GPollFD      *fd);

        gint        g_io_channel_win32_poll   (GPollFD    *fds,
                               gint        n_fds,
                               gint        timeout_);

        static if (GLIB_SIZEOF_VOID_P == 8) {
            GIOChannel *g_io_channel_win32_new_messages (gsize hwnd);
        }
        else {
            GIOChannel *g_io_channel_win32_new_messages (guint hwnd);
        }

        GIOChannel* g_io_channel_win32_new_fd (gint         fd);

        gint        g_io_channel_win32_get_fd (GIOChannel *channel);

        GIOChannel *g_io_channel_win32_new_socket (gint socket);

        deprecated("use g_io_channel_win32_new_socket")
        GIOChannel *g_io_channel_win32_new_stream_socket (gint socket);


        void        g_io_channel_win32_set_debug (GIOChannel *channel,
                                                  gboolean    flag);


        alias g_io_channel_new_file = g_io_channel_new_file_utf8;


        GIOChannel *g_io_channel_new_file_utf8 (const gchar  *filename,
                                                const gchar  *mode,
                                                GError      **error);
    }
    else {

        GIOChannel* g_io_channel_new_file         (const(gchar)  *filename,
                               const(gchar)  *mode,
                               GError      **error);
    }
}

