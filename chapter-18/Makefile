PGM=ch18
AC=java -jar AppleCommander-1.3.5.13.jar

MERLIN32_HOME="c:/users/usucuha/retrocomputing/Apple II/Merlin32_v1.0"
MERLIN32_ASM=$(MERLIN32_HOME)/Windows/merlin32
MERLIN32_MACRO_PATH=$(MERLIN32_HOME)/Library

all: $(PGM) $(PGM).po

$(PGM): $(PGM).s $(PGM).po
	$(MERLIN32_ASM) $(MERLIN32_MACRO_PATH) $(PGM).s
	$(AC) -d $(PGM).po $(PGM)
	$(AC) -cc65 $(PGM).po $(PGM) BIN < $(PGM)

$(PGM).po:
	cp prodos-raw/blank.po ./$(PGM).po
	$(AC) -p $(PGM).po PRODOS SYS < prodos-raw/PRODOS
	$(AC) -p $(PGM).po BASIC.SYSTEM SYS < prodos-raw/BASIC.SYSTEM

clean:
	rm -f $(PGM)
	rm -f *.o

clean-disk:
	rm -f $(PGM).po

clean-all: clean clean-disk
