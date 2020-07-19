#!/bin/sh

# ANSI Color -- use these variables to easily have different color
#    and format output. Make sure to output the reset sequence after 
#    colors (f = foreground, b = background), and use the 'off'
#    feature for anything you turn on.
# Author: pfh
# Source: http://crunchbang.org/forums/viewtopic.php?pid=127737#p127737

initializeANSI()
{
  esc=""

  blackf="${esc}[30m";   redf="${esc}[31m";    greenf="${esc}[32m"
  yellowf="${esc}[33m"   bluef="${esc}[34m";   purplef="${esc}[35m"
  cyanf="${esc}[36m";    whitef="${esc}[37m"
  
  blackb="${esc}[40m";   redb="${esc}[41m";    greenb="${esc}[42m"
  yellowb="${esc}[43m"   blueb="${esc}[44m";   purpleb="${esc}[45m"
  cyanb="${esc}[46m";    whiteb="${esc}[47m"

  boldon="${esc}[1m";    boldoff="${esc}[22m"
  italicson="${esc}[3m"; italicsoff="${esc}[23m"
  ulon="${esc}[4m";      uloff="${esc}[24m"
  invon="${esc}[7m";     invoff="${esc}[27m"

  reset="${esc}[0m"
}

# note in this first use that switching colors doesn't require a reset
# first - the new color overrides the old one.

clear
initializeANSI

cat << EOF

 ${white}╔══════════════════════════════════════════════════════════════════╗
 ${white}║ ${redf}  ▄█ █▄${reset}    ${greenf}  ▄█ █▄${reset}    ${yellowf}  ▄█ █▄${reset}    ${bluef}  ▄█ █▄${reset}    ${purplef}  ▄█ █▄${reset}    ${cyanf}  ▄█ █▄${reset}   ${white}║
 ${white}║ ${boldon}${redf}▄█◄► ◄►█▄${reset}  ${boldon}${greenf}▄█◄► ◄►█▄${reset}  ${boldon}${yellowf}▄█◄► ◄►█▄${reset}  ${boldon}${bluef}▄█◄► ◄►█▄${reset}  ${boldon}${purplef}▄█◄► ◄►█▄${reset}  ${boldon}${cyanf}▄█◄► ◄►█▄${reset} ${white}║
 ${white}║ ${boldon}${redf}▀█    █▀${reset}  ${boldon}${greenf}▀█    █▀${reset}  ${boldon}${yellowf}▀█    █▀${reset}  ${boldon}${bluef}▀█    █▀${reset}  ${boldon}${purplef}▀█    █▀${reset}  ${boldon}${cyanf}▀█    █▀${reset} ${white}║
 ${white}║ ${redf}  ▀█ █▀${reset}    ${greenf}  ▀█ █▀${reset}    ${yellowf}  ▀█ █▀${reset}    ${bluef}  ▀█ █▀${reset}    ${purplef}  ▀█ █▀${reset}    ${cyanf}  ▀█ █▀${reset}   ${white}║
 ${white}╚══════════════════════════════════════════════════════════════════╝

EOF

