#!/usr/bin/env bash

# Requires Material (Icomoon) Font
status="$(mpc status)"

if [[ $status == *"[playing]"* ]]; then
    echo ""
else
    echo ""
fi
