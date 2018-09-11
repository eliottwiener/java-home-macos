all: 8 10

clean:
	rm -rf 8 10 Contents *-pkg-expanded *.pkg

8: JDK_8_Update_181.pkg
	pkgutil --expand $< jdk-8-pkg-expanded
	tar -xzf jdk-8-pkg-expanded/jdk180181.pkg/Payload
	mv Contents/Home $@
	rm -rf jdk-8-pkg-expanded Contents

10: JDK_10.0.2.pkg
	pkgutil --expand $< jdk-10-pkg-expanded
	tar -xzf jdk-10-pkg-expanded/jdk1002.pkg/Payload
	mv Contents/Home $@
	rm -rf jdk-10-pkg-expanded Contents

JDK_8_Update_181.pkg: jdk-8u181-macosx-x64.dmg
	MOUNT_POINT=`hdiutil attach $< | awk -F'\t' '/Volumes/ {print $$3}'`;\
	cp "$$MOUNT_POINT"/JDK*.pkg $@;\
	hdiutil detach "$$MOUNT_POINT"

JDK_10.0.2.pkg: jdk-10.0.2_osx-x64_bin.dmg
	MOUNT_POINT=`hdiutil attach $< | awk -F'\t' '/Volumes/ {print $$3}'`;\
	cp "$$MOUNT_POINT"/JDK*.pkg $@;\
	hdiutil detach "$$MOUNT_POINT"
