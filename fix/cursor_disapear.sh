FIX WT CURSOR DISAPEAR
echo -en "\e[?25h"
setterm -cursor on
tput cnorm
printf "\e[5 q"
