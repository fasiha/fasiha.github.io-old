all: index.html

index.html: index.html.pm pollen.rkt template.html
	raco pollen render index.html

clean:
	rm -f index.html

watch:
	node server index.html.pm "POLLEN=TESTING raco pollen render index.html"
