module glib.gunicode;

import glib.gtypes;
import glib.gerror;


alias gunichar = dchar;
alias gunichar2 = wchar;


enum GUnicodeType
{
  G_UNICODE_CONTROL,
  G_UNICODE_FORMAT,
  G_UNICODE_UNASSIGNED,
  G_UNICODE_PRIVATE_USE,
  G_UNICODE_SURROGATE,
  G_UNICODE_LOWERCASE_LETTER,
  G_UNICODE_MODIFIER_LETTER,
  G_UNICODE_OTHER_LETTER,
  G_UNICODE_TITLECASE_LETTER,
  G_UNICODE_UPPERCASE_LETTER,
  G_UNICODE_SPACING_MARK,
  G_UNICODE_ENCLOSING_MARK,
  G_UNICODE_NON_SPACING_MARK,
  G_UNICODE_DECIMAL_NUMBER,
  G_UNICODE_LETTER_NUMBER,
  G_UNICODE_OTHER_NUMBER,
  G_UNICODE_CONNECT_PUNCTUATION,
  G_UNICODE_DASH_PUNCTUATION,
  G_UNICODE_CLOSE_PUNCTUATION,
  G_UNICODE_FINAL_PUNCTUATION,
  G_UNICODE_INITIAL_PUNCTUATION,
  G_UNICODE_OTHER_PUNCTUATION,
  G_UNICODE_OPEN_PUNCTUATION,
  G_UNICODE_CURRENCY_SYMBOL,
  G_UNICODE_MODIFIER_SYMBOL,
  G_UNICODE_MATH_SYMBOL,
  G_UNICODE_OTHER_SYMBOL,
  G_UNICODE_LINE_SEPARATOR,
  G_UNICODE_PARAGRAPH_SEPARATOR,
  G_UNICODE_SPACE_SEPARATOR
}

enum GUnicodeBreakType
{
  G_UNICODE_BREAK_MANDATORY,
  G_UNICODE_BREAK_CARRIAGE_RETURN,
  G_UNICODE_BREAK_LINE_FEED,
  G_UNICODE_BREAK_COMBINING_MARK,
  G_UNICODE_BREAK_SURROGATE,
  G_UNICODE_BREAK_ZERO_WIDTH_SPACE,
  G_UNICODE_BREAK_INSEPARABLE,
  G_UNICODE_BREAK_NON_BREAKING_GLUE,
  G_UNICODE_BREAK_CONTINGENT,
  G_UNICODE_BREAK_SPACE,
  G_UNICODE_BREAK_AFTER,
  G_UNICODE_BREAK_BEFORE,
  G_UNICODE_BREAK_BEFORE_AND_AFTER,
  G_UNICODE_BREAK_HYPHEN,
  G_UNICODE_BREAK_NON_STARTER,
  G_UNICODE_BREAK_OPEN_PUNCTUATION,
  G_UNICODE_BREAK_CLOSE_PUNCTUATION,
  G_UNICODE_BREAK_QUOTATION,
  G_UNICODE_BREAK_EXCLAMATION,
  G_UNICODE_BREAK_IDEOGRAPHIC,
  G_UNICODE_BREAK_NUMERIC,
  G_UNICODE_BREAK_INFIX_SEPARATOR,
  G_UNICODE_BREAK_SYMBOL,
  G_UNICODE_BREAK_ALPHABETIC,
  G_UNICODE_BREAK_PREFIX,
  G_UNICODE_BREAK_POSTFIX,
  G_UNICODE_BREAK_COMPLEX_CONTEXT,
  G_UNICODE_BREAK_AMBIGUOUS,
  G_UNICODE_BREAK_UNKNOWN,
  G_UNICODE_BREAK_NEXT_LINE,
  G_UNICODE_BREAK_WORD_JOINER,
  G_UNICODE_BREAK_HANGUL_L_JAMO,
  G_UNICODE_BREAK_HANGUL_V_JAMO,
  G_UNICODE_BREAK_HANGUL_T_JAMO,
  G_UNICODE_BREAK_HANGUL_LV_SYLLABLE,
  G_UNICODE_BREAK_HANGUL_LVT_SYLLABLE,
  G_UNICODE_BREAK_CLOSE_PARANTHESIS,
  G_UNICODE_BREAK_CONDITIONAL_JAPANESE_STARTER,
  G_UNICODE_BREAK_HEBREW_LETTER,
  G_UNICODE_BREAK_REGIONAL_INDICATOR
}

