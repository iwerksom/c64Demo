// =============================================================
//  NINETEEN84.EXE - A C64 Demo
//
//  "George Orwell's 1984 meets AI"
//  Did we get the technology we were promised?
//  And at what cost?
//
//  Build (produces .prg):
//    oscar64 -tm=c64 -O2 -o nineteen84.prg nineteen84.c
//
//  Build + run in built-in emulator:
//    oscar64 -tm=c64 -O2 -e nineteen84.c
// =============================================================

#include <c64/vic.h>
#include <c64/cia.h>
#include <c64/memmap.h>
#include <stdio.h>
#include <string.h>

// ---------------------------------------------------------------------------
// Hardware
// ---------------------------------------------------------------------------
#define SCREEN ((char *)0x0400)
#define COLORRAM ((char *)0xd800)

// VIC-II colors
#define BLACK 0
#define WHITE 1
#define RED 2
#define CYAN 3
#define PURPLE 4
#define GREEN 5
#define BLUE 6
#define YELLOW 7
#define ORANGE 8
#define BROWN 9
#define LTRED 10
#define DKGRAY 11
#define MDGRAY 12
#define LTGREEN 13
#define LTBLUE 14
#define LTGRAY 15

// ---------------------------------------------------------------------------
// Screen utilities
// ---------------------------------------------------------------------------

void cls(char bg)
{
    vic.color_border = BLACK;
    vic.color_back = bg;
    for (int i = 0; i < 1000; i++)
    {
        SCREEN[i] = 32;
        COLORRAM[i] = BLACK;
    }
}

void print_at(char row, char col, const char *s, char fg)
{
    int base = (int)row * 40 + col;
    while (*s)
    {
        SCREEN[base] = *s++;
        COLORRAM[base] = fg;
        base++;
    }
}

void print_centered(char row, const char *s, char fg)
{
    char len = 0;
    const char *p = s;
    while (*p++)
        len++;
    char col = (40 - len) >> 1;
    print_at(row, col, s, fg);
}

void hline(char row, char ch, char fg)
{
    // 2-char margin each side so the line matches the centered text width
    int base = (int)row * 40 + 2;
    for (char i = 0; i < 36; i++)
    {
        SCREEN[base + i] = ch;
        COLORRAM[base + i] = fg;
    }
}

// ---------------------------------------------------------------------------
// All text as PETSCII screen codes.
// Uppercase letters: A=1 .. Z=26
// Digits: 0=48 .. 9=57  (same as ASCII values)
// Space=32, hyphen=45, dot=46, pipe/vbar=93, ( =40, ) =41, * =42
// ---------------------------------------------------------------------------

// "NINETEEN EIGHTY-FOUR"
static const char s_title[] = {
    14, 9, 14, 5, 20, 5, 5, 14, 32, 5, 9, 7, 8, 20, 25, 45, 6, 15, 21, 18, 0};
// "THE TECHNOLOGY WE WERE PROMISED"
static const char s_sub1[] = {
    20, 8, 5, 32, 20, 5, 3, 8, 14, 15, 12, 15, 7, 25, 32, 23, 5, 32, 23, 5, 18, 5, 32, 16, 18, 15, 13, 9, 19, 5, 4, 0};
// "AND AT WHAT COST"
static const char s_sub2[] = {
    1, 14, 4, 32, 1, 20, 32, 23, 8, 1, 20, 32, 3, 15, 19, 20, 0};
// "GEORGE ORWELL  1949"
static const char s_orwell[] = {
    7, 5, 15, 18, 7, 5, 32, 15, 18, 23, 5, 12, 12, 32, 32, 49, 57, 52, 57, 0};
// "WAR IS PEACE"
static const char s_sl1[] = {
    23, 1, 18, 32, 9, 19, 32, 16, 5, 1, 3, 5, 0};
// "FREEDOM IS SLAVERY"
static const char s_sl2[] = {
    6, 18, 5, 5, 4, 15, 13, 32, 9, 19, 32, 19, 12, 1, 22, 5, 18, 25, 0};
// "IGNORANCE IS STRENGTH"
static const char s_sl3[] = {
    9, 7, 14, 15, 18, 1, 14, 3, 5, 32, 9, 19, 32, 19, 20, 18, 5, 14, 7, 20, 8, 0};
