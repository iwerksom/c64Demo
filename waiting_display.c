// ===========================================================================
//
//  WAITING DISPLAY — scene 3, called after input_line() returns
//  and before the response is revealed.
//
//  Runs while the cartridge handles the HTTPS request.
//  Zero per-frame computation — only pch/pcenter + wait_frames + rowcol.
//
//  Screen layout during wait:
//
//    Row  4      theme word         (LTBLUE, fades and cycles)
//    Row  6  \
//    Row  7  |   ASCII art glyph   (theme color, dissolves between cycles)
//    Row  8  |   5 rows x 7 cols,
//    Row  9  |   centered col 16
//    Row 10  /
//    Row 18      dots "..."         (DKGRAY, static anchor)
//    Row 24      1984 phrase        (DKGRAY, fades and cycles)
//
//  HOW TO USE IN SCENE 3 — replace the old dots+dissolve block with:
//
//      char theme = find_theme(input_buf, rlen);  // BEFORE cls()
//      cls(); cls();
//      show_waiting(theme);
//      find_response(input_buf, rlen, &match_l1, &match_l2);
//
//  TIMING:
//    WAIT_NUM_CYCLES controls total wait time.
//    Each cycle is approximately 1.5 seconds.
//    Default 5 cycles = ~7.5 sec. Increase for slower SML.
//
// ===========================================================================

// ---------------------------------------------------------------------------
//  Theme index constants
// ---------------------------------------------------------------------------

#define THEME_HEALTH   0
#define THEME_PEACE    1
#define THEME_FREEDOM  2
#define THEME_CONNECT  3
#define THEME_LEARN    4
#define THEME_CREATE   5
#define THEME_EQUAL    6
#define THEME_SAFE     7
#define THEME_TRUTH    8
#define THEME_HUMAN    9
#define THEME_BETTER   10
#define THEME_FUTURE   11
#define THEME_WORK     12
#define THEME_LOVE     13
#define THEME_THINK    14
#define THEME_DEFAULT  15

// ---------------------------------------------------------------------------
//  ASCII art glyphs — 5 rows x 7 cols, C64 screen codes
//  All centered at col 16 on the 40-col screen.
//
//  Screen code key used here:
//    space=32  *=42  +=43  -=45  .=46  /=47  (=40  )=41
//    |=93      ==61  [=27  ]=29  '=39  #=160(solid block)
//    O=15  Y=25  (letters via A=1..Z=26)
//
//  PREVIEW — use preview_glyphs.py to render before flashing:
//
//   0 HEALTH        1 PEACE         2 FREEDOM       3 CONNECT
//     |  ***  |       |  /+/  |       |+-----+|       |(O)-(O)|
//     |  ***  |       | / | / |       || | | ||       | |   | |
//     |*******|       |(--+--)| ------|| |   ||       | +-+-+ |
//     |  ***  |       |   |   |       || | | ||       |   |   |
//     |  ***  |       |   |   |       |+--   +|       |  (O)  |
//
//   4 LEARN         5 CREATE        6 EQUAL         7 SAFE
//     | .---. |       | |**** |       |   |   |       |  .--. |
//     | |===| |       | |**** |       | --+-- |       | (    )|
//     | |===| |       | |     |       |[*] [*]|       | +----+|
//     | |===| |       |(O)    |       |       |       | |(O) ||
//     | +---+ |       | *     |       |+-----+|       | +----+|
//
//   8 TRUTH         9 HUMAN        10 BETTER       11 FUTURE
//     |       |       |  (O)  |       |     ##|       | .---. |
//     | (---) |       |   |   |       |  #  ##|       |(  |  )|
//     |( (*) )|       | --+-- |       |  #  ##|       |( -+  )|
//     | (---) |       |   |   |       |# #  ##|       |(     )|
//     |       |       |  /Y/  |       |+------|       | '---' |
//
//  12 WORK         13 LOVE         14 THINK        15 DEFAULT
//     | *-*-* |       | ** ** |       | (---) |       |+-----+|
//     |*(   )*|       |*     *|       |(  *  )|       ||(***)||
//     |-( + )-|       |*     *|       |( *** )|       || * * ||
//     |*(   )*|       | *   * |       | |-+-| |       ||     ||
//     | *-*-* |       |  * *  |       | +---+ |       |+-| |-+|
//
// ---------------------------------------------------------------------------

