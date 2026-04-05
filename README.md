# NINETEEN84 — A C64 Demo

> _George Orwell's 1984 meets AI._  
> Did we get the technology we were promised?  
> And at what cost?

---

## Demo structure — 5 scenes

| Scene                 | Content                                                                                   | Effects                                                             |
| --------------------- | ----------------------------------------------------------------------------------------- | ------------------------------------------------------------------- |
| **1 — The Promise**   | Title screen: _Nineteen Eighty-Four / The technology we were promised / And at what cost_ | Raster bars (warm palette), bottom scroller, surveillance eye motif |
| **2 — The Slogans**   | Orwell's three Party slogans revealed one by one with glitch effect                       | Glitch color flicker on reveal, THOUGHTCRIME line                   |
| **3 — The AI Mirror** | Side-by-side: Orwell's slogans vs their AI-age equivalents                                | Staggered reveal, dual column with divider, scroller                |
| **4 — The Question**  | _"Did we get what we were promised / Or something far more dangerous"_                    | Bar palette shifts to pure reds for tension                         |
| **5 — End Screen**    | _"The end is not yet written"_ + credits                                                  | Cool blue/purple palette, loops back to scene 1                     |

### The AI mirror comparison (Scene 3)

| Orwell 1949             | AI Today                     |
| ----------------------- | ---------------------------- |
| War is Peace            | Surveillance is Peace        |
| Freedom is Slavery      | Your data is the new slavery |
| Ignorance is Strength   | Prediction is Strength       |
| Big Brother is Watching | AI is Watching You           |

---

## Files

```
nineteen84.c          Complete demo source — single file
build.bat             One-click Windows build
nineteen84.vcxproj    Visual Studio Makefile project
README.md             This file
```

---

## Building

### Command line (fastest for iteration)

Open **PowerShell** or **CMD** — _never double-click oscar64.exe directly_,  
it is a command-line compiler and exits immediately with no arguments.

```powershell
# Build to .prg
oscar64 -tm=c64 -O2 nineteen84.c

# Build AND launch in oscar64's built-in emulator
x64sc.exe -autostart nineteen84.prg
```

### Visual Studio

Open `nineteen84.vcxproj` (Makefile project type).

| Action                  | Shortcut     |
| ----------------------- | ------------ |
| Build                   | Ctrl+Shift+B |
| Build + run in emulator | Ctrl+F5      |

### build.bat

Double-click `build.bat` — produces `nineteen84.prg` in the same folder.

---

## Running on real C64 hardware

`nineteen84.prg` is a standard C64 program file.

```
LOAD"NINETEEN84.PRG",8,1
RUN
```

Works with SD2IEC, 1541 Ultimate II/+, TheC64 mini/maxi, or any floppy solution.

---

## Controls

| Input           | Action                                       |
| --------------- | -------------------------------------------- |
| Joystick 2 fire | Advance to next scene / restart from scene 1 |

---

## Phase 2 — SML on EasyFlash cartridge (planned)

The next phase adds a 2 MB EasyFlash cartridge containing a Small Language Model.

The demo will:

1. Accept keyboard input on the C64
2. Pass the prompt to the SML (resident in cartridge ROM banks)
3. Render the response as animated text effects
4. Drive demo effects (palette, scroll text, screen mode) dynamically from the output

Oscar64 supports EasyFlash natively via `-tf=crt` and multi-bank linker pragmas:

```c
#pragma section( bcode1, 0 )
#pragma region(bank1, 0x8000, 0xc000, , 1, { bcode1 })
```

---

## Technical notes

- **Raster bars**: busy-poll on `vic.raster` ($D012). No IRQ driver needed for this stage. 8 bars × 8 raster lines = 64 lines of colour coverage from raster 51.
- **Scroller**: character-width (1 char/frame). Shift `scroll_buf[]` left, feed from `scroll_text[]` array encoded as raw screen codes.
- **Frame sync**: waits for raster 250 to cross — reliable PAL 50 Hz sync point.
- **Glitch effect**: rapid palette writes to color RAM on a single row over several frames.
- **All text**: stored as raw PETSCII screen codes (not ASCII strings) — works correctly on real hardware without any charset mapping.

---

## Resources

- Oscar64 docs: https://github.com/drmortalwombat/oscar64/blob/main/oscar64.md
- Oscar64 samples (after install): `%USERPROFILE%\Documents\oscar64\samples\`
- VIC-II register map: https://www.c64-wiki.com/wiki/VIC
- VICE emulator: https://vice-emu.sourceforge.io/
