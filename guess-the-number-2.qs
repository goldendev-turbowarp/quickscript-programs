$
let "lifes" "1"
rand "1" "100" =number=
clear

# main
text "0" "100" "#00a2ff" "150" "== guess the number =="
:loop

input "enter a number (1 - 100)" "input"
clear
text "0" "100" "#00a2ff" "150" "== guess the number =="
goto "win" "equal" "!input" "!number"
jump "2" "not less" "!input" "!number"
text "0" "0" "#202020" "150" "wrong! less."
jump "2" "not greater" "!input" "!number"
text "0" "0" "#202020" "150" "wrong! more."

goto "loop"


:win
clear
text "0" "0" "#00FF00" "200" "you won!"
exit "0"