static const char _art_00_r0[] = { 32, 32, 42, 42, 42, 32, 32 }; // HEALTH
static const char _art_00_r1[] = { 32, 32, 42, 42, 42, 32, 32 };
static const char _art_00_r2[] = { 42, 42, 42, 42, 42, 42, 42 };
static const char _art_00_r3[] = { 32, 32, 42, 42, 42, 32, 32 };
static const char _art_00_r4[] = { 32, 32, 42, 42, 42, 32, 32 };

static const char _art_01_r0[] = { 32, 32, 47, 43, 47, 32, 32 }; // PEACE
static const char _art_01_r1[] = { 32, 47, 32, 93, 32, 47, 32 };
static const char _art_01_r2[] = { 40, 45, 45, 43, 45, 45, 41 };
static const char _art_01_r3[] = { 32, 32, 32, 93, 32, 32, 32 };
static const char _art_01_r4[] = { 32, 32, 32, 93, 32, 32, 32 };

static const char _art_02_r0[] = { 43, 45, 45, 45, 45, 45, 43 }; // FREEDOM
static const char _art_02_r1[] = { 93, 32, 93, 32, 93, 32, 93 };
static const char _art_02_r2[] = { 93, 32, 93, 32, 32, 32, 93 };
static const char _art_02_r3[] = { 93, 32, 93, 32, 93, 32, 93 };
static const char _art_02_r4[] = { 43, 45, 45, 32, 32, 32, 43 };

static const char _art_03_r0[] = { 40, 15, 41, 45, 40, 15, 41 }; // CONNECT
static const char _art_03_r1[] = { 32, 93, 32, 32, 32, 93, 32 };
static const char _art_03_r2[] = { 32, 43, 45, 43, 45, 43, 32 };
static const char _art_03_r3[] = { 32, 32, 32, 93, 32, 32, 32 };
static const char _art_03_r4[] = { 32, 32, 40, 15, 41, 32, 32 };

static const char _art_04_r0[] = { 32, 46, 45, 45, 45, 46, 32 }; // LEARN
static const char _art_04_r1[] = { 32, 93, 61, 61, 61, 93, 32 };
static const char _art_04_r2[] = { 32, 93, 61, 61, 61, 93, 32 };
static const char _art_04_r3[] = { 32, 93, 61, 61, 61, 93, 32 };
static const char _art_04_r4[] = { 32, 43, 45, 45, 45, 43, 32 };

static const char _art_05_r0[] = { 32, 93, 42, 42, 42, 42, 32 }; // CREATE
static const char _art_05_r1[] = { 32, 93, 42, 42, 42, 42, 32 };
static const char _art_05_r2[] = { 32, 93, 32, 32, 32, 32, 32 };
static const char _art_05_r3[] = { 40, 15, 41, 32, 32, 32, 32 };
static const char _art_05_r4[] = { 32, 42, 32, 32, 32, 32, 32 };

static const char _art_06_r0[] = { 32, 32, 32, 93, 32, 32, 32 }; // EQUAL
static const char _art_06_r1[] = { 32, 45, 45, 43, 45, 45, 32 };
static const char _art_06_r2[] = { 27, 42, 29, 32, 27, 42, 29 };
static const char _art_06_r3[] = { 32, 32, 32, 32, 32, 32, 32 };
static const char _art_06_r4[] = { 43, 45, 45, 45, 45, 45, 43 };