// "BIG BROTHER IS WATCHING"
static const char s_bb[] = {
    2, 9, 7, 32, 2, 18, 15, 20, 8, 5, 18, 32, 9, 19, 32, 23, 1, 20, 3, 8, 9, 14, 7, 0};
// "THOUGHTCRIME DOES NOT ENTAIL DEATH"
static const char s_tc[] = {
    20, 8, 15, 21, 7, 8, 20, 3, 18, 9, 13, 5, 32, 4, 15, 5, 19, 32, 14, 15, 20, 32,
    5, 14, 20, 1, 9, 12, 32, 4, 5, 1, 20, 8, 0};
// "AI IS WATCHING YOU"
static const char s_ai1[] = {
    1, 9, 32, 9, 19, 32, 23, 1, 20, 3, 8, 9, 14, 7, 32, 25, 15, 21, 0};
// "YOUR DATA IS THE NEW SLAVERY"
static const char s_ai2[] = {
    25, 15, 21, 18, 32, 4, 1, 20, 1, 32, 9, 19, 32, 20, 8, 5, 32, 14, 5, 23, 32, 19, 12, 1, 22, 5, 18, 25, 0};
// "SURVEILLANCE IS PEACE"
static const char s_ai3[] = {
    19, 21, 18, 22, 5, 9, 12, 12, 1, 14, 3, 5, 32, 9, 19, 32, 16, 5, 1, 3, 5, 0};
// "PREDICTION IS STRENGTH"
static const char s_ai4[] = {
    16, 18, 5, 4, 9, 3, 20, 9, 15, 14, 32, 9, 19, 32, 19, 20, 18, 5, 14, 7, 20, 8, 0};
// "COMPLIANCE IS FREEDOM"
static const char s_ai5[] = {
    3, 15, 13, 16, 12, 9, 1, 14, 3, 5, 32, 9, 19, 32, 6, 18, 5, 5, 4, 15, 13, 0};
// "DID WE GET WHAT WE WERE PROMISED"
static const char s_q1[] = {
    4, 9, 4, 32, 23, 5, 32, 7, 5, 20, 32, 23, 8, 1, 20, 32, 23, 5, 32, 23, 5, 18, 5, 32, 16, 18, 15, 13, 9, 19, 5, 4, 0};
// "OR SOMETHING FAR MORE DANGEROUS"
static const char s_q2[] = {
    15, 18, 32, 19, 15, 13, 5, 20, 8, 9, 14, 7, 32, 6, 1, 18, 32, 13, 15, 18, 5, 32, 4, 1, 14, 7, 5, 18, 15, 21, 19, 0};
// "A C64 DEMO"  (digit screen codes: '6'=54, '4'=52)
static const char s_c64[] = {
    1, 32, 3, 54, 52, 32, 4, 5, 13, 15, 0};
// "PRESS FIRE TO CONTINUE"
static const char s_press[] = {
    16, 18, 5, 19, 19, 32, 6, 9, 18, 5, 32, 20, 15, 32, 3, 15, 14, 20, 9, 14, 21, 5, 0};
// "THE END IS NOT YET WRITTEN"
static const char s_end[] = {
    20, 8, 5, 32, 5, 14, 4, 32, 9, 19, 32, 14, 15, 20, 32, 25, 5, 20, 32, 23, 18, 9, 20, 20, 5, 14, 0};
// Column headers: "THEN" and "NOW"
static const char col_then[] = {20, 8, 5, 14, 0};
static const char col_now[] = {14, 15, 23, 0};
// "THEN"       = T(20) H(8) E(5) N(14)
// "NOW"        = N(14) O(15) W(23)

// ---------------------------------------------------------------------------
// Raster color bars
// ---------------------------------------------------------------------------

#define NUM_BARS 8
#define BAR_HEIGHT 8

static char bar_pal[NUM_BARS] = {
    RED, ORANGE, YELLOW, WHITE,
    LTBLUE, BLUE, PURPLE, BLACK};

void rotate_bars_left(void)
{
    char tmp = bar_pal[0];
    for (char i = 0; i < NUM_BARS - 1; i++)
        bar_pal[i] = bar_pal[i + 1];
    bar_pal[NUM_BARS - 1] = tmp;
}

