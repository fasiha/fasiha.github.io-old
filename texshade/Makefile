all: index.html tutorial.html

publish:
	make clean
	make all

index.html: index.html.pm pollen.rkt template.html
	raco pollen render index.html

tutorial.html: tutorial.html.pm pollen.rkt template.html
	raco pollen render tutorial.html

dev-testing: tutorial.html.pm index.html.pm pollen.rkt template.html
	POLLEN=TESTING raco pollen render index.html
	POLLEN=TESTING raco pollen render tutorial.html

clean:
	rm -f tutorial.html index.html

watch:
	cd .. && node server 'texshade/*.pm' "cd texshade && make dev-testing"

