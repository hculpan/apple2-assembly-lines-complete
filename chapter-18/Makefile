PGM=ch18
AC=java -jar ../AppleCommander-1.3.5.13.jar
START_ADDRESS=0x0300

MERLIN32_HOME="c:/users/usucuha/retrocomputing/Apple II/Merlin32_v1.0"
MERLIN32_ASM=$(MERLIN32_HOME)/Windows/merlin32
MERLIN32_MACRO_PATH=$(MERLIN32_HOME)/Library

all: $(PGM) prodos

$(PGM): $(PGM).s
	$(MERLIN32_ASM) -V $(MERLIN32_MACRO_PATH) $(PGM).s

prodos: prodos-$(PGM).po
	$(AC) -d prodos-$(PGM).po $(PGM)
	$(AC) -p prodos-$(PGM).po $(PGM) BIN $(START_ADDRESS) < $(PGM)

prodos-$(PGM).po:
	cp ../prodos-raw/blank.po ./prodos-$(PGM).po
	$(AC) -p prodos-$(PGM).po PRODOS SYS < ../prodos-raw/PRODOS
	$(AC) -p prodos-$(PGM).po BASIC.SYSTEM SYS < ../prodos-raw/BASIC.SYSTEM
	$(AC) -n prodos-$(PGM).po $(PGM)

clean:
	rm -f $(PGM)
	rm -f *.o
	rm -f *_Output.txt

clean-disk:
	rm -f prodos-$(PGM).po
	rm -f dos-$(PGM).dsk

clean-all: clean clean-disk

dos: $(PGM) dos-$(PGM).dsk
	$(AC) -d dos-$(PGM).dsk $(PGM)
	$(AC) -p dos-$(PGM).dsk $(PGM) BIN $(START_ADDRESS) < $(PGM)

dos-$(PGM).dsk:
	cp ../prodos-raw/dos33mst.dsk ./dos-$(PGM).dsk
