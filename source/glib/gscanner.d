/*
 * Distributed under the Boost Software License, Version 1.0.
 *    (See accompanying file LICENSE_1_0.txt or copy at
 *          http://www.boost.org/LICENSE_1_0.txt)
 */
module glib.gscanner;

import glib.gtypes;
import glib.gdataset;
import glib.ghash;



extern (C)
alias GScannerMsgFunc = void function (GScanner      *scanner,
						 gchar	       *message,
						 gboolean	error);

enum G_CSET_A_2_Z = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
enum G_CSET_a_2_z = "abcdefghijklmnopqrstuvwxyz";
enum G_CSET_DIGITS = "0123456789";
enum G_CSET_LATINC = "\300\301\302\303\304\305\306" ~
			"\307\310\311\312\313\314\315\316\317\320" ~
			"\321\322\323\324\325\326" ~
			"\330\331\332\333\334\335\336";

enum G_CSET_LATINS = "\337\340\341\342\343\344\345\346" ~
			"\347\350\351\352\353\354\355\356\357\360" ~
			"\361\362\363\364\365\366" ~
			"\370\371\372\373\374\375\376\377";

enum GErrorType
{
  G_ERR_UNKNOWN,
  G_ERR_UNEXP_EOF,
  G_ERR_UNEXP_EOF_IN_STRING,
  G_ERR_UNEXP_EOF_IN_COMMENT,
  G_ERR_NON_DIGIT_IN_CONST,
  G_ERR_DIGIT_RADIX,
  G_ERR_FLOAT_RADIX,
  G_ERR_FLOAT_MALFORMED
}

enum GTokenType
{
  G_TOKEN_EOF			=   0,

  G_TOKEN_LEFT_PAREN		= '(',
  G_TOKEN_RIGHT_PAREN		= ')',
  G_TOKEN_LEFT_CURLY		= '{',
  G_TOKEN_RIGHT_CURLY		= '}',
  G_TOKEN_LEFT_BRACE		= '[',
  G_TOKEN_RIGHT_BRACE		= ']',
  G_TOKEN_EQUAL_SIGN		= '=',
  G_TOKEN_COMMA			= ',',

  G_TOKEN_NONE			= 256,

  G_TOKEN_ERROR,

  G_TOKEN_CHAR,
  G_TOKEN_BINARY,
  G_TOKEN_OCTAL,
  G_TOKEN_INT,
  G_TOKEN_HEX,
  G_TOKEN_FLOAT,
  G_TOKEN_STRING,

  G_TOKEN_SYMBOL,
  G_TOKEN_IDENTIFIER,
  G_TOKEN_IDENTIFIER_NULL,

  G_TOKEN_COMMENT_SINGLE,
  G_TOKEN_COMMENT_MULTI,

  /*< private >*/
  G_TOKEN_LAST
}

union GTokenValue
{
  gpointer	v_symbol;
  gchar		*v_identifier;
  gulong	v_binary;
  gulong	v_octal;
  gulong	v_int;
  guint64       v_int64;
  gdouble	v_float;
  gulong	v_hex;
  gchar		*v_string;
  gchar		*v_comment;
  guchar	v_char;
  guint		v_error;
}

struct GScannerConfig;
// struct GScannerConfig
// {
//   /* Character sets
//    */
//   gchar		*cset_skip_characters;		/* default: " \t\n" */
//   gchar		*cset_identifier_first;
//   gchar		*cset_identifier_nth;
//   gchar		*cpair_comment_single;		/* default: "#\n" */
//
//   /* Should symbol lookup work case sensitive?
//    */
//   guint		case_sensitive : 1;
//
//   /* Boolean values to be adjusted "on the fly"
//    * to configure scanning behaviour.
//    */
//   guint		skip_comment_multi : 1;		/* C like comment */
//   guint		skip_comment_single : 1;	/* single line comment */
//   guint		scan_comment_multi : 1;		/* scan multi line comments? */
//   guint		scan_identifier : 1;
//   guint		scan_identifier_1char : 1;
//   guint		scan_identifier_NULL : 1;
//   guint		scan_symbols : 1;
//   guint		scan_binary : 1;
//   guint		scan_octal : 1;
//   guint		scan_float : 1;
//   guint		scan_hex : 1;			/* '0x0ff0' */
//   guint		scan_hex_dollar : 1;		/* '$0ff0' */
//   guint		scan_string_sq : 1;		/* string: 'anything' */
//   guint		scan_string_dq : 1;		/* string: "\\-escapes!\n" */
//   guint		numbers_2_int : 1;		/* bin, octal, hex => int */
//   guint		int_2_float : 1;		/* int => G_TOKEN_FLOAT? */
//   guint		identifier_2_string : 1;
//   guint		char_2_token : 1;		/* return G_TOKEN_CHAR? */
//   guint		symbol_2_token : 1;
//   guint		scope_0_fallback : 1;		/* try scope 0 on lookups? */
//   guint		store_int64 : 1; 		/* use value.v_int64 rather than v_int */
//
//   /*< private >*/
//   guint		padding_dummy;
// }


