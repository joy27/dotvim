all:
	./build_native.sh
	ant -Dsdk.dir=${ANDROID_HOME} debug
run:
	adb -d uninstall com.joyvis.demo
	adb -d install bin/Demo-debug.apk
	adb shell am start -n com.joyvis.demo/com.joyvis.demo.Demo
	adb -d logcat | grep cocos2d
clean:
	rm -rf libs/
	rm -rf obj/
	rm -rf bin/*
	rm -rf gen/
	rm -rf assets/*
