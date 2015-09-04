all: index.html fft.html

index.html: fft.html.pm pollen.rkt template.html
	raco pollen render fft.html
	mv fft.html index.html

fft.html: fft.html.pm pollen.rkt template.html
	POLLEN="TESTING" raco pollen render fft.html
	curl -f -s -X POST 'http://localhost:8080/pub?id=refreshme' -d 'now'

clean:
	rm fft.html index.html

