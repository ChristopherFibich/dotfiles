
export XCURSOR_SIZE=8

setxkbmap de
sh ~/.screenlayout/default.sh || sh ~/.screenlayout/fallback.sh
exec /usr/bin/awesome
