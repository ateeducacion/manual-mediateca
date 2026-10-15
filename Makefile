.PHONY: pdf clean
pdf:
	./scripts/build.sh

clean:
	rm -r build dist/*.pdf
