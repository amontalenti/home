#!/bin/bash
echo "[DEBUG] XDG_SESSION_TYPE=$XDG_SESSION_TYPE"

if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    echo "[DEBUG] Detected Wayland session"
    echo "[DEBUG] Running: QT_QPA_PLATFORM=wayland flameshot gui"
    QT_QPA_PLATFORM=wayland flameshot gui

elif [ "$XDG_SESSION_TYPE" = "x11" ]; then
    echo "[DEBUG] Detected X11 session"

    DPI=$(xrdb -query | grep Xft.dpi | sed -e 's/Xft\.dpi:[ \t]*//g')

    echo "[DEBUG] DPI: $DPI"

    if [ "$DPI" = "192" ]; then
        echo "[DEBUG] HiDPI (DPI=192), running with QT_SCALE_FACTOR=0.5"
        # this is only needed for flameshot 13.x;
        # in flameshot 12.x, it handles it properly
        #sh -c -- "QT_SCALE_FACTOR=0.5 flameshot gui"
        sh -c -- "flameshot gui"
    else
        echo "[DEBUG] DPI=$DPI, running normally"
        sh -c -- "flameshot gui"
    fi

else
    echo "[ERROR] Unknown session type: $XDG_SESSION_TYPE"
    exit 1
fi
