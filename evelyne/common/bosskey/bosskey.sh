#!/bin/sh

#  ____                _
# | __ )  ___  ___ ___| | _____ _   _
# |  _ \ / _ \/ __/ __| |/ / _ \ | | |
# | |_) | (_) \__ \__ \   <  __/ |_| |
# |____/ \___/|___/___/_|\_\___|\__, |
#                               |___/ v1.2
# GitHub: https://github.com/SpyHoodle/bosskey


function refresh_statusbar() {
  case $1 in
    dwmblocks)
      # Refresh dwmblocks as it only updates when told so
      kill -35 $(pidof dwmblocks)
      ;;
  esac
}


while getopts "lmpur" options; do
  case $options in
    m)
      # Mute the volume
      pamixer --mute
      ;;

    p)
      # Pause any playing media
      playerctl pause
      ;;

    l)
      # Lock the screen using slock(1)
      slock
      ;;

    u)
      # Unmute the audio
      pamixer --unmute
      ;;

    r)
      # Refresh a dwmblocks status bar
      refresh_statusbar "dwmblocks"
      ;;

  esac
done
