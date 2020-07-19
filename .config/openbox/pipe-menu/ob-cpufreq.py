#!/usr/bin/env python2

# The script base is taken from http://openbox.org/wiki/Openbox:Pipemenus

# CPU FREQUENCY INFO
file = open('/sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq','r')
tmp = file.readline()
minfreq = int(tmp) / 1000
file.close()

file = open('/sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq','r')
tmp = file.readline()
maxfreq = int(tmp) / 1000
file.close()

file = open('/sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq','r')
tmp = file.readline()
curfreq = int(tmp) / 1000
file.close()

# TEMPERATURES
# SET YOUR TEMPERATURE ZONE TO YOUR WITH THIS COMMAND
# 
# for i in /sys/class/hwmon/hwmon*/temp*_input; do echo "$(<$(dirname $i)/name): $(cat ${i%_*}_label 2>/dev/null || echo $(basename ${i%_*})) $(readlink -f $i)"; done
file = open('/sys/devices/pci0000:00/0000:00:18.3/hwmon/hwmon2/temp1_input','r')
tmp = file.readline()
cputemp = int(tmp) / 1000
file.close()

file = open('/sys/devices/pci0000:00/0000:00:01.0/hwmon/hwmon5/temp1_input','r')
tmp = file.readline()
gputemp = int(tmp) / 1000
file.close()

# WRITING TO PIPEMENU
print "<openbox_pipe_menu>"
print "  <separator label=\"CPU FREQUENCY\" />"
print "  <item label=\"Minimum: %dMHz\"/>" % minfreq
print "  <item label=\"Maximum: %dMHz\"/>" % maxfreq
print "  <item label=\"Current: %dMHz\"/>" % curfreq
print "  <separator label=\"HW TEMPERATURE\" />"
print "  <item label=\"CPU : %dc\"/>" % cputemp
print "  <item label=\"GPU : %dc\"/>" % gputemp
print "</openbox_pipe_menu>"
