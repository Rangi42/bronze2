ifneq ($(wildcard rgbds/.*),)
RGBDS_DIR = rgbds/
else
RGBDS_DIR =
endif

PYTHON := python
MD5 := md5sum -c --quiet

.SUFFIXES:
.PHONY: all clean crystal crystal11
.SECONDEXPANSION:
.PRECIOUS: %.2bpp %.1bpp

gfx       := $(PYTHON) gfx.py
includes  := $(PYTHON) scan_includes.py


crystal_obj := \
wram.o \
main.o \
lib/mobile/main.o \
home.o \
audio.o \
maps.o \
engine/events.o \
engine/credits.o \
data/egg_moves.o \
data/evos_attacks.o \
data/pokedex/entries.o \
misc/crystal_misc.o \
text/common_text.o \
gfx/pics.o

crystal11_obj := $(crystal_obj:.o=11.o)


roms := pokebronze2.gbc

all: $(roms)
crystal: pokebronze2.gbc
crystal11: pokebronze211.gbc

clean:
	rm -f $(roms) $(crystal_obj) $(crystal11_obj) $(roms:.gbc=.map) $(roms:.gbc=.sym)

compare: pokebronze2.gbc pokebronze211.gbc
	@$(MD5) roms.md5

%.asm: ;

%11.o: dep = $(shell $(includes) $(@D)/$*.asm)
%11.o: %.asm $$(dep)
	$(RGBDS_DIR)rgbasm -D CRYSTAL11 -o $@ $<

%.o: dep = $(shell $(includes) $(@D)/$*.asm)
%.o: %.asm $$(dep)
	$(RGBDS_DIR)rgbasm -o $@ $<

pokebronze211.gbc: $(crystal11_obj)
	$(RGBDS_DIR)rgblink -n pokebronze211.sym -m pokebronze211.map -o $@ $^
	$(RGBDS_DIR)rgbfix -Cjv -i BYTE -k 01 -l 0x33 -m 0x10 -n 1 -p 0 -r 3 -t PM_CRYSTAL $@

pokebronze2.gbc: $(crystal_obj)
	$(RGBDS_DIR)rgblink -n pokebronze2.sym -m pokebronze2.map -o $@ $^
	$(RGBDS_DIR)rgbfix -Cjv -i BYTE -k 01 -l 0x33 -m 0x10 -p 0 -r 3 -t PM_CRYSTAL $@

%.png: ;
%.2bpp: %.png ; $(gfx) 2bpp $<
%.1bpp: %.png ; $(gfx) 1bpp $<
%.lz: % ; $(gfx) lz $<

%.pal: %.2bpp ;
gfx/pics/%/normal.pal gfx/pics/%/bitmask.asm gfx/pics/%/frames.asm: gfx/pics/%/front.2bpp ;
%.bin: ;
%.blk: ;
%.tilemap: ;
