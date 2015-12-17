all: index.html texshade.html about.html

index.html: texshade.html.pm pollen.rkt template.html
	raco pollen render texshade.html
	mv texshade.html index.html

about.html: about.html.pm pollen.rkt template.html
	raco pollen render about.html

texshade.html: texshade.html.pm pollen.rkt template.html
	POLLEN="TESTING" raco pollen render texshade.html

clean:
	rm texshade.html index.html

watch:
	cd .. && node server texshade/texshade.html.pm "cd texshade; POLLEN=TESTING raco pollen render texshade.html"

