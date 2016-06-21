
/*
http://AHKscript.org
Trinity Trifecta
disabled well of life
energy vamp all the time (420ms)
link 12.5s always up  (12500ms)
blessing every 5min  (300000ms)

																		*/

																		#Persistent
SendMode Input
F1::
;-=-=-=-=-=-=-=-=-= Variables =-=-=-=-=-=-=-=-=
;		Keybinds
Key1 = 
Key2 = u
Key3 = 
Key4 = 
custom1 = ?
;		Ability Switches
Switch1 = 0
Switch2 = 1
Switch3 = 0
Switch4 = 1
SwitchA = 0
;		Cast Delay (ms)
Delay1 = 1000
Delay2 = 150     ;fast freq sleeps commented out
Delay3 = 5000  ;5s
Delay4 = 300000 ;5min
DelayA = 1000000
;		Cast Frequency
Freq1 =100
Freq2 =50  ;ev fast since short delay nevermind commented out freq
Freq3 =150 
Freq4 =150
FreqA =?
;-=-=-=-=-=-=-=-=-= /Variables =-=-=-=-=-=-=-=-=zzz
;		Ability execution functions
;function timers
SetTimer, Ability1, %Delay1%
SetTimer, Ability2, %Delay2%
SetTimer, Ability3, %Delay3%
SetTimer, Ability4, %Delay4%
SetTimer, CustomA, %DelayA%
return
;functions
Ability1:
if (%Switch1% != 0){
send %Key1%
sleep %Freq1%
send %Key1%
sleep %Freq1%
send %Key1%
return
}
Ability2:
if (%Switch2% != 0){
send %Key2%
;sleep %Freq2%
;send %Key2%
;sleep %Freq2%
;send %Key2%
return
}
Ability3:
if (%Switch3% != 0){
send %Key3%
sleep %Freq3%
send %Key3%
sleep %Freq3%
send %Key3%
return
}
Ability4:
if (%Switch4% != 0){
send %Key4%
sleep %Freq4%
send %Key4%
sleep %Freq4%
send %Key4%
return
}
CustomA:
if (%SwitchA% != 0){
send %custom1%
return
}

return
;Teh End
;pause
Pause::Pause


