#!/usr/bin/env bash

case "$1" in
    toggle)
        if ps -e | grep "[w]f-recorder"; then
            pkill wf-recorder
        else
            wf-recorder -f $HOME/out.mp4
        fi
        ;;
    status)
        if ps -e | grep "[w]f-recorder"; then
            echo "⏺ REC"
        else
            echo "⏹ IDLE"
        fi
        ;;
esac