static const char _art_07_r0[] = { 32, 32, 46, 45, 45, 46, 32 }; // SAFE
static const char _art_07_r1[] = { 32, 40, 32, 32, 32, 32, 41 };
static const char _art_07_r2[] = { 32, 43, 45, 45, 45, 45, 43 };
static const char _art_07_r3[] = { 32, 93, 40, 15, 41, 32, 93 };
static const char _art_07_r4[] = { 32, 43, 45, 45, 45, 45, 43 };

static const char _art_08_r0[] = { 32, 32, 32, 32, 32, 32, 32 }; // TRUTH
static const char _art_08_r1[] = { 32, 40, 45, 45, 45, 41, 32 };
static const char _art_08_r2[] = { 40, 32, 40, 42, 41, 32, 41 };
static const char _art_08_r3[] = { 32, 40, 45, 45, 45, 41, 32 };
static const char _art_08_r4[] = { 32, 32, 32, 32, 32, 32, 32 };

static const char _art_09_r0[] = { 32, 32, 40, 15, 41, 32, 32 }; // HUMAN
static const char _art_09_r1[] = { 32, 32, 32, 93, 32, 32, 32 };
static const char _art_09_r2[] = { 32, 45, 45, 43, 45, 45, 32 };
static const char _art_09_r3[] = { 32, 32, 32, 93, 32, 32, 32 };
static const char _art_09_r4[] = { 32, 32, 47, 25, 47, 32, 32 };

static const char _art_10_r0[] = { 32, 32, 32, 32, 32,160,160 }; // BETTER
static const char _art_10_r1[] = { 32, 32,160, 32, 32,160,160 };
static const char _art_10_r2[] = { 32, 32,160, 32, 32,160,160 };
static const char _art_10_r3[] = {160, 32,160, 32, 32,160,160 };
static const char _art_10_r4[] = { 43, 45, 45, 45, 45, 45, 45 };

static const char _art_11_r0[] = { 32, 46, 45, 45, 45, 46, 32 }; // FUTURE
static const char _art_11_r1[] = { 40, 32, 32, 93, 32, 32, 41 };
static const char _art_11_r2[] = { 40, 32, 45, 43, 32, 32, 41 };
static const char _art_11_r3[] = { 40, 32, 32, 32, 32, 32, 41 };
static const char _art_11_r4[] = { 32, 39, 45, 45, 45, 39, 32 };

static const char _art_12_r0[] = { 32, 42, 45, 42, 45, 42, 32 }; // WORK
static const char _art_12_r1[] = { 42, 40, 32, 32, 32, 41, 42 };
static const char _art_12_r2[] = { 45, 40, 32, 43, 32, 41, 45 };
static const char _art_12_r3[] = { 42, 40, 32, 32, 32, 41, 42 };
static const char _art_12_r4[] = { 32, 42, 45, 42, 45, 42, 32 };

static const char _art_13_r0[] = { 32, 42, 42, 32, 42, 42, 32 }; // LOVE
static const char _art_13_r1[] = { 42, 32, 32, 32, 32, 32, 42 };
static const char _art_13_r2[] = { 42, 32, 32, 32, 32, 32, 42 };
static const char _art_13_r3[] = { 32, 42, 32, 32, 32, 42, 32 };
static const char _art_13_r4[] = { 32, 32, 42, 32, 42, 32, 32 };

static const char _art_14_r0[] = { 32, 40, 45, 45, 45, 41, 32 }; // THINK
static const char _art_14_r1[] = { 40, 32, 32, 42, 32, 32, 41 };
static const char _art_14_r2[] = { 40, 32, 42, 42, 42, 32, 41 };
static const char _art_14_r3[] = { 32, 93, 45, 43, 45, 93, 32 };
static const char _art_14_r4[] = { 32, 43, 45, 45, 45, 43, 32 };

static const char _art_15_r0[] = { 43, 45, 45, 45, 45, 45, 43 }; // DEFAULT
static const char _art_15_r1[] = { 93, 40, 42, 42, 42, 41, 93 };
static const char _art_15_r2[] = { 93, 32, 42, 32, 42, 32, 93 };
static const char _art_15_r3[] = { 93, 32, 32, 32, 32, 32, 93 };
static const char _art_15_r4[] = { 43, 45, 93, 32, 93, 45, 43 };

