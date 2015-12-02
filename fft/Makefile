all: index.html fft.html

index.html: fft.html.pm pollen.rkt template.html
	raco pollen render fft.html
	mv fft.html index.html

fft.html: fft.html.pm pollen.rkt template.html
	POLLEN="TESTING" raco pollen render fft.html

clean:
	rm fft.html index.html

watch:
	cd ..
	node server fft/fft.html.pm "cd fft; POLLEN=TESTING raco pollen render fft.html"

