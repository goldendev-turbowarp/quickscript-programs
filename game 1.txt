let "x" "0";
let "y" "0";
let "mvx" "0";
let "mvy" "0";
let "main" "1";
let "pspeed" "4";

:loop;
clear;

input.state "keyboard" "up" "w";
input.state "keyboard" "down" "s";
input.state "keyboard" "left" "a";
input.state "keyboard" "right" "d";

mul *!up* *!pspeed* =up=;
mul *!down* *!pspeed* =down=;
mul *!left* *!pspeed* =left=;
mul *!right* *!pspeed* =right=;

sub -!up- -!down- =mvy=;
sub -!right- -!left- =mvx=;

add +!x+ +!mvx+ =x=;
add +!y+ +!mvy+ =y=;

call "render";
delay "0.016";
goto "loop" "!main";

func//render;
text "!x" "!y" "#00c1ff" "150" "O";
return;