struct	GScanner
{
  /* unused fields */
  gpointer		user_data;
  guint			max_parse_errors;

  /* g_scanner_error() increments this field */
  guint			parse_errors;

  /* name of input stream, featured by the default message handler */
  const(gchar)		*input_name;

  /* quarked data */
  GData			*qdata;

  /* link into the scanner configuration */
  GScannerConfig	*config;

  /* fields filled in after g_scanner_get_next_token() */
  GTokenType		token;
  GTokenValue		value;
  guint			line;
  guint			position;

  /* fields filled in after g_scanner_peek_next_token() */
  GTokenType		next_token;
  GTokenValue		next_value;
  guint			next_line;
  guint			next_position;

  /*< private >*/
  /* to be considered private */
  GHashTable		*symbol_table;
  gint			input_fd;
  const(gchar)		*text;
  const(gchar)		*text_end;
  gchar			*buffer;
  guint			scope_id;

  /*< public >*/
  /* handler function for _warn and _error */
  GScannerMsgFunc	msg_handler;
}


extern (C) {

    GScanner*	g_scanner_new			(const(GScannerConfig) *config_templ);

    void		g_scanner_destroy		(GScanner	*scanner);

    void		g_scanner_input_file		(GScanner	*scanner,
                             gint		input_fd);

    void		g_scanner_sync_file_offset	(GScanner	*scanner);

    void		g_scanner_input_text		(GScanner	*scanner,
                             const(gchar)	*text,
                             guint		text_len);

    GTokenType	g_scanner_get_next_token	(GScanner	*scanner);

    GTokenType	g_scanner_peek_next_token	(GScanner	*scanner);

    GTokenType	g_scanner_cur_token		(GScanner	*scanner);

    GTokenValue	g_scanner_cur_value		(GScanner	*scanner);

    guint		g_scanner_cur_line		(GScanner	*scanner);

    guint		g_scanner_cur_position		(GScanner	*scanner);

    gboolean	g_scanner_eof			(GScanner	*scanner);

    guint		g_scanner_set_scope		(GScanner	*scanner,
                             guint		 scope_id);

    void		g_scanner_scope_add_symbol	(GScanner	*scanner,
                             guint		 scope_id,
                             const(gchar)	*symbol,
                             gpointer	value);

    void		g_scanner_scope_remove_symbol	(GScanner	*scanner,
                             guint		 scope_id,
                             const(gchar)	*symbol);

    gpointer	g_scanner_scope_lookup_symbol	(GScanner	*scanner,
                             guint		 scope_id,
                             const(gchar)	*symbol);

    void		g_scanner_scope_foreach_symbol	(GScanner	*scanner,
                             guint		 scope_id,
                             GHFunc		 func,
                             gpointer	 user_data);

    gpointer	g_scanner_lookup_symbol		(GScanner	*scanner,
                             const(gchar)	*symbol);

    void		g_scanner_unexp_token		(GScanner	*scanner,
                             GTokenType	expected_token,
                             const(gchar)	*identifier_spec,
                             const(gchar)	*symbol_spec,
                             const(gchar)	*symbol_name,
                             const(gchar)	*message,
                             gint		 is_error);

    void		g_scanner_error			(GScanner	*scanner,
                             const(gchar)	*format,
                             ...);

    void		g_scanner_warn			(GScanner	*scanner,
                             const(gchar)	*format,
                             ...);

}

