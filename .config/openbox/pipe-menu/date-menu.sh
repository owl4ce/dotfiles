#!/usr/bin/env bash

# The script base is taken from http://openbox.org/wiki/Openbox:Pipemenus
 
# This is in the public domain.  Honestly, how can you claim anything to something
# this simple?
#
# Outputs a simple openbox pipe menu to display the date, time, and calendar.
# You need 'date' and 'cal'.  You should have these.  Additionally, the calendar
# only appears properly formated if you use a mono spaced font.

# Outputs the selected row from the calender output.
# If you don't use a mono spaced font, you would have to play with spacing here.
# It would probably involve a very complicated mess.  Is there a way to force a
# different font per menu?

function calRow() {
    cal | gawk -v row=$1 '{ if (NR==row) { print $0 } }'
}
 
# WRITING TO PIPEMENU
cat << EOFMENU
<openbox_pipe_menu>
    <separator label="`date +%A\ %I\:%M\ %p`" />
    <item label="`date +%B\ %d,\ %Y`" />
    <separator />
    <item label="`calRow 2`" />
    <item label="`calRow 3`" />
    <item label="`calRow 4`" />
    <item label="`calRow 5`" />
    <item label="`calRow 6`" />
    <item label="`calRow 7`" />
</openbox_pipe_menu>
EOFMENU