void draw_bars(char start_line)
{
    vic.color_border = BLACK; // pre-set border before bars start
    vic.color_back = BLACK;   // pre-set background before bars start
    for (char b = 0; b < NUM_BARS; b++)
    {
        char target = start_line + (char)(b * BAR_HEIGHT);
        while (vic.raster != target)
            ;
        vic.color_border = bar_pal[b];
        vic.color_back = bar_pal[b];
    }
    char restore = start_line + (char)(NUM_BARS * BAR_HEIGHT);
    while (vic.raster != restore)
        ;
    vic.color_border = BLACK;
    vic.color_back = BLACK;
}

// ---------------------------------------------------------------------------
// Scrolling marquee (row 24)
// ---------------------------------------------------------------------------

static const char scroll_text[] = {
    32, 32, 32,
    // WAR IS PEACE
    23, 1, 18, 32, 9, 19, 32, 16, 5, 1, 3, 5,
    32, 32, 32,
    // FREEDOM IS SLAVERY
    6, 18, 5, 5, 4, 15, 13, 32, 9, 19, 32, 19, 12, 1, 22, 5, 18, 25,
    32, 32, 32,
    // IGNORANCE IS STRENGTH
    9, 7, 14, 15, 18, 1, 14, 3, 5, 32, 9, 19, 32, 19, 20, 18, 5, 14, 7, 20, 8,
    32, 32, 32,
    // AI IS WATCHING YOU
    1, 9, 32, 9, 19, 32, 23, 1, 20, 3, 8, 9, 14, 7, 32, 25, 15, 21,
    32, 32, 32,
    // YOUR DATA IS THE NEW SLAVERY
    25, 15, 21, 18, 32, 4, 1, 20, 1, 32, 9, 19, 32, 20, 8, 5, 32, 14, 5, 23, 32, 19, 12, 1, 22, 5, 18, 25,
    32, 32, 32,
    // BIG BROTHER IS WATCHING
    2, 9, 7, 32, 2, 18, 15, 20, 8, 5, 18, 32, 9, 19, 32, 23, 1, 20, 3, 8, 9, 14, 7,
    32, 32, 32,
    // SURVEILLANCE IS PEACE
    19, 21, 18, 22, 5, 9, 12, 12, 1, 14, 3, 5, 32, 9, 19, 32, 16, 5, 1, 3, 5,
    32, 32, 32,
    // DID WE GET WHAT WE WERE PROMISED
    4, 9, 4, 32, 23, 5, 32, 7, 5, 20, 32, 23, 8, 1, 20, 32, 23, 5, 32, 23, 5, 18, 5, 32, 16, 18, 15, 13, 9, 19, 5, 4,
    32, 32,
    // AND AT WHAT COST
    1, 14, 4, 32, 1, 20, 32, 23, 8, 1, 20, 32, 3, 15, 19, 20,
    32, 32, 32,
    // PREDICTION IS STRENGTH
    16, 18, 5, 4, 9, 3, 20, 9, 15, 14, 32, 9, 19, 32, 19, 20, 18, 5, 14, 7, 20, 8,
    32, 32, 32,
    // COMPLIANCE IS FREEDOM
    3, 15, 13, 16, 12, 9, 1, 14, 3, 5, 32, 9, 19, 32, 6, 18, 5, 5, 4, 15, 13,
    32, 32, 32,
    0xFF};

static unsigned scroll_idx = 0;
static char scroll_buf[40];
static char scroll_tick = 0; // throttle: advance 1 char every N frames

void scroll_init(void)
{
    scroll_idx = 0;
    scroll_tick = 0;
    for (char i = 0; i < 40; i++)
        scroll_buf[i] = 32;
}

void scroll_step(void)
{
    // Only advance every 12 frames — ~4 chars/sec, comfortable reading pace
    if (++scroll_tick < 12)
        return;
    scroll_tick = 0;

    for (char i = 0; i < 39; i++)
        scroll_buf[i] = scroll_buf[i + 1];

    char c = scroll_text[scroll_idx++];
    if (c == 0xFF)
    {
        scroll_idx = 0;
        c = scroll_text[0];
    }
    scroll_buf[39] = c;

    int base = 24 * 40;
    for (char i = 0; i < 40; i++)
    {
        SCREEN[base + i] = scroll_buf[i];
        COLORRAM[base + i] = LTGREEN;
    }
}