static const char * const _art_table[16][5] = {
    { _art_00_r0, _art_00_r1, _art_00_r2, _art_00_r3, _art_00_r4 },
    { _art_01_r0, _art_01_r1, _art_01_r2, _art_01_r3, _art_01_r4 },
    { _art_02_r0, _art_02_r1, _art_02_r2, _art_02_r3, _art_02_r4 },
    { _art_03_r0, _art_03_r1, _art_03_r2, _art_03_r3, _art_03_r4 },
    { _art_04_r0, _art_04_r1, _art_04_r2, _art_04_r3, _art_04_r4 },
    { _art_05_r0, _art_05_r1, _art_05_r2, _art_05_r3, _art_05_r4 },
    { _art_06_r0, _art_06_r1, _art_06_r2, _art_06_r3, _art_06_r4 },
    { _art_07_r0, _art_07_r1, _art_07_r2, _art_07_r3, _art_07_r4 },
    { _art_08_r0, _art_08_r1, _art_08_r2, _art_08_r3, _art_08_r4 },
    { _art_09_r0, _art_09_r1, _art_09_r2, _art_09_r3, _art_09_r4 },
    { _art_10_r0, _art_10_r1, _art_10_r2, _art_10_r3, _art_10_r4 },
    { _art_11_r0, _art_11_r1, _art_11_r2, _art_11_r3, _art_11_r4 },
    { _art_12_r0, _art_12_r1, _art_12_r2, _art_12_r3, _art_12_r4 },
    { _art_13_r0, _art_13_r1, _art_13_r2, _art_13_r3, _art_13_r4 },
    { _art_14_r0, _art_14_r1, _art_14_r2, _art_14_r3, _art_14_r4 },
    { _art_15_r0, _art_15_r1, _art_15_r2, _art_15_r3, _art_15_r4 },
};

// One color per theme — reinforces the irony of each
static const char _art_color[16] = {
    RED,     //  0 HEALTH   — red cross becomes red data
    LTGREEN, //  1 PEACE    — false green calm
    CYAN,    //  2 FREEDOM  — cold cyan cage
    LTBLUE,  //  3 CONNECT  — network blue
    YELLOW,  //  4 LEARN    — warm curiosity, owned
    PURPLE,  //  5 CREATE   — creative purple, permitted
    ORANGE,  //  6 EQUAL    — warm scales, rigged
    LTGREEN, //  7 SAFE     — green padlock, ironic
    WHITE,   //  8 TRUTH    — white eye, blinding
    LTGRAY,  //  9 HUMAN    — gray figure, optimised
    LTGREEN, // 10 BETTER   — green bars, rising
    LTBLUE,  // 11 FUTURE   — blue clock, allocated
    ORANGE,  // 12 WORK     — orange cog, automated
    RED,     // 13 LOVE     — red heart, scored
    YELLOW,  // 14 THINK    — yellow bulb, assisted
    MDGRAY,  // 15 DEFAULT  — gray telescreen
};

// ---------------------------------------------------------------------------
//  draw_art / clear_art
// ---------------------------------------------------------------------------

#define ART_START_ROW 6
#define ART_START_COL 16
#define ART_COLS      7

void draw_art(char theme)
{
    char color = _art_color[theme];
    for (char r = 0; r < 5; r++)
    {
        const char *row = _art_table[theme][r];
        int base = (int)(ART_START_ROW + r) * COLS + ART_START_COL;
        for (char c = 0; c < ART_COLS; c++)
        {
            SCREEN[base + c] = row[c];
            COLORRAM[base + c] = color;
        }
    }
}

// ---------------------------------------------------------------------------
//  find_theme() — local keyword scan, returns THEME_* constant
//  Call BEFORE cls() while input_buf is still valid.
// ---------------------------------------------------------------------------

