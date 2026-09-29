$
:start
let "px" "0"
let "py" "0"
let "ps" "4"
let "x" "100"
let "y" "100"
let "score" "0"
let "lerp_speed" "20"
let "sd" "0"
let "dead" "0"

# main
:loop
clear

# movement
input.state "keyboard" "up" "w"
jump "2" "equal" "!up" "0"
add +!py+ +!ps+ =py=
input.state "keyboard" "down" "s"
jump "2" "equal" "!down" "0"
sub -!py- -!ps- =py=
input.state "keyboard" "right" "d"
jump "2" "equal" "!right" "0"
add +!px+ +!ps+ =px=
input.state "keyboard" "left" "a"
jump "2" "equal" "!left" "0"
sub -!px- -!ps- =px=
jump "3" "not greater" "!sd" "10"
add +!score+ +1+ =score=
let "sd" "0"

goto "game.over" "equal" "!dead" "1"
call "set.hitbox"
call "et"
call "upd.ui"
call "render"
delay "0.016"
add +!sd+ +1+ =sd=
goto "loop"

func//render
text "!px" "!py" "#ffffff" "150" "*"
text "!x" "!y" "#ff0000" "150" "O"
text "0" "150" "#ffffff" "100" "!ui"
return


func//et
let "mx" "!px"
let "my" "!py"

sub -!mx- -!x- =dist_x=
div %!dist_x% %!lerp_speed% =vel_x=
add +!x+ +!vel_x+ =x=

sub -!my- -!y- =dist_y=
div %!dist_y% %!lerp_speed% =vel_y=
add +!y+ +!vel_y+ =y=

return

func//upd.ui
let "ui" ""
concat "score : " "!score" "ui"
return

func//set.hitbox
let "dead" "0"
let "hbx1" "!px"
let "hby1" "!py"
let "hbx2" "!px"
let "hby2" "!py"

add +!hbx1+ +8+ =hbx1=
add +!hby1+ +8+ =hby1=

sub -!hbx2- -8- =hbx2=
sub -!hby2- -8- =hby2=

jump "5" "not less" "!x" "!hbx1"
jump "4" "not less" "!y" "!hby1"
jump "3" "not greater" "!x" "!hbx2"
jump "2" "not greater" "!y" "!hby2"
let "dead" "1"

return

:game.over
clear
text "0" "0" "#ff0000" "150" "GAME OVER"
delay "0.5"
text "0" "-50" "#202020" "150" "restarting in 1 second"
delay "1"
goto "start"