// ---------------------------------------------------------------------------
// Timing
// ---------------------------------------------------------------------------

void wait_frame(void)
{
    while (vic.raster < 250)
        ;
    while (vic.raster >= 250)
        ;
}

void wait_frames(char n)
{
    while (n--)
        wait_frame();
}

// ---------------------------------------------------------------------------
// Input
// Check joystick 2 fire OR spacebar OR Return key.
//
// C64 keyboard matrix: CIA1 port A = column select (active low output)
//                      CIA1 port B = row read    (active low input)
//
// Space:  row 7 (bit 7), col 4 (bit 4)  -> write ~(1<<4) to PRA, read PRB bit 7
// Return: row 1 (bit 1), col 1 (bit 1)  -> write ~(1<<1) to PRA, read PRB bit 1
// Joystick 2 fire: CIA1 PRA bit 4, active low
// ---------------------------------------------------------------------------

char fire_pressed(void)
{
    // Joystick 2 fire (bit 4 of CIA1 PRA, active low)
    if (!(cia1.pra & 0x10))
        return 1;

    // Spacebar: column 4, row 7
    cia1.pra = ~(1 << 4);
    char space = !(cia1.prb & (1 << 7));
    cia1.pra = 0xFF;
    if (space)
        return 1;

    // Return key: column 1, row 1
    cia1.pra = ~(1 << 1);
    char ret = !(cia1.prb & (1 << 1));
    cia1.pra = 0xFF;
    if (ret)
        return 1;

    return 0;
}

// ---------------------------------------------------------------------------
// Blink
// ---------------------------------------------------------------------------

static char blink_cnt = 0;
static char blink_phase = 0;

void blink_reset(void)
{
    blink_cnt = 0;
    blink_phase = 0;
}

char blink_step(void)
{
    if (++blink_cnt >= 25)
    {
        blink_cnt = 0;
        blink_phase = !blink_phase;
    }
    return blink_phase;
}

void blink_row(char row, char fg)
{
    char c = blink_step() ? fg : BLACK;
    char *clr = COLORRAM + (int)row * 40;
    for (char i = 0; i < 40; i++)
        clr[i] = c;
}

// ---------------------------------------------------------------------------
// Fade out
// ---------------------------------------------------------------------------

void fade_to_black(char steps)
{
    char row = 0;
    for (char s = 0; s < steps; s++)
    {
        wait_frame();
        if (row < 25)
        {
            char *clr = COLORRAM + (int)row * 40;
            for (char i = 0; i < 40; i++)
                clr[i] = BLACK;
            row++;
        }
    }
    vic.color_border = BLACK;
    vic.color_back = BLACK;
}

// ---------------------------------------------------------------------------
// Glitch: rapid color flicker on one row
// ---------------------------------------------------------------------------

static const char glitch_pal[] = {RED, WHITE, LTRED, DKGRAY, WHITE, BLACK, RED, WHITE};

void glitch_row(char row, char times)
{
    char *clr = COLORRAM + (int)row * 40;
    for (char t = 0; t < times; t++)
    {
        char c = glitch_pal[t & 7];
        for (char i = 0; i < 40; i++)
            clr[i] = c;
        wait_frame();
    }
}

// ---------------------------------------------------------------------------
// SCENE 1: TITLE / THE PROMISE
//
//   Row  8   NINETEEN EIGHTY-FOUR               WHITE
//   Row  9   THE TECHNOLOGY WE WERE PROMISED    YELLOW
//   Row 10   AND AT WHAT COST                   YELLOW
//   Row 12   ----------------------------------------
//   Row 14   GEORGE ORWELL  1949                MDGRAY
//   Row 17   (  O  )   surveillance eye         LTGRAY
//   Row 19   BIG BROTHER IS WATCHING            RED
//   Row 21   PRESS FIRE TO CONTINUE             blink
//   Row 24   [scroller]
// ---------------------------------------------------------------------------