enum GUnicodeScript
{                         /* ISO 15924 code */
  G_UNICODE_SCRIPT_INVALID_CODE = -1,
  G_UNICODE_SCRIPT_COMMON       = 0,   /* Zyyy */
  G_UNICODE_SCRIPT_INHERITED,          /* Zinh (Qaai) */
  G_UNICODE_SCRIPT_ARABIC,             /* Arab */
  G_UNICODE_SCRIPT_ARMENIAN,           /* Armn */
  G_UNICODE_SCRIPT_BENGALI,            /* Beng */
  G_UNICODE_SCRIPT_BOPOMOFO,           /* Bopo */
  G_UNICODE_SCRIPT_CHEROKEE,           /* Cher */
  G_UNICODE_SCRIPT_COPTIC,             /* Copt (Qaac) */
  G_UNICODE_SCRIPT_CYRILLIC,           /* Cyrl (Cyrs) */
  G_UNICODE_SCRIPT_DESERET,            /* Dsrt */
  G_UNICODE_SCRIPT_DEVANAGARI,         /* Deva */
  G_UNICODE_SCRIPT_ETHIOPIC,           /* Ethi */
  G_UNICODE_SCRIPT_GEORGIAN,           /* Geor (Geon, Geoa) */
  G_UNICODE_SCRIPT_GOTHIC,             /* Goth */
  G_UNICODE_SCRIPT_GREEK,              /* Grek */
  G_UNICODE_SCRIPT_GUJARATI,           /* Gujr */
  G_UNICODE_SCRIPT_GURMUKHI,           /* Guru */
  G_UNICODE_SCRIPT_HAN,                /* Hani */
  G_UNICODE_SCRIPT_HANGUL,             /* Hang */
  G_UNICODE_SCRIPT_HEBREW,             /* Hebr */
  G_UNICODE_SCRIPT_HIRAGANA,           /* Hira */
  G_UNICODE_SCRIPT_KANNADA,            /* Knda */
  G_UNICODE_SCRIPT_KATAKANA,           /* Kana */
  G_UNICODE_SCRIPT_KHMER,              /* Khmr */
  G_UNICODE_SCRIPT_LAO,                /* Laoo */
  G_UNICODE_SCRIPT_LATIN,              /* Latn (Latf, Latg) */
  G_UNICODE_SCRIPT_MALAYALAM,          /* Mlym */
  G_UNICODE_SCRIPT_MONGOLIAN,          /* Mong */
  G_UNICODE_SCRIPT_MYANMAR,            /* Mymr */
  G_UNICODE_SCRIPT_OGHAM,              /* Ogam */
  G_UNICODE_SCRIPT_OLD_ITALIC,         /* Ital */
  G_UNICODE_SCRIPT_ORIYA,              /* Orya */
  G_UNICODE_SCRIPT_RUNIC,              /* Runr */
  G_UNICODE_SCRIPT_SINHALA,            /* Sinh */
  G_UNICODE_SCRIPT_SYRIAC,             /* Syrc (Syrj, Syrn, Syre) */
  G_UNICODE_SCRIPT_TAMIL,              /* Taml */
  G_UNICODE_SCRIPT_TELUGU,             /* Telu */
  G_UNICODE_SCRIPT_THAANA,             /* Thaa */
  G_UNICODE_SCRIPT_THAI,               /* Thai */
  G_UNICODE_SCRIPT_TIBETAN,            /* Tibt */
  G_UNICODE_SCRIPT_CANADIAN_ABORIGINAL, /* Cans */
  G_UNICODE_SCRIPT_YI,                 /* Yiii */
  G_UNICODE_SCRIPT_TAGALOG,            /* Tglg */
  G_UNICODE_SCRIPT_HANUNOO,            /* Hano */
  G_UNICODE_SCRIPT_BUHID,              /* Buhd */
  G_UNICODE_SCRIPT_TAGBANWA,           /* Tagb */

  /* Unicode-4.0 additions */
  G_UNICODE_SCRIPT_BRAILLE,            /* Brai */
  G_UNICODE_SCRIPT_CYPRIOT,            /* Cprt */
  G_UNICODE_SCRIPT_LIMBU,              /* Limb */
  G_UNICODE_SCRIPT_OSMANYA,            /* Osma */
  G_UNICODE_SCRIPT_SHAVIAN,            /* Shaw */
  G_UNICODE_SCRIPT_LINEAR_B,           /* Linb */
  G_UNICODE_SCRIPT_TAI_LE,             /* Tale */
  G_UNICODE_SCRIPT_UGARITIC,           /* Ugar */

