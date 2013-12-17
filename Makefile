TITLE = [vagrant - phaker demo]

all: clone

clone:
	@/bin/echo "${TITLE} cloning repos..." \
	&& cd workspace \
	&& git clone https://github.com/g4code/phaker_demo \
	&& cd phaker_demo \
	&& /bin/echo "${TITLE} cloning repos done"

clear:
	@/bin/echo "${TITLE} clearing old repo..." \
	&& cd workspace \
	&& rm -rf phaker_demo \
	&& /bin/echo "${TITLE} clearing old repo done"

.PHONY: clone clear make