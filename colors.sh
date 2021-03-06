#!/bin/bash
#
#   http://tldp.org/HOWTO/Bash-Prompt-HOWTO/x329.html
#
#   This file echoes a bunch of color codes to the
#   terminal to demonstrate what's available.  Each
#   line is the color code of one forground color,
#   out of 17 (default + 16 escapes), followed by a
#   test use of that color on all nine background
#   colors (default + 8 escapes).
#

T='gYw'   # The test text

echo
echo "                " \
     "40m     41m     42m     43m     44m     45m     46m     47m"

for FG in m 1m $(for i in {30..37}; do echo "${i}m 1;${i}m"; done); do
    FGs="$(printf "%5s" "$FG")"
    echo -en " $FGs \033[$FG  $T  "
    for BG in {40..47}m; do
        echo -en "$EINS \033[$FG\033[$BG  $T  \033[0m"
    done
    echo
done

echo
echo 'Print these escapes prefixed with \033[.'
