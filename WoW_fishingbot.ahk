WinActivate, World of Warcraft
WinGetPos, X, Y, Width, Height, World of Warcraft
SearchBoxTopX := Round(Width / 4)
SearchBoxTopY := Round(Height / 4)
SearchBoxBottomX := Round(Width * 3 / 4)
SearchBoxBottomY := Round(Height * 4 / 7)

;GoSub ShowSearchArea 	;Used to show an rectangle arround 
			;SearchBoxTopX ,SearchBoxTopY,
			;SearchBoxBottomX,SearchBoxBottomY

;GoSub TestSend		;Used to test the send keys function,
			;if its not working, check for admin privilages.

;GoSub testmousecolors	;Used to test for the mouse color in two points
			;if its not the same, you probably got
			;hardware mouse enabled, disable it.

loop ; main loop (infinite)
{
	StartFishing()
	sleep, 2000
	if !MoveToBobber(SearchBoxTopX ,SearchBoxTopY,SearchBoxBottomX,SearchBoxBottomY)
	{
		sleep, 3000
		continue
	}
	if !GoToHotSpot()
	{
		sleep, 3000
		continue
	}
	if WaitForTrigger()
		mouseclick, right
	sleep, 3000
	;msgbox done
	;pause
}

WaitForTrigger()
{
	MouseGetPos, tx, ty
	ttx := tx + 2
	tty := ty + 2
	counter := 0
	PixelGetColor, Color1, %ttx%, %tty%
	loop 
	{
		sleep, 10
		PixelGetColor, Color2, %ttx%, %tty%
		if !CheckTolerance(Color1, Color2, 10)
		{
			;msgbox success
			return true
		}
		counter := counter + 1
		if counter > 280
			return false
	}
}
CheckTolerance(c1,c2,tol)
{
	b1 := (c1 >> 16) & 0xFF
	b2 := (c2 >> 16) & 0xFF
	g1 := (c1 >> 8) & 0xFF
	g2 := (c2 >> 8) & 0xFF
	r1 := c1 & 0xFF
	r2 := c2 & 0xFF
	;ListVars
	;Pause
	if abs(b1-b2) > tol
		return false
	if abs(g1-g2) > tol
		return false
	if abs(r1-r2) > tol
		return false
	return true
}
GoToHotSpot()
{
	MouseGetPos, tx, ty
	ttx := tx + 2
	tty := ty + 2
	PixelGetColor, Color1, %ttx%, %tty%
	ny := ty-7 
	nx := tx
	loop 
	{
		Mousemove, %nx%,%ny%,0
		sleep, 10
		nnx := nx+2
		nny := ny+2
		PixelGetColor, Color2, %nnx%, %nny%
		if !CheckTolerance(Color1, Color2, 100)
		{
			BTopY := ny
			break
		}
		ny := ny-7
		if abs(ny-ty) > 100
			return false
	}
	ny := ty+7
	loop 
	{
		Mousemove, %nx%,%ny%,0
		sleep, 10
		nnx := nx+2
		nny := ny+2
		PixelGetColor, Color2, %nnx%, %nny%
		if !CheckTolerance(Color1, Color2, 100)
		{
			BBottomY := ny
			break
		}
		ny := ny+7
		if abs(ny-ty) > 100
			return false
	}
	BMiddleY := round((BTopY+BBottomY)/2)+15
	;ListVars
	;Pause
	Mousemove, %nx%, %BMiddleY%
	asd := nx+2
	ssd := BMiddleY + 2
	PixelGetColor, Color1, %asd%, %ssd% 
	loop 
	{
		nx := nx-3
		Mousemove, %nx%, %BMiddleY% 
		sleep, 10
		nnx := nx+2
		nny := BMiddleY+2
		PixelGetColor, Color2, %nnx%, %nny%
		if !CheckTolerance(Color1, Color2, 100)
		{
			return true
		}
		if abs(nx-tx) > 100
			return false
	}
}
MoveToBobber(TopX , TopY, BottomX, BottomY)
{
	px:=TopX
	py:=TopY
	
	Mousemove, %px%,%py%,0
	sleep, 50
	nx:=px+2
	ny:=py+2
	PixelGetColor, Color1, %nx%, %ny%

	Loop
	{
		px := px + 30
		Mousemove, %px%,%py%,0
		sleep, 50
		nx:=px+2
		ny:=py+2
		PixelGetColor, Color2, %nx%, %ny%

		if !CheckTolerance(Color1, Color2, 100)
			return true
		if px > %BottomX%
		{
			py := py + 30
			px := TopX
			;return false
		}
		if py > %BottomY%
			return false
	}
}

StartFishing()
{
	sleep, 100
	send, {enter}
	sleep, 100
	send, /use fishing
	sleep, 100
	send, {enter}
}
TestSend:
sleep, 500
send, /sit
sleep, 100
send, {enter}
sleep, 500
return

ShowSearchArea:
settimer, rectangle, 100
Counter := 0
Loop {
Counter := Counter + 1
}
return

rectangle:
drawrect(SearchBoxTopX ,SearchBoxTopY,SearchBoxBottomX,SearchBoxBottomY)
return

drawrect(x1,y1,x2,y2,color=0x0000ff)
{

   guiID := WinExist()
   hdc := DllCall("GetDC", "UInt", guiID, "UInt")
   ps_Dash:=0
   hPen := DllCall("CreatePen", "Int",PS_DASH, "Int", 4, "Int", color, "UInt")
   objB := DllCall("SelectObject", "UInt", hdc, "UInt", brush, "UInt")
   objP := DllCall("SelectObject", "UInt", hdc, "UInt", hPen, "UInt")
   DllCall("Rectangle", "UInt", hdc, "Int", x1, "Int", y1, "Int", x2, "Int", y2)
}

testmousecolors:
loop {
MouseGetPos, tx, ty
nnx := tx + 12
nny := ty + 12
PixelGetColor, Color11, %nnx%, %nny%
msgbox %color11%
sleep, 5000
}
return