void scene1_run(void)
{
    // Double-clear: BASIC's RUN echo can leave chars in row 0 after first cls
    cls(BLACK);
    cls(BLACK);

    print_centered(8, s_title, WHITE);
    print_centered(9, s_sub1, YELLOW);
    print_centered(10, s_sub2, YELLOW);
    hline(12, 45, DKGRAY);
    print_centered(14, s_orwell, MDGRAY);

    // Surveillance "eye" made of PETSCII chars
    // ( ( (  O  ) ) )   where O = screen code 15
    static const char eye[] = {
        40, 40, 40, 32, 15, 32, 41, 41, 41, 0};
    print_centered(17, eye, LTGRAY);

    print_centered(19, s_bb, RED);
    print_centered(21, s_press, MDGRAY);

    scroll_init();
    blink_reset();

    for (;;)
    {
        wait_frame();
        scroll_step();
        blink_row(21, MDGRAY);
        if (fire_pressed())
            break;
    }

    fade_to_black(15);
    wait_frames(10);
}

// ---------------------------------------------------------------------------
// SCENE 2: ORWELL'S THREE SLOGANS
// Revealed one at a time with glitch effect, then THOUGHTCRIME line.
//
//   Row 10   WAR IS PEACE           RED
//   Row 12   FREEDOM IS SLAVERY     CYAN
//   Row 14   IGNORANCE IS STRENGTH  LTGREEN
//   Row 18   NINETEEN EIGHTY-FOUR   DKGRAY  (watermark)
//   Row 20   THOUGHTCRIME ...       DKGRAY
// ---------------------------------------------------------------------------

void scene2_run(void)
{
    cls(BLACK);
    print_centered(18, s_title, DKGRAY);

    wait_frames(20);
    print_centered(10, s_sl1, RED);
    glitch_row(10, 6);
    wait_frames(30);

    print_centered(12, s_sl2, CYAN);
    glitch_row(12, 6);
    wait_frames(30);

    print_centered(14, s_sl3, LTGREEN);
    glitch_row(14, 6);
    wait_frames(50);

    print_centered(20, s_tc, DKGRAY);
    wait_frames(80);

    fade_to_black(20);
    wait_frames(10);
}

// ---------------------------------------------------------------------------
// SCENE 3: THE AI MIRROR
// Side-by-side comparison: Orwell's slogans vs the AI age equivalents.
//
//   Left column  (col 1)  = Orwell
//   Right column (col 22) = AI equivalent
//   Vertical divider at col 20
//
//   Row  2   NINETEEN EIGHTY-FOUR                DKGRAY
//   Row  4   THEN          |  NOW
//   Row  6   WAR IS PEACE  |  SURVEILLANCE IS PEACE
//   Row  9   FREEDOM IS SLAVERY | YOUR DATA IS THE NEW SLAVERY
//   Row 12   IGNORANCE IS STRENGTH | PREDICTION IS STRENGTH
//   Row 15   BIG BROTHER IS WATCHING | AI IS WATCHING YOU
//   Row 19   ----------------------------------------
//   Row 21   PRESS FIRE TO CONTINUE     blink
//   Row 24   [scroller]
//
// Rows revealed with staggered timing.
// ---------------------------------------------------------------------------

void scene3_run(void)
{
    cls(BLACK);
    print_centered(2, s_title, DKGRAY);

    // Column headers
    print_at(4, 2, col_then, MDGRAY);
    print_at(4, 24, col_now, MDGRAY);

    // Vertical divider
    for (char row = 3; row < 22; row++)
    {
        SCREEN[(int)row * 40 + 20] = 93; // PETSCII vertical bar
        COLORRAM[(int)row * 40 + 20] = DKGRAY;
    }

    scroll_init();
    blink_reset();
    char bar_tick = 0;
    char timer = 0;
    char revealed = 0;

    for (;;)
    {
        wait_frame();
        draw_bars(51);
        if (++bar_tick >= 8)
        {
            bar_tick = 0;
            rotate_bars_left();
        }
        scroll_step();

        timer++;

        if (timer == 15 && revealed < 1)
        {
            print_at(6, 1, s_sl1, RED);
            print_at(6, 22, s_ai3, LTRED);
            revealed = 1;
        }
        if (timer == 35 && revealed < 2)
        {
            print_at(9, 1, s_sl2, CYAN);
            print_at(9, 22, s_ai2, LTBLUE);
            revealed = 2;
        }
        if (timer == 55 && revealed < 3)
        {
            print_at(12, 1, s_sl3, LTGREEN);
            print_at(12, 22, s_ai4, GREEN);
            revealed = 3;
        }
        if (timer == 75 && revealed < 4)
        {
            print_at(15, 1, s_bb, ORANGE);
            print_at(15, 22, s_ai1, YELLOW);
            revealed = 4;
        }
        if (timer == 100 && revealed < 5)
        {
            hline(19, 45, DKGRAY);
            print_centered(21, s_press, MDGRAY);
            revealed = 5;
        }

        if (revealed >= 5)
            blink_row(21, MDGRAY);

        if (revealed >= 5 && fire_pressed())
            break;
    }

    fade_to_black(15);
    wait_frames(10);
}

