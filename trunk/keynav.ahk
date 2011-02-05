;
; AutoHotkey Version: 1.x
; Language:       English
; Platform:       Win9x/NT
; Author:         A.N.Other <myemail@nowhere.com>
;
; Script Function:
;	Template script (you can customize this template by editing "ShellNew\Template.ahk" in your Windows folder)
;

;Winset, TransColor, EEAA99
#SingleInstance force

#IfWinActive,_mouse
h::
	scWidth /= 2
	WinMove,_keynav,,%posX%,%posY%,%scWidth%,%scHeight%,,
	MoveMouse(posX,posY,scWidth, scHeight)
	Return
l::
	scWidth /= 2
	posX += %scWidth%
	WinMove,_keynav,,%posX%,%posY%,%scWidth%,%scHeight%,,
	MoveMouse(posX,posY,scWidth, scHeight)
	Return
j::
	scHeight /= 2
	posY += %scHeight%
	WinMove,_keynav,,%posX%,%posY%,%scWidth%,%scHeight%,,
	MoveMouse(posX,posY,scWidth, scHeight)
	Return
k::
	scHeight /= 2
	WinMove,_keynav,,%posX%,%posY%,%scWidth%,%scHeight%,,
	MoveMouse(posX,posY,scWidth, scHeight)
	Return
`;::
	Gui,destroy
	Gui,2:destroy
	MouseMove, %mouseX%, %mouseY%
	Return

Esc::
	Gui,destroy
	Gui,2:destroy
	return

Space::
	Gui,destroy
	Gui,2:destroy
	Sleep,20
	MouseMove, %mouseX%, %mouseY%
	MouseClick,Left
	Return
+Space::
	Gui,destroy
	Gui,2:destroy
	Sleep,20
	MouseMove, %mouseX%, %mouseY%
	MouseClick,Left,,,2
	Return
#IfWinActive

; Generated using SmartGUI Creator 4.0
^;::
CoordMode,Mouse,Screen
Gui,+AlwaysOnTop -Caption +ToolWindow
Gui,margin,0,0
Gui, Show, W%A_ScreenWidth% H%A_ScreenHeight%, _keynav
WinSet,Transparent,170,_keynav
scWidth = %A_ScreenWidth%
scHeight = %A_ScreenHeight%
posX = 0
posY = 0
mouseX := scWidth/2
mouseY := scHeight/2
Gui,2:+AlwaysOnTop -Caption +ToolWindow
Gui,2:Color,FF0000
Gui,2:Show,W25 H25,_mouse
WinSet,Region,0-0 W25 H25 E,_mouse
Return

GuiClose:
ExitApp

MoveMouse(x, y, width, height)
{
	global mouseX
	global mouseY
	width /= 2
	height /= 2
	x += width
	y += height
	mouseX := x
	mouseY := y
	If (width > 25 And height > 25)
	{
		WinMove,_mouse,,%x%, %y%
	}
	Else
	{
		WinSet,Region,,_mouse
		WinMove,_mouse,,%x%,%y%,10,10
	}
}