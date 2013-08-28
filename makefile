all:
	./build_native.sh
	ant -Dsdk.dir=${ANDROID_HOME} debug
run:
	adb -d uninstall com.joyvis.fw_game_client
	adb -d install bin/fw_game_client-debug.apk
	adb shell am start -n com.joyvis.fw_game_client/com.joyvis.fw_game_client.fw_game_client
	adb -d logcat | grep cocos2d
clean:
	rm -rf libs/
	rm -rf obj/
	rm -rf bin/*
	rm -rf gen/
	rm -rf assets/*
