;
; File encoding:  UTF-8
; Platform:  Windows XP/Vista/7
; Author:    fincs
;
; GenDocs v3.0-alpha004
;

#NoEnv
#NoTrayIcon
#SingleInstance	Ignore
SendMode Input
SetWorkingDir, %A_ScriptDir%

FileEncoding, UTF-8

DEBUG = 1
VER = 3.0-alpha004
_DefaultFName =

if DEBUG
	_DefaultFName := A_ScriptDir "\Demo\TestLib.ahk"

; Check if the script was passed any parameters
if (A_Args.Length() > 0)
{
	; Set CUI (Command-Line user interface) to true
	CUI := true
	file = A_Args[1]
	CreateCHM := false
	msgbox %file%
	if A_Args.Length() > 1
	if file = /chm
	{
		file = A_Args[2]
		msgbox %file%
		CreateCHM := true
	}
	FileAppend, GenDocs v%VER%`n`n, *
	gosub DocumentCUI
	ExitApp
}

; Create the main Gui
Gui, +AlwaysOnTop +hwndguiHnd
Gui, Add, Text, , Select your script
Gui, Add, Edit, section w280 vfile 
Gui, Add, Button, ys gSelectFile, ...
GuiControl,, file, %_DefaultFName%
Gui, Add, Text, xs, Select your documentation destination
Gui, Add, Edit, xs section +ReadOnly w280 vdestination
Gui, Add, Button, ys gSelectFolder, ...
Gui, Add, CheckBox, section xs vCreateCHM Disabled, Generate CHM file (not implemented yet)
Gui, Add, Button, xs+125 gDocument vdocBtn, &Document
Gui, Add, StatusBar
Util_Status("Ready.")
Gui, Show,, GenDocs v%VER%
return

; Handle closing of the Gui
GuiClose:
ExitApp

; Handle files being dragged and dropped onto the Gui.
; Behavior is to copy the name of the file into the "file" control
GuiDropFiles:
selected =
Loop, Parse, A_GuiEvent, `n
{
    GuiControl,, file, %A_LoopField%
	break
}
return

; Handle the user pressing the "..." button next to the file edit field
SelectFile:
Gui, +OwnDialogs
FileSelectFile, temp, 1,, Select AutoHotkey script, AutoHotkey scripts (*.ahk)

if temp =
	return
SplitPath, temp,, tempFolder
GuiControl,, file, %temp%
GuiControl,, destination, %tempFolder%
GuiControl -ReadOnly, destination
return

SelectFolder:
Gui, +OwnDialogs

FileSelectFolder, temp,*%tempFolder%\,,Select a destination

if temp =
	return
temp := RegExReplace(temp, "\\$")
GuiControl,, destination, %temp%
return

; When the user hits the "Document" button, submit the forms and perform the generation of documentation
Document:
Gui, Submit, NoHide
Gui, +OwnDialogs


DocumentCUI:
; Get the directory of the file to document and store it in `filedir`
SplitPath, file,, filedir
imglist := []
; Retrieve all documentation comments from the file (and any included files)
docs := RetrieveDocs(file)
if !docs.contents.MaxIndex()
{
	Util_Status("No documentation could be found!", 1)
	return
}

; Generate the documentation files using the file and the retrieved docs
GenerateDocs(file, destination, docs)
Util_Status("Done!")
if !CUI
	SoundPlay, *64
return

Util_Status(ByRef t, err=0)
{
	global CUI
	if !CUI
	{
		SB_SetText(t)
		if err
			SoundPlay, *16
	}else
	{
		FileAppend, %t%`n, *
		if err
			ExitApp 1
	}
}
