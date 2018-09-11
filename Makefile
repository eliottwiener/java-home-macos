all: 8 10

8: jdk-8-u181.pkg
	pkgutil --expand $< jdk-8-pkg-expanded
	tar -xzf jdk-8-pkg-expanded/jdk180181.pkg/Payload
	mv Contents/Home $@
	rm -rf jdk-8-pkg-expanded Contents

10: jdk-10.pkg
	pkgutil --expand $< jdk-10-pkg-expanded
	tar -xzf jdk-10-pkg-expanded/jdk1002.pkg/Payload
	mv Contents/Home $@
	rm -rf jdk-10-pkg-expanded Contents

clean:
	rm -rf 8 10 Contents *-pkg-expanded
