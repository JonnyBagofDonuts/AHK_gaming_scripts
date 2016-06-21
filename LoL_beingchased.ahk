~XButton1::
MouseGetPos, xpos, ypos
xpos2 := xpos-955
ypos2 := ypos-510
xa := 955+((150*ypos2)/(sqrt((xpos2)**2+(ypos2)**2)))
ya := 510+((-150*xpos2)/(sqrt((xpos2)**2+(ypos2)**2)))
MouseMove, xa, ya, 0
Click right
KeyWait, XButton1
MouseMove, xpos, ypos, 0
Click right
Return

~XButton2::
MouseGetPos, xpos, ypos
xpos2 := xpos-955
ypos2 := ypos-510
xa := 955+((-150*ypos2)/(sqrt((xpos2)**2+(ypos2)**2)))
ya := 510+((150*xpos2)/(sqrt((xpos2)**2+(ypos2)**2)))
MouseMove, xa, ya, 0
Click right
KeyWait, XButton2
MouseMove, xpos, ypos, 0
Click right
Return