typedef struct { const char *kw; char theme; } ThemeEntry;

static const char _tk_health[]    = {  8, 5, 1,12,20, 8,  0 };
static const char _tk_peace[]     = { 16, 5, 1, 3, 5,     0 };
static const char _tk_quiet[]     = { 17,21, 9, 5,20,     0 };
static const char _tk_harmony[]   = {  8, 1,18,13,15,14,25, 0 };
static const char _tk_freedom[]   = {  6,18, 5, 5, 4,15,13, 0 };
static const char _tk_free[]      = {  6,18, 5, 5,         0 };
static const char _tk_connect[]   = {  3,15,14,14, 5, 3,20, 0 };
static const char _tk_learn[]     = { 12, 5, 1,18,14,      0 };
static const char _tk_knowledge[] = { 11,14,15,23,12, 5, 4, 7, 5, 0 };
static const char _tk_education[] = {  5, 4,21, 3, 1,20, 9,15,14, 0 };
static const char _tk_create[]    = {  3,18, 5, 1,20, 5,   0 };
static const char _tk_art[]       = {  1,18,20,             0 };
static const char _tk_music[]     = { 13,21,19, 9, 3,      0 };
static const char _tk_write[]     = { 23,18, 9,20, 5,      0 };
static const char _tk_equal[]     = {  5,17,21, 1,12,      0 };
static const char _tk_fair[]      = {  6, 1, 9,18,         0 };
static const char _tk_safe[]      = { 19, 1, 6, 5,         0 };
static const char _tk_security[]  = { 19, 5, 3,21,18, 9,20,25, 0 };
static const char _tk_protect[]   = { 16,18,15,20, 5, 3,20, 0 };
static const char _tk_truth[]     = { 20,18,21,20, 8,      0 };
static const char _tk_honest[]    = {  8,15,14, 5,19,20,   0 };
static const char _tk_trust[]     = { 20,18,21,19,20,      0 };
static const char _tk_human[]     = {  8,21,13, 1,14,      0 };
static const char _tk_people[]    = { 16, 5,15,16,12, 5,   0 };
static const char _tk_better[]    = {  2, 5,20,20, 5,18,   0 };
static const char _tk_improve[]   = {  9,13,16,18,15,22, 5, 0 };
static const char _tk_progress[]  = { 16,18,15, 7,18, 5,19,19, 0 };
static const char _tk_future[]    = {  6,21,20,21,18, 5,   0 };
static const char _tk_hope[]      = {  8,15,16, 5,         0 };
static const char _tk_tomorrow[]  = { 20,15,13,15,18,18,15,23, 0 };
static const char _tk_work[]      = { 23,15,18,11,         0 };
static const char _tk_job[]       = { 10,15, 2,            0 };
static const char _tk_earn[]      = {  5, 1,18,14,         0 };
static const char _tk_love[]      = { 12,15,22, 5,         0 };
static const char _tk_family[]    = {  6, 1,13, 9,12,25,   0 };
static const char _tk_together[]  = { 20,15, 7, 5,20, 8, 5,18, 0 };
static const char _tk_think[]     = { 20, 8, 9,14,11,      0 };
static const char _tk_mind[]      = { 13, 9,14, 4,         0 };
static const char _tk_idea[]      = {  9, 4, 5, 1,         0 };

