#!/usr/bin/env python3
"""
preview_glyphs.py — Preview all 16 waiting display glyphs in your terminal.

Renders each glyph as it will appear on the C64 screen, using ANSI colors
to approximate the VIC-II palette.

Usage:
    python preview_glyphs.py          # show all 16 themes
    python preview_glyphs.py 8        # show only theme 8 (TRUTH)
    python preview_glyphs.py health   # show only HEALTH theme
"""

import sys

# ---------------------------------------------------------------------------
#  Screen code to character mapping (matches waiting_display.c exactly)
# ---------------------------------------------------------------------------

def sc_to_char(sc):
    if sc == 32:  return ' '
    if sc == 42:  return '*'
    if sc == 43:  return '+'
    if sc == 45:  return '-'
    if sc == 46:  return '.'
    if sc == 47:  return '/'
    if sc == 40:  return '('
    if sc == 41:  return ')'
    if sc == 93:  return '|'
    if sc == 61:  return '='
    if sc == 27:  return '['
    if sc == 29:  return ']'
    if sc == 39:  return "'"
    if sc == 160: return '#'   # solid block — shown as # in terminal
    if sc == 25:  return 'Y'
    if sc == 15:  return 'O'
    if 1 <= sc <= 26: return chr(sc + 64)
    if 48 <= sc <= 57: return chr(sc)
    return '?'

# ---------------------------------------------------------------------------
#  ANSI color approximations for VIC-II colors
# ---------------------------------------------------------------------------

VIC_COLORS = {
    'RED':     '\033[91m',
    'LTGREEN': '\033[92m',
    'YELLOW':  '\033[93m',
    'LTBLUE':  '\033[94m',
    'PURPLE':  '\033[95m',
    'CYAN':    '\033[96m',
    'WHITE':   '\033[97m',
    'ORANGE':  '\033[33m',
    'LTGRAY':  '\033[37m',
    'MDGRAY':  '\033[90m',
    'DKGRAY':  '\033[90m',
    'BLACK':   '\033[30m',
    'RESET':   '\033[0m',
}

ART_COLORS = [
    'RED',     #  0 HEALTH
    'LTGREEN', #  1 PEACE
    'CYAN',    #  2 FREEDOM
    'LTBLUE',  #  3 CONNECT
    'YELLOW',  #  4 LEARN
    'PURPLE',  #  5 CREATE
    'ORANGE',  #  6 EQUAL
    'LTGREEN', #  7 SAFE
    'WHITE',   #  8 TRUTH
    'LTGRAY',  #  9 HUMAN
    'LTGREEN', # 10 BETTER
    'LTBLUE',  # 11 FUTURE
    'ORANGE',  # 12 WORK
    'RED',     # 13 LOVE
    'YELLOW',  # 14 THINK
    'MDGRAY',  # 15 DEFAULT
]

# ---------------------------------------------------------------------------
#  Glyph data — matches waiting_display.c exactly
# ---------------------------------------------------------------------------