  /* Unicode-4.1 additions */
  G_UNICODE_SCRIPT_NEW_TAI_LUE,        /* Talu */
  G_UNICODE_SCRIPT_BUGINESE,           /* Bugi */
  G_UNICODE_SCRIPT_GLAGOLITIC,         /* Glag */
  G_UNICODE_SCRIPT_TIFINAGH,           /* Tfng */
  G_UNICODE_SCRIPT_SYLOTI_NAGRI,       /* Sylo */
  G_UNICODE_SCRIPT_OLD_PERSIAN,        /* Xpeo */
  G_UNICODE_SCRIPT_KHAROSHTHI,         /* Khar */

  /* Unicode-5.0 additions */
  G_UNICODE_SCRIPT_UNKNOWN,            /* Zzzz */
  G_UNICODE_SCRIPT_BALINESE,           /* Bali */
  G_UNICODE_SCRIPT_CUNEIFORM,          /* Xsux */
  G_UNICODE_SCRIPT_PHOENICIAN,         /* Phnx */
  G_UNICODE_SCRIPT_PHAGS_PA,           /* Phag */
  G_UNICODE_SCRIPT_NKO,                /* Nkoo */

  /* Unicode-5.1 additions */
  G_UNICODE_SCRIPT_KAYAH_LI,           /* Kali */
  G_UNICODE_SCRIPT_LEPCHA,             /* Lepc */
  G_UNICODE_SCRIPT_REJANG,             /* Rjng */
  G_UNICODE_SCRIPT_SUNDANESE,          /* Sund */
  G_UNICODE_SCRIPT_SAURASHTRA,         /* Saur */
  G_UNICODE_SCRIPT_CHAM,               /* Cham */
  G_UNICODE_SCRIPT_OL_CHIKI,           /* Olck */
  G_UNICODE_SCRIPT_VAI,                /* Vaii */
  G_UNICODE_SCRIPT_CARIAN,             /* Cari */
  G_UNICODE_SCRIPT_LYCIAN,             /* Lyci */
  G_UNICODE_SCRIPT_LYDIAN,             /* Lydi */

  /* Unicode-5.2 additions */
  G_UNICODE_SCRIPT_AVESTAN,                /* Avst */
  G_UNICODE_SCRIPT_BAMUM,                  /* Bamu */
  G_UNICODE_SCRIPT_EGYPTIAN_HIEROGLYPHS,   /* Egyp */
  G_UNICODE_SCRIPT_IMPERIAL_ARAMAIC,       /* Armi */
  G_UNICODE_SCRIPT_INSCRIPTIONAL_PAHLAVI,  /* Phli */
  G_UNICODE_SCRIPT_INSCRIPTIONAL_PARTHIAN, /* Prti */
  G_UNICODE_SCRIPT_JAVANESE,               /* Java */
  G_UNICODE_SCRIPT_KAITHI,                 /* Kthi */
  G_UNICODE_SCRIPT_LISU,                   /* Lisu */
  G_UNICODE_SCRIPT_MEETEI_MAYEK,           /* Mtei */
  G_UNICODE_SCRIPT_OLD_SOUTH_ARABIAN,      /* Sarb */
  G_UNICODE_SCRIPT_OLD_TURKIC,             /* Orkh */
  G_UNICODE_SCRIPT_SAMARITAN,              /* Samr */
  G_UNICODE_SCRIPT_TAI_THAM,               /* Lana */
  G_UNICODE_SCRIPT_TAI_VIET,               /* Tavt */

  /* Unicode-6.0 additions */
  G_UNICODE_SCRIPT_BATAK,                  /* Batk */
  G_UNICODE_SCRIPT_BRAHMI,                 /* Brah */
  G_UNICODE_SCRIPT_MANDAIC,                /* Mand */

  /* Unicode-6.1 additions */
  G_UNICODE_SCRIPT_CHAKMA,                 /* Cakm */
  G_UNICODE_SCRIPT_MEROITIC_CURSIVE,       /* Merc */
  G_UNICODE_SCRIPT_MEROITIC_HIEROGLYPHS,   /* Mero */
  G_UNICODE_SCRIPT_MIAO,                   /* Plrd */
  G_UNICODE_SCRIPT_SHARADA,                /* Shrd */
  G_UNICODE_SCRIPT_SORA_SOMPENG,           /* Sora */
  G_UNICODE_SCRIPT_TAKRI,                  /* Takr */