static const ThemeEntry _theme_table[] = {
    { _tk_health,    THEME_HEALTH   },
    { _tk_peace,     THEME_PEACE    },
    { _tk_quiet,     THEME_PEACE    },
    { _tk_harmony,   THEME_PEACE    },
    { _tk_freedom,   THEME_FREEDOM  },
    { _tk_free,      THEME_FREEDOM  },
    { _tk_connect,   THEME_CONNECT  },
    { _tk_learn,     THEME_LEARN    },
    { _tk_knowledge, THEME_LEARN    },
    { _tk_education, THEME_LEARN    },
    { _tk_create,    THEME_CREATE   },
    { _tk_art,       THEME_CREATE   },
    { _tk_music,     THEME_CREATE   },
    { _tk_write,     THEME_CREATE   },
    { _tk_equal,     THEME_EQUAL    },
    { _tk_fair,      THEME_EQUAL    },
    { _tk_safe,      THEME_SAFE     },
    { _tk_security,  THEME_SAFE     },
    { _tk_protect,   THEME_SAFE     },
    { _tk_truth,     THEME_TRUTH    },
    { _tk_honest,    THEME_TRUTH    },
    { _tk_trust,     THEME_TRUTH    },
    { _tk_human,     THEME_HUMAN    },
    { _tk_people,    THEME_HUMAN    },
    { _tk_better,    THEME_BETTER   },
    { _tk_improve,   THEME_BETTER   },
    { _tk_progress,  THEME_BETTER   },
    { _tk_future,    THEME_FUTURE   },
    { _tk_hope,      THEME_FUTURE   },
    { _tk_tomorrow,  THEME_FUTURE   },
    { _tk_work,      THEME_WORK     },
    { _tk_job,       THEME_WORK     },
    { _tk_earn,      THEME_WORK     },
    { _tk_love,      THEME_LOVE     },
    { _tk_family,    THEME_LOVE     },
    { _tk_together,  THEME_LOVE     },
    { _tk_think,     THEME_THINK    },
    { _tk_mind,      THEME_THINK    },
    { _tk_idea,      THEME_THINK    },
};
#define THEME_TABLE_COUNT 39

char find_theme(const char *input, char ilen)
{
    for (char t = 0; t < THEME_TABLE_COUNT; t++)
    {
        const char *kw = _theme_table[t].kw;
        char kwlen = 0;
        while (kw[kwlen]) kwlen++;
        if (kwlen > ilen) continue;
        for (char i = 0; i + kwlen <= ilen; i++)
        {
            char match = 1;
            for (char j = 0; j < kwlen; j++)
                if (input[i+j] != kw[j]) { match = 0; break; }
            if (match) return _theme_table[t].theme;
        }
    }
    return THEME_DEFAULT;
}

// ---------------------------------------------------------------------------
//  Theme word arrays — 3 words per theme, shown on row 4
// ---------------------------------------------------------------------------

