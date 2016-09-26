all: check

debug:
	Xephyr :1 -ac -br -noreset -screen 1152x720 & \
	sleep 1; \
	DISPLAY=:1.0 awesome -c ~/.config/awesome/rc.lua

check:
	awesome -k

restart:
	echo 'awesome.restart()' | awesome-client

volumetest:
	lua v.lua

screentest:
	lua screentest.lua
