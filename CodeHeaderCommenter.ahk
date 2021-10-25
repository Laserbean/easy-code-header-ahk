#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance Force

comm := ""
checkchange := ""
;checknum = 0
maxeq = 45

Gui, New, , Easy Comment Section Header
Gui, Add, Text,, Enter the comment symbol in the text box below. Alt+c to use.
Gui, Add, Edit, w120 vTextEnteredID, //


;Gui, Add, Text,, Enter the width of the bar thing
;Gui, Add, Edit
;Gui, Add, UpDown, w120 vNumID Range1-40, 30



Gui, Add, Button, gOkayed, Okay


Gui, Add, Text, vOkayID, Selected!
gui, show, W300 H150 Center, 
GuiControl, hide, OkayID
Return

Okayed:
;gui, submit, vNumID
GuiControlGet, comm,,TextEnteredID
;GuiControlGet, maxeq,,vNumID

;checkchange := ""

GuiControl, show, OkayID
;GuiControlGet, checknum,,vNumID
GuiControlGet, checkchange,,TextEnteredID

;msgbox, , , %checknum%~%maxeq%

while(checkchange == comm)
; and checknum == maxeq)
{
	GuiControlGet, checkchange,,TextEnteredID
	;GuiControlGet, checknum,,vNumID
	
}

GuiControl, hide, OkayID
Return

GuiClose:
ExitApp
Return

!c::
{ 
	clip := ClipBoard
	send, {home}
	sleep, 100
	send, +{end}
	sleep, 100
	Send, ^c
	sleep, 100
	
	;StringReplace, OutputVar, ClipBoard, %A_Space%,, All UseErrorLevel
	newClip := ClipBoard
	
	IfEqual, clip, %newClip%
	{
		newClip := ""
	}
	
	
	Length := StrLen(newClip)
	equalnum := maxeq-Length/2
	
	equals := strRep("=", equalnum)
	equals1 := strRep("=", equalnum+1)
	;comm := "%"
	if (mod(Length, 2) == 1) {
		final := comm equals newClip equals1
	}
	else
	{
		final := comm equals newClip equals
	}
	Send, %final%
	;MsgBox % "Spaces: " ErrorLevel "`nChars: " (Length-ErrorLevel) "`n Line: " test
	Clipboard := clip
}

strRep(string, times)
{
    loop % times
        output .= string
    return output
}