  /* Unicode 7.0 additions */
  G_UNICODE_SCRIPT_BASSA_VAH,              /* Bass */
  G_UNICODE_SCRIPT_CAUCASIAN_ALBANIAN,     /* Aghb */
  G_UNICODE_SCRIPT_DUPLOYAN,               /* Dupl */
  G_UNICODE_SCRIPT_ELBASAN,                /* Elba */
  G_UNICODE_SCRIPT_GRANTHA,                /* Gran */
  G_UNICODE_SCRIPT_KHOJKI,                 /* Khoj */
  G_UNICODE_SCRIPT_KHUDAWADI,              /* Sind */
  G_UNICODE_SCRIPT_LINEAR_A,               /* Lina */
  G_UNICODE_SCRIPT_MAHAJANI,               /* Mahj */
  G_UNICODE_SCRIPT_MANICHAEAN,             /* Manu */
  G_UNICODE_SCRIPT_MENDE_KIKAKUI,          /* Mend */
  G_UNICODE_SCRIPT_MODI,                   /* Modi */
  G_UNICODE_SCRIPT_MRO,                    /* Mroo */
  G_UNICODE_SCRIPT_NABATAEAN,              /* Nbat */
  G_UNICODE_SCRIPT_OLD_NORTH_ARABIAN,      /* Narb */
  G_UNICODE_SCRIPT_OLD_PERMIC,             /* Perm */
  G_UNICODE_SCRIPT_PAHAWH_HMONG,           /* Hmng */
  G_UNICODE_SCRIPT_PALMYRENE,              /* Palm */
  G_UNICODE_SCRIPT_PAU_CIN_HAU,            /* Pauc */
  G_UNICODE_SCRIPT_PSALTER_PAHLAVI,        /* Phlp */
  G_UNICODE_SCRIPT_SIDDHAM,                /* Sidd */
  G_UNICODE_SCRIPT_TIRHUTA,                /* Tirh */
  G_UNICODE_SCRIPT_WARANG_CITI             /* Wara */
}

enum GNormalizeMode {
  G_NORMALIZE_DEFAULT,
  G_NORMALIZE_NFD = G_NORMALIZE_DEFAULT,
  G_NORMALIZE_DEFAULT_COMPOSE,
  G_NORMALIZE_NFC = G_NORMALIZE_DEFAULT_COMPOSE,
  G_NORMALIZE_ALL,
  G_NORMALIZE_NFKD = G_NORMALIZE_ALL,
  G_NORMALIZE_ALL_COMPOSE,
  G_NORMALIZE_NFKC = G_NORMALIZE_ALL_COMPOSE
}