GLYPHS = [
    # 0 HEALTH
    [[32,32,42,42,42,32,32],
     [32,32,42,42,42,32,32],
     [42,42,42,42,42,42,42],
     [32,32,42,42,42,32,32],
     [32,32,42,42,42,32,32]],
    # 1 PEACE
    [[32,32,47,43,47,32,32],
     [32,47,32,93,32,47,32],
     [40,45,45,43,45,45,41],
     [32,32,32,93,32,32,32],
     [32,32,32,93,32,32,32]],
    # 2 FREEDOM
    [[43,45,45,45,45,45,43],
     [93,32,93,32,93,32,93],
     [93,32,93,32,32,32,93],
     [93,32,93,32,93,32,93],
     [43,45,45,32,32,32,43]],
    # 3 CONNECT
    [[40,15,41,45,40,15,41],
     [32,93,32,32,32,93,32],
     [32,43,45,43,45,43,32],
     [32,32,32,93,32,32,32],
     [32,32,40,15,41,32,32]],
    # 4 LEARN
    [[32,46,45,45,45,46,32],
     [32,93,61,61,61,93,32],
     [32,93,61,61,61,93,32],
     [32,93,61,61,61,93,32],
     [32,43,45,45,45,43,32]],
    # 5 CREATE
    [[32,93,42,42,42,42,32],
     [32,93,42,42,42,42,32],
     [32,93,32,32,32,32,32],
     [40,15,41,32,32,32,32],
     [32,42,32,32,32,32,32]],
    # 6 EQUAL
    [[32,32,32,93,32,32,32],
     [32,45,45,43,45,45,32],
     [27,42,29,32,27,42,29],
     [32,32,32,32,32,32,32],
     [43,45,45,45,45,45,43]],
    # 7 SAFE
    [[32,32,46,45,45,46,32],
     [32,40,32,32,32,32,41],
     [32,43,45,45,45,45,43],
     [32,93,40,15,41,32,93],
     [32,43,45,45,45,45,43]],
    # 8 TRUTH
    [[32,32,32,32,32,32,32],
     [32,40,45,45,45,41,32],
     [40,32,40,42,41,32,41],
     [32,40,45,45,45,41,32],
     [32,32,32,32,32,32,32]],
    # 9 HUMAN
    [[32,32,40,15,41,32,32],
     [32,32,32,93,32,32,32],
     [32,45,45,43,45,45,32],
     [32,32,32,93,32,32,32],
     [32,32,47,25,47,32,32]],
    # 10 BETTER
    [[32,32,32,32,32,160,160],
     [32,32,160,32,32,160,160],
     [32,32,160,32,32,160,160],
     [160,32,160,32,32,160,160],
     [43,45,45,45,45,45,45]],
    # 11 FUTURE
    [[32,46,45,45,45,46,32],
     [40,32,32,93,32,32,41],
     [40,32,45,43,32,32,41],
     [40,32,32,32,32,32,41],
     [32,39,45,45,45,39,32]],
    # 12 WORK
    [[32,42,45,42,45,42,32],
     [42,40,32,32,32,41,42],
     [45,40,32,43,32,41,45],
     [42,40,32,32,32,41,42],
     [32,42,45,42,45,42,32]],
    # 13 LOVE
    [[32,42,42,32,42,42,32],
     [42,32,32,32,32,32,42],
     [42,32,32,32,32,32,42],
     [32,42,32,32,32,42,32],
     [32,32,42,32,42,32,32]],
    # 14 THINK
    [[32,40,45,45,45,41,32],
     [40,32,32,42,32,32,41],
     [40,32,42,42,42,32,41],
     [32,93,45,43,45,93,32],
     [32,43,45,45,45,43,32]],
    # 15 DEFAULT
    [[43,45,45,45,45,45,43],
     [93,40,42,42,42,41,93],
     [93,32,42,32,42,32,93],
     [93,32,32,32,32,32,93],
     [43,45,93,32,93,45,43]],
]

THEME_NAMES = [
    'HEALTH', 'PEACE', 'FREEDOM', 'CONNECT',
    'LEARN',  'CREATE', 'EQUAL',  'SAFE',
    'TRUTH',  'HUMAN',  'BETTER', 'FUTURE',
    'WORK',   'LOVE',   'THINK',  'DEFAULT',
]

