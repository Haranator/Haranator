#!/data/data/comm.termux/files/usr/bin.bash
kill -9$(pgrep -f "termux.x11") 2>/dev/null

pulseaudio --start --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" --exit-idle-time=-1

export XDG_RUNTIME_DIR=${TMPDIR}
termux-x11 :0 >/dev/null &

sleep 3

am start --user 0 -n com.termux.x11/com.termux.x11.MainActivity > /dev/null 2>&1
sleep 1

proot-distro login alpine --shared-tmp -- /bin/ash -c 'export PULSE_SERVER=127.0.0.1 && su -haranator -c "env Display=:0 startxfce4"




