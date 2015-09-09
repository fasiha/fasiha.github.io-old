all: index.html fft.html

index.html: fft.html.pm pollen.rkt template.html
	raco pollen render fft.html
	mv fft.html index.html

fft.html: fft.html.pm pollen.rkt template.html
	POLLEN="TESTING" raco pollen render fft.html
	curl -f -s -X POST 'http://localhost:8080/pub?id=refreshme' -d 'now'

clean:
	rm fft.html index.html

watch:
	fswatch -0 template.html pollen.rkt fft.html.pm | xargs -0 -n 1 make fft.html

