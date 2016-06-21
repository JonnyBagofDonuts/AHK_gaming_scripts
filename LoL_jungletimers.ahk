#InstallKeybdHook
SendMode Event
#UseHook
ToolTip, (Shift+F1) Press when game starts!, 800, 800
MStoM(ms) { ; Convert Milliseconds to a string of minutes and seconds
	Orig := A_FormatFloat ; Store previous Float format
	SetFormat, Float, 0.1 ; One decimal place
	m := ms / 1000 / 60 ; minutes
	m := SubStr(m, 1, StrLen(m)-2) ; Remove decimal - No rounding for minutes!
	SetFormat, Float, 0.0 ; No decimals for seconds!
	s := (ms / 1000) - (m * 60) ; subtract minutes from total seconds
	SetFormat, Float, %Orig% ; Restore previous Float format
	Return m . "m " . s . "s" ; Return minutes and seconds as a string
}

~+F1::
StartTime := A_TickCount
ElapsedTime := A_TickCount - StartTime
owo:=MStoM(ElapsedTime+100000)
owr:=MStoM(ElapsedTime+100000)
ogo:=MStoM(ElapsedTime+100000)
obl:=MStoM(ElapsedTime+115000)
orb:=MStoM(ElapsedTime+115000)
ewo:=MStoM(ElapsedTime+100000)
ewr:=MStoM(ElapsedTime+100000)
ego:=MStoM(ElapsedTime+100000)
ebl:=MStoM(ElapsedTime+115000)
erb:=MStoM(ElapsedTime+115000)
drake:=MStoM(ElapsedTime+150000)
baron:=MStoM(ElapsedTime+900000)
Goto, Clock
Return

Clock:
ElapsedTime := A_TickCount - StartTime
Elapsed := MStoM(ElapsedTime)
ToolTip, Gametime:	 [ %Elapsed% ]`n(F1)   Own Bluebuff:	%obl%`n(F2)   Own RedBuff:	%orb%`n(F3)   Enemy Bluebuff:	%ebl%`n(F4)   Enemy RedBuff:	%erb%`n(F11) Dragon:		%drake%`n(F12) Baron:		%baron%`n(F5) Say timers in chat, 800, 800
SetTimer, Clock, 1000
Return

~F1::
obl:= MStoM(ElapsedTime+300000)
Goto, Clock
Return

~F2::
orb:= MStoM(ElapsedTime+300000)
Goto, Clock
Return

~F3::
ebl:= MStoM(ElapsedTime+300000)
Goto, Clock
Return

~F4::
erb:= MStoM(ElapsedTime+300000)
Goto, Clock
Return

~F11::
drake:= MStoM(ElapsedTime+360000)
Goto, Clock
Return

~F12::
baron:= MStoM(ElapsedTime+420000)
Goto, Clock
Return

~F5::
Send Ob:%obl% Or:%orb% Eb:%ebl% Er:%erb% Drake:%drake% Baron:%baron%