static const char tw_h0[]  = {  2,15, 4,25,                            0 }; // BODY
static const char tw_h1[]  = { 23, 5,12,12,14, 5,19,19,                0 }; // WELLNESS
static const char tw_h2[]  = {  3,15,13,16,12, 9, 1,14, 3, 5,          0 }; // COMPLIANCE
static const char tw_p0[]  = { 19, 9,12, 5,14, 3, 5,                   0 }; // SILENCE
static const char tw_p1[]  = { 15,18, 4, 5,18,                         0 }; // ORDER
static const char tw_p2[]  = {  3,15,14,20,18,15,12,12, 5, 4,          0 }; // CONTROLLED
static const char tw_fr0[] = { 16, 1,18, 1,13, 5,20, 5,18,19,          0 }; // PARAMETERS
static const char tw_fr1[] = {  2,15,21,14, 4, 1,18, 9, 5,19,          0 }; // BOUNDARIES
static const char tw_fr2[] = { 16, 5,18,13, 9,20,20, 5, 4,             0 }; // PERMITTED
static const char tw_c0[]  = { 14, 5,20,23,15,18,11,                   0 }; // NETWORK
static const char tw_c1[]  = { 19, 9, 7,14, 1,12,                      0 }; // SIGNAL
static const char tw_c2[]  = { 13,15,14, 9,20,15,18, 5, 4,             0 }; // MONITORED
static const char tw_l0[]  = {  3,21,18,18, 9, 3,21,12,21,13,          0 }; // CURRICULUM
static const char tw_l1[]  = {  1,12, 7,15,18, 9,20, 8,13,             0 }; // ALGORITHM
static const char tw_l2[]  = {  3,21,18, 1,20, 5, 4,                   0 }; // CURATED
static const char tw_cr0[] = { 16, 5,18,13, 9,20,                      0 }; // PERMIT
static const char tw_cr1[] = {  1,16,16,18,15,22, 5, 4,                0 }; // APPROVED
static const char tw_cr2[] = {  1,18, 3, 8, 9,22, 5, 4,                0 }; // ARCHIVED
static const char tw_eq0[] = { 19, 3,15,18, 5,                         0 }; // SCORE
static const char tw_eq1[] = {  1,19,19, 9, 7,14, 5, 4,                0 }; // ASSIGNED
static const char tw_eq2[] = {  3, 1,12, 9, 2,18, 1,20, 5, 4,          0 }; // CALIBRATED
static const char tw_s0[]  = { 12,15, 7, 7, 5, 4,                      0 }; // LOGGED
static const char tw_s1[]  = { 20,18, 1,14,19,16, 1,18, 5,14,20,       0 }; // TRANSPARENT
static const char tw_s2[]  = { 16,18,15,20, 5, 3,20, 5, 4,             0 }; // PROTECTED
static const char tw_t0[]  = { 22, 5,18,19, 9,15,14,                   0 }; // VERSION
static const char tw_t1[]  = { 21,16, 4, 1,20, 5, 4,                   0 }; // UPDATED
static const char tw_t2[]  = {  4, 5,12, 5,20, 5, 4,                   0 }; // DELETED
static const char tw_hu0[] = { 15,16,20, 9,13, 9,19, 5, 4,             0 }; // OPTIMISED
static const char tw_hu1[] = { 21,16, 7,18, 1, 4, 5, 4,                0 }; // UPGRADED
static const char tw_hu2[] = { 19, 3, 8, 5, 4,21,12, 5, 4,             0 }; // SCHEDULED
static const char tw_b0[]  = {  2, 1,19, 5,12, 9,14, 5,                0 }; // BASELINE
static const char tw_b1[]  = { 13, 5,20,18, 9, 3,19,                   0 }; // METRICS
static const char tw_b2[]  = { 19,25,19,20, 5,13,                      0 }; // SYSTEM
static const char tw_fu0[] = {  1,12,12,15, 3, 1,20, 5, 4,             0 }; // ALLOCATED
static const char tw_fu1[] = { 18,15,12, 5,                            0 }; // ROLE
static const char tw_fu2[] = {  1,19,19, 9, 7,14, 5, 4,                0 }; // ASSIGNED
static const char tw_w0[]  = {  1,21,20,15,13, 1,20, 5, 4,             0 }; // AUTOMATED
static const char tw_w1[]  = { 18, 5, 4,21,14, 4, 1,14,20,             0 }; // REDUNDANT
static const char tw_w2[]  = { 18, 5,16,12, 1, 3, 5, 4,                0 }; // REPLACED
static const char tw_lo0[] = {  3,15,13,16, 1,20, 9, 2,12, 5,          0 }; // COMPATIBLE
static const char tw_lo1[] = { 13, 1,20, 3, 8, 5, 4,                   0 }; // MATCHED
static const char tw_lo2[] = { 15,16,20, 9,13, 9,19, 5, 4,             0 }; // OPTIMISED
static const char tw_th0[] = {  1,19,19, 9,19,20, 5, 4,                0 }; // ASSISTED
static const char tw_th1[] = {  7,21, 9, 4, 5, 4,                      0 }; // GUIDED
static const char tw_th2[] = {  1,16,16,18,15,22, 5, 4,                0 }; // APPROVED
static const char tw_d0[]  = { 16,18,15, 3, 5,19,19, 9,14, 7,          0 }; // PROCESSING
static const char tw_d1[]  = {  1,14, 1,12,25,19, 9,14, 7,             0 }; // ANALYSING
static const char tw_d2[]  = {  3, 1,12, 3,21,12, 1,20, 9,14, 7,       0 }; // CALCULATING