extern (C) {


    guint32        g_unicode_script_to_iso15924   (GUnicodeScript script);

    GUnicodeScript g_unicode_script_from_iso15924 (guint32        iso15924);

    pure gboolean g_unichar_isalnum   (gunichar c);
    pure gboolean g_unichar_isalpha   (gunichar c);
    pure gboolean g_unichar_iscntrl   (gunichar c);
    pure gboolean g_unichar_isdigit   (gunichar c);
    pure gboolean g_unichar_isgraph   (gunichar c);
    pure gboolean g_unichar_islower   (gunichar c);
    pure gboolean g_unichar_isprint   (gunichar c);
    pure gboolean g_unichar_ispunct   (gunichar c);
    pure gboolean g_unichar_isspace   (gunichar c);
    pure gboolean g_unichar_isupper   (gunichar c);
    pure gboolean g_unichar_isxdigit  (gunichar c);
    pure gboolean g_unichar_istitle   (gunichar c);
    pure gboolean g_unichar_isdefined (gunichar c);
    pure gboolean g_unichar_iswide    (gunichar c);
    pure gboolean g_unichar_iswide_cjk(gunichar c);
    pure gboolean g_unichar_iszerowidth(gunichar c);
    pure gboolean g_unichar_ismark    (gunichar c);
    pure gunichar g_unichar_toupper (gunichar c);
    pure gunichar g_unichar_tolower (gunichar c);
    pure gunichar g_unichar_totitle (gunichar c);

    pure gint g_unichar_digit_value (gunichar c);

    pure gint g_unichar_xdigit_value (gunichar c);

    pure GUnicodeType g_unichar_type (gunichar c);

    pure GUnicodeBreakType g_unichar_break_type (gunichar c);

    pure gint g_unichar_combining_class (gunichar uc);

    gboolean g_unichar_get_mirror_char (gunichar ch,
                                        gunichar *mirrored_ch);

    pure GUnicodeScript g_unichar_get_script (gunichar ch);

    pure gboolean g_unichar_validate (gunichar ch);

    gboolean g_unichar_compose (gunichar  a,
                                gunichar  b,
                                gunichar *ch);

    gboolean g_unichar_decompose (gunichar  ch,
                                  gunichar *a,
                                  gunichar *b);


    gsize g_unichar_fully_decompose (gunichar  ch,
                                     gboolean  compat,
                                     gunichar *result,
                                     gsize     result_len);

    enum G_UNICHAR_MAX_DECOMPOSITION_LENGTH = 18;


    void g_unicode_canonical_ordering (gunichar *str,
                                       gsize     len);


    deprecated
    gunichar *g_unicode_canonical_decomposition (gunichar  ch,
                                                 gsize    *result_len);

    extern __gshared const(gchar*) g_utf8_skip;

    extern(D)
    auto g_utf8_next_char(inout(char)* p) {
        return p + g_utf8_skip[*(cast(inout(ubyte)*)p)];
    }

    pure gunichar g_utf8_get_char           (const(gchar)  *p);

    pure gunichar g_utf8_get_char_validated (const( gchar) *p,
                                        gssize        max_len);


    pure gchar*   g_utf8_offset_to_pointer (const(gchar) *str,
                                       glong        offset);

    pure glong    g_utf8_pointer_to_offset (const(gchar) *str,
                                       const(gchar) *pos);

    pure gchar*   g_utf8_prev_char         (const(gchar) *p);

    pure gchar*   g_utf8_find_next_char    (const(gchar) *p,
                                       const(gchar) *end);

    pure gchar*   g_utf8_find_prev_char    (const(gchar) *str,
                                       const(gchar) *p);


    pure glong    g_utf8_strlen            (const(gchar) *p,
                                       gssize       max);


    gchar   *g_utf8_substring         (const(gchar) *str,
                                       glong        start_pos,
                                       glong        end_pos);


    gchar   *g_utf8_strncpy           (gchar       *dest,
                                       const(gchar) *src,
                                       gsize        n);

    /* Find the UTF-8 character corresponding to ch, in string p. These
       functions are equivalants to strchr and strrchr */

    gchar* g_utf8_strchr  (const(gchar) *p,
                           gssize       len,
                           gunichar     c);

    gchar* g_utf8_strrchr (const(gchar) *p,
                           gssize       len,
                           gunichar     c);

    gchar* g_utf8_strreverse (const(gchar) *str,
                              gssize len);


    gunichar2 *g_utf8_to_utf16     (const(gchar)      *str,
                                    glong             len,
                                    glong            *items_read,
                                    glong            *items_written,
                                    GError          **error);

    gunichar * g_utf8_to_ucs4      (const(gchar)      *str,
                                    glong             len,
                                    glong            *items_read,
                                    glong            *items_written,
                                    GError          **error);

    gunichar * g_utf8_to_ucs4_fast (const(gchar)      *str,
                                    glong             len,
                                    glong            *items_written);

    gunichar * g_utf16_to_ucs4     (const(gunichar2)  *str,
                                    glong             len,
                                    glong            *items_read,
                                    glong            *items_written,
                                    GError          **error);

    gchar*     g_utf16_to_utf8     (const(gunichar2)  *str,
                                    glong             len,
                                    glong            *items_read,
                                    glong            *items_written,
                                    GError          **error);

    gunichar2 *g_ucs4_to_utf16     (const(gunichar)   *str,
                                    glong             len,
                                    glong            *items_read,
                                    glong            *items_written,
                                    GError          **error);

    gchar*     g_ucs4_to_utf8      (const(gunichar)   *str,
                                    glong             len,
                                    glong            *items_read,
                                    glong            *items_written,
                                    GError          **error);


    gint      g_unichar_to_utf8 (gunichar    c,
                                 gchar      *outbuf);


    gboolean g_utf8_validate (const(gchar)  *str,
                              gssize        max_len,
                              const(gchar) **end);


    gchar *g_utf8_strup   (const(gchar) *str,
                           gssize       len);

    gchar *g_utf8_strdown (const(gchar) *str,
                           gssize       len);

    gchar *g_utf8_casefold (const(gchar) *str,
                            gssize       len);


    gchar *g_utf8_normalize (const(gchar)   *str,
                             gssize         len,
                             GNormalizeMode mode);


    pure gint   g_utf8_collate     (const(gchar) *str1,
                               const(gchar) *str2);

    gchar *g_utf8_collate_key (const(gchar) *str,
                               gssize       len);

    gchar *g_utf8_collate_key_for_filename (const(gchar) *str,
                                            gssize       len);


    /* private */
    gchar *_g_utf8_make_valid (const(gchar) *name);

}

