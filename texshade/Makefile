all: index.html tutorial.html

index.html: index.html.pm pollen.rkt template.html
	raco pollen render index.html

tutorial.html: tutorial.html.pm pollen.rkt template.html
	raco pollen render tutorial.html

clean:
	rm -f tutorial.html index.html

watch:
	cd .. && node server texshade/texshade.html.pm "cd texshade; POLLEN=TESTING raco pollen render texshade.html"