// ---------------------------------------------------------------------------
// SCENE 4: THE QUESTION
// Slow dramatic text. Tension ramp via bar palette shift.
//
//   Row 10   DID WE GET WHAT WE WERE PROMISED   WHITE
//   Row 12   OR SOMETHING FAR MORE DANGEROUS     LTRED
//   Row 18   PRESS FIRE TO CONTINUE              blink
// ---------------------------------------------------------------------------

void scene4_run(void)
{
    cls(BLACK);

    wait_frames(30);
    print_centered(10, s_q1, WHITE);
    wait_frames(40);
    print_centered(12, s_q2, LTRED);
    wait_frames(40);

    // Shift palette to pure reds for tension
    bar_pal[0] = RED;
    bar_pal[1] = LTRED;
    bar_pal[2] = ORANGE;
    bar_pal[3] = RED;
    bar_pal[4] = DKGRAY;
    bar_pal[5] = BLACK;
    bar_pal[6] = BLACK;
    bar_pal[7] = BLACK;

    blink_reset();
    char bar_tick = 0;
    print_centered(18, s_press, MDGRAY);

    for (;;)
    {
        wait_frame();
        draw_bars(51);
        if (++bar_tick >= 10)
        {
            bar_tick = 0;
            rotate_bars_left();
        }
        blink_row(18, MDGRAY);
        if (fire_pressed())
            break;
    }

    fade_to_black(20);
    wait_frames(20);
}

// ---------------------------------------------------------------------------
// SCENE 5: END SCREEN (loops)
//
//   Row  8   A C64 DEMO                         LTGRAY
//   Row 11   ----------------------------------------
//   Row 13   THE END IS NOT YET WRITTEN          WHITE  (blink)
//   Row 17   ----------------------------------------
//   Row 20   GEORGE ORWELL  1949                 DKGRAY
//   Row 24   [scroller]
//
// Palette: cool blues/purples
// ---------------------------------------------------------------------------

void scene5_run(void)
{
    cls(BLACK);

    print_centered(8, s_c64, LTGRAY);
    hline(11, 45, DKGRAY);
    hline(17, 45, DKGRAY);
    print_centered(20, s_orwell, DKGRAY);

    // Cool palette
    bar_pal[0] = PURPLE;
    bar_pal[1] = BLUE;
    bar_pal[2] = LTBLUE;
    bar_pal[3] = CYAN;
    bar_pal[4] = LTBLUE;
    bar_pal[5] = BLUE;
    bar_pal[6] = PURPLE;
    bar_pal[7] = BLACK;

    scroll_init();
    blink_reset();
    char bar_tick = 0;

    wait_frames(40);
    print_centered(13, s_end, WHITE);

    for (;;)
    {
        wait_frame();
        draw_bars(51);
        if (++bar_tick >= 8)
        {
            bar_tick = 0;
            rotate_bars_left();
        }
        scroll_step();
        blink_row(13, WHITE);
        // Loops forever — fire restarts from scene 1
        if (fire_pressed())
            break;
    }
}

// ---------------------------------------------------------------------------
// Main
// ---------------------------------------------------------------------------

int main(void)
{
    vic.color_border = BLACK;
    vic.color_back = BLACK;

    // Warm opening palette
    bar_pal[0] = RED;
    bar_pal[1] = ORANGE;
    bar_pal[2] = YELLOW;
    bar_pal[3] = WHITE;
    bar_pal[4] = LTBLUE;
    bar_pal[5] = BLUE;
    bar_pal[6] = PURPLE;
    bar_pal[7] = BLACK;

    for (;;)
    {
        scene1_run();
        scene2_run();
        scene3_run();
        scene4_run();
        scene5_run();
        // Fire on scene 5 loops back to scene 1
    }

    return 0;
}