THEME_WORDS = [
    ['BODY',        'WELLNESS',   'COMPLIANCE'],   #  0
    ['SILENCE',     'ORDER',      'CONTROLLED'],   #  1
    ['PARAMETERS',  'BOUNDARIES', 'PERMITTED'],    #  2
    ['NETWORK',     'SIGNAL',     'MONITORED'],    #  3
    ['CURRICULUM',  'ALGORITHM',  'CURATED'],      #  4
    ['PERMIT',      'APPROVED',   'ARCHIVED'],     #  5
    ['SCORE',       'ASSIGNED',   'CALIBRATED'],   #  6
    ['LOGGED',      'TRANSPARENT','PROTECTED'],    #  7
    ['VERSION',     'UPDATED',    'DELETED'],      #  8
    ['OPTIMISED',   'UPGRADED',   'SCHEDULED'],    #  9
    ['BASELINE',    'METRICS',    'SYSTEM'],       # 10
    ['ALLOCATED',   'ROLE',       'ASSIGNED'],     # 11
    ['AUTOMATED',   'REDUNDANT',  'REPLACED'],     # 12
    ['COMPATIBLE',  'MATCHED',    'OPTIMISED'],    # 13
    ['ASSISTED',    'GUIDED',     'APPROVED'],     # 14
    ['PROCESSING',  'ANALYSING',  'CALCULATING'],  # 15
]

PHRASES = [
    'THE SYSTEM IS LISTENING',
    'YOUR DATA IS BEING FILED',
    'BIG BROTHER IS WATCHING',
    'THOUGHT CRIME DETECTED',
]

# ---------------------------------------------------------------------------
#  Render one theme
# ---------------------------------------------------------------------------

SCREEN_WIDTH = 40

def center(text, width=SCREEN_WIDTH):
    pad = (width - len(text)) // 2
    return ' ' * pad + text

def render_theme(idx):
    name   = THEME_NAMES[idx]
    color  = VIC_COLORS[ART_COLORS[idx]]
    reset  = VIC_COLORS['RESET']
    blue   = VIC_COLORS['LTBLUE']
    gray   = VIC_COLORS['DKGRAY']
    glyph  = GLYPHS[idx]
    words  = THEME_WORDS[idx]

    # 40-col screen border
    border = '+' + '-' * SCREEN_WIDTH + '+'
    blank  = '|' + ' ' * SCREEN_WIDTH + '|'

    lines = []
    lines.append(border)

    # Row 4 — theme word
    word_line = center(words[0])
    lines.append(f'|{blue}{word_line}{reset}|')

    lines.append(blank)

    # Rows 6-10 — art (col 16, width 7)
    art_col = (SCREEN_WIDTH - 7) // 2
    for r in range(5):
        row_chars = ''.join(sc_to_char(sc) for sc in glyph[r])
        left  = ' ' * art_col
        right = ' ' * (SCREEN_WIDTH - art_col - 7)
        lines.append(f'|{left}{color}{row_chars}{reset}{right}|')

    # Rows 11-17 — empty
    for _ in range(7):
        lines.append(blank)

    # Row 18 — dots
    dots_line = center('...')
    lines.append(f'|{gray}{dots_line}{reset}|')

    # Rows 19-23 — empty
    for _ in range(5):
        lines.append(blank)

    # Row 24 — 1984 phrase
    phrase_line = center(PHRASES[idx % 4])
    lines.append(f'|{gray}{phrase_line}{reset}|')

    lines.append(border)

    print(f'\n  Theme {idx:2d} — {name}  ({ART_COLORS[idx]})')
    for line in lines:
        print(' ', line)

    # Also show word rotation
    print(f'  Words: {" / ".join(words)}')

# ---------------------------------------------------------------------------
#  Main
# ---------------------------------------------------------------------------

def main():
    if len(sys.argv) > 1:
        arg = sys.argv[1].upper()
        # Try as integer first
        try:
            idx = int(arg)
            if 0 <= idx <= 15:
                render_theme(idx)
            else:
                print(f'Theme index must be 0-15')
        except ValueError:
            # Try as name
            if arg in THEME_NAMES:
                render_theme(THEME_NAMES.index(arg))
            else:
                print(f'Unknown theme: {arg}')
                print(f'Valid names: {", ".join(THEME_NAMES)}')
    else:
        # Show all
        for i in range(16):
            render_theme(i)
            if i < 15:
                input('  [enter for next]')

if __name__ == '__main__':
    main()
