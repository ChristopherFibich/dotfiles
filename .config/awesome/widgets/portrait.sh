#!/bin/sh

#portrait (left)

xrandr -o left
xinput set-prop "ELAN9038:00 04F3:261A" --type=float "Coordinate Transformation Matrix" 0 -1 1 1 0 0 0 0 1
xinput set-prop "ELAN9038:00 04F3:261A Stylus Pen (0)" --type=float "Coordinate Transformation Matrix" 0 -1 1 1 0 0 0 0 1
xinput set-prop "ELAN9038:00 04F3:261A Stylus Eraser (0)" --type=float "Coordinate Transformation Matrix" 0 -1 1 1 0 0 0 0 1
xinput set-prop "Microsoft Surface Type Cover Touchpad" --type=float "Coordinate Transformation Matrix" 0 -1 1 1 0 0 0 0 1

