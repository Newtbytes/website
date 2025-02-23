all:
	cp -r site build
	python mockdown build/writing.html

clean:
	rm -r build