static const char * const _theme_words[16][3] = {
    { tw_h0,  tw_h1,  tw_h2  },  //  0 HEALTH
    { tw_p0,  tw_p1,  tw_p2  },  //  1 PEACE
    { tw_fr0, tw_fr1, tw_fr2 },  //  2 FREEDOM
    { tw_c0,  tw_c1,  tw_c2  },  //  3 CONNECT
    { tw_l0,  tw_l1,  tw_l2  },  //  4 LEARN
    { tw_cr0, tw_cr1, tw_cr2 },  //  5 CREATE
    { tw_eq0, tw_eq1, tw_eq2 },  //  6 EQUAL
    { tw_s0,  tw_s1,  tw_s2  },  //  7 SAFE
    { tw_t0,  tw_t1,  tw_t2  },  //  8 TRUTH
    { tw_hu0, tw_hu1, tw_hu2 },  //  9 HUMAN
    { tw_b0,  tw_b1,  tw_b2  },  // 10 BETTER
    { tw_fu0, tw_fu1, tw_fu2 },  // 11 FUTURE
    { tw_w0,  tw_w1,  tw_w2  },  // 12 WORK
    { tw_lo0, tw_lo1, tw_lo2 },  // 13 LOVE
    { tw_th0, tw_th1, tw_th2 },  // 14 THINK
    { tw_d0,  tw_d1,  tw_d2  },  // 15 DEFAULT
};

// ---------------------------------------------------------------------------
//  Generic 1984 phrases — row 24
// ---------------------------------------------------------------------------

// THE SYSTEM IS LISTENING
static const char _gp0[] = { 20, 8, 5,32,19,25,19,20, 5,13,32, 9,19,32,12, 9,19,20, 5,14, 9,14, 7, 0 };
// YOUR DATA IS BEING FILED
static const char _gp1[] = { 25,15,21,18,32, 4, 1,20, 1,32, 9,19,32, 2, 5, 9,14, 7,32, 6, 9,12, 5, 4, 0 };
// BIG BROTHER IS WATCHING
static const char _gp2[] = {  2, 9, 7,32, 2,18,15,20, 8, 5,18,32, 9,19,32,23, 1,20, 3, 8, 9,14, 7, 0 };
// THOUGHT CRIME DETECTED
static const char _gp3[] = { 20, 8,15,21, 7, 8,20,32, 3,18, 9,13, 5,32, 4, 5,20, 5, 3,20, 5, 4, 0 };

static const char * const _generic_phrases[4] = { _gp0, _gp1, _gp2, _gp3 };

// Static dots
static const char _wait_dots[] = { 46, 46, 46, 0 };

// ---------------------------------------------------------------------------
//  show_waiting()
// ---------------------------------------------------------------------------

#define WAIT_NUM_CYCLES 5   // ~7.5 sec — increase for slower SML

void show_waiting(char theme)
{
    // Static dots — never cleared until the very end
    pcenter(18, _wait_dots, DKGRAY);

    char word_idx   = 0;
    char phrase_idx = 0;

    for (char cycle = 0; cycle < WAIT_NUM_CYCLES; cycle++)
    {
        // Draw art and word
        draw_art(theme);
        pcenter(4, _theme_words[theme][word_idx], LTBLUE);
        word_idx++;
        if (word_idx >= 3) word_idx = 0;

        // Draw phrase at bottom
        pcenter(24, _generic_phrases[phrase_idx], DKGRAY);
        phrase_idx++;
        if (phrase_idx >= 4) phrase_idx = 0;

        // Hold everything visible
        wait_frames(40);

        // Fade word and phrase first
        rowcol(4,  BLACK);
        rowcol(24, BLACK);
        wait_frames(8);

        // Dissolve art row by row downward
        for (char r = 0; r < 5; r++)
        {
            rowcol(ART_START_ROW + r, BLACK);
            wait_frames(4);
        }

        wait_frames(8);
    }

    // Clear dots and screen before returning to response reveal
    rowcol(18, BLACK);
    cls();
    cls();
}
