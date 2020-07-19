#!/usr/bin/env bash

# The script base is taken from http://openbox.org/wiki/Openbox:Pipemenus

Battery=$(acpi -b | grep "Battery" | sed -nr '/Battery/s/.*(\<[[:digit:]]+%).*/\1/p')
Thermal=$(acpi -t | grep "Thermal" | sed -nr "s/.*(\<[[:digit:]]+\.[[:digit:]]) degrees.*/\1°C/p" )
echo "<openbox_pipe_menu>"
echo "<separator label=\"Battery: $Battery\" />"
echo "<item label=\"$Thermal\" />"
echo "</openbox_pipe_menu>"
