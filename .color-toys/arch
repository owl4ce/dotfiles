#!/bin/sh
  
# Author: Ivo
# Source: http://crunchbang.org/forums/viewtopic.php?pid=237794#p237794
# ANSI Color -- use these variables to easily have different color
#    and format output. Make sure to output the reset sequence after 
#    colors (f = foreground, b = background), and use the 'off'
#    feature for anything you turn on.

initializeANSI()
{
  esc=""

  redf="${esc}[31m";     greenf="${esc}[32m"
  yellowf="${esc}[33m"   bluef="${esc}[34m";   
  cyanf="${esc}[36m";    purplef="${esc}[35m"   
                      
  boldon="${esc}[1m";    
  reset="${esc}[0m"
}

# note in this first use that switching colors doesn't require a reset
# first - the new color overrides the old one.

initializeANSI

cat << EOF 
  
${boldon}${redf}        ■      ${boldon}${greenf}        ■      ${boldon}${yellowf}        ■     ${boldon}${bluef}         ■       ${boldon}${purplef}       ■      ${boldon}${cyanf}        ■   ${reset}
${boldon}${redf}       ■■■     ${boldon}${greenf}       ■■■     ${boldon}${yellowf}       ■■■    ${boldon}${bluef}        ■■■      ${boldon}${purplef}      ■■■     ${boldon}${cyanf}       ■■■  ${reset}
${boldon}${redf}      ■■■■■    ${boldon}${greenf}      ■■■■■    ${boldon}${yellowf}      ■■■■■   ${boldon}${bluef}       ■■■■■     ${boldon}${purplef}     ■■■■■    ${boldon}${cyanf}      ■■■■■ ${reset}
${redf}     ■(   )■   ${greenf}     ■(   )■   ${yellowf}     ■(   )■   ${bluef}     ■(   )■    ${purplef}    ■(   )■   ${cyanf}     ■(   )■   ${reset}
${redf}    ■■■■ ■■■■  ${greenf}    ■■■■ ■■■■  ${yellowf}    ■■■■ ■■■■  ${bluef}    ■■■■ ■■■■   ${purplef}   ■■■■ ■■■■  ${cyanf}    ■■■■ ■■■■  ${reset}
${redf}   ■■       ■■ ${greenf}   ■■       ■■ ${yellowf}   ■■       ■■ ${bluef}   ■■       ■■  ${purplef}  ■■       ■■ ${cyanf}   ■■       ■■ ${reset}
 
EOF
