~t::
GetKeyState, capslockstate, Capslock, T
If capslockstate=D
{
checkt:
GetKeyState, tstate, T
If tstate=D
{
send {shift down}
sleep 10
send {2 down}
Goto, checkt
}
else
{
send {shift down}
sleep 10
send {2 down}
sleep 10
send {2 up}
sleep 100
send {w down}
sleep 10
send {w up}
send {shift up}
return
}
}
else
{
return
}
Juke skillsh