mkdir -p bin

~/Documents/games/AIRSDK_COMPILER/bin/mxmlc -output bin/coinhunter.swf -source-path lib/flixel -- src/Main.as

if [ $? -eq 0 ]
	then 
	~/Documents/games/AIRSDK_COMPILER/bin/fdb bin/coinhunter.swf
fi
