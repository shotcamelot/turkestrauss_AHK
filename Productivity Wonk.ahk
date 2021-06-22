^!+F12:: ; searches the highlighted text in browser or file explorer (if whole file extension)

OpenHighlighted()
{
	MyClipboard := "" ; Clears variable

	Send, {ctrl down}c{ctrl up} ; More secure way to Copy things
	sleep, 50 ; Delay
	MyClipboard := RegexReplace( clipboard, "^\s+|\s+$" ) ; Trim additional spaces and line return
	sleep, 50
	MyStripped := RegexReplace(MyClipboard, " ", "") ; Removes every spaces in the string.
	
	StringLeft, OutputVarUrl, MyStripped, 8 ; Takes the 8 firsts characters
	StringLeft, OutputVarLocal, MyStripped, 3 ; Takes the 3 first characters
	sleep, 50
	
	if (OutputVarUrl == "http://" || OutputVarUrl == "https://")
	{
		TrayTip,, URL: "%MyClipboard%" ;
		Sleep,50
		Run, "%MyStripped%"
		Return
	}
	else if (OutputVarLocal == "C:/" || OutputVarLocal == "C:\" || OutputVarLocal == "Z:/" || OutputVarLocal == "Z:\" || OutputVarLocal == "R:/" || OutputVarLocal == "R:\" ||)
	{
		TrayTip,, Windows: "%MyClipboard%" ;
		Sleep,50
		Run, %MyClipboard%
		Return
	}
	else
	{
		TrayTip,, GoogleSearch: "%MyClipboard%" ;
		Sleep,50
		Run, "http://www.google.com/search?q=%MyClipboard%"
		Return
	}
	Return
}


^!+F11:: ; Copy alt tab paste

Send {lcontrol down}c{lcontrol up}
ClipWait
Send {lalt down}{tab}{lalt up}
Sleep, 50
Send {lcontrol down}v{lcontrol up}
Return

^!+F13::

Run, "OUTLOOK.EXE" /c ipm.note ; opens new email
Return

^!+F14::

Run, "OUTLOOK.EXE" /c ipm.appointment ; opens new calendar event
Return

^!+F15:: ; Dates a word document in clio

Sleep, 100
Send {tab}
Sleep, 50
Send {left}
Sleep, 50
Send 2021-06-22 -{space} 
Sleep, 50
Send {tab}
Sleep, 50
Send {space}
Sleep, 50
Send {tab}{tab}{tab}{tab}{tab}{tab}{tab}
Sleep, 50
Send {enter}
Return

^!+F21:: ; Dates a PDF document in clio

Sleep, 100
Send {tab}
Sleep, 50
Send {left}
Sleep, 50
Send 2021-06-22 -{space} 
Sleep, 50
Send {tab}{tab}
Sleep, 50
Send {space}
Sleep, 50
Send {tab}{tab}{tab}{tab}{tab}{tab}
Sleep, 50
Send {enter}
Return



^!+F16:: ; Opens efiling email, tabs to link, opens link

Send {enter}
Sleep, 50
Send {tab}
Send {enter}
Return


^!+F17:: ; Prints, enter

Send {lcontrol down}p{lcontrol up}
Sleep, 1000
Send {enter}
Return

^!+F18:: ; Copy alt tab paste right one cell

Send {lcontrol down}c{lcontrol up}
ClipWait
Send {lalt down}{tab}{lalt up}
Sleep, 50
Send {lcontrol down}v{lcontrol up}
Sleep, 50
Send {right}
Return

^!+F19:: ; Copy, alt tab, paste, to the start of next row down

Send {lcontrol down}c{lcontrol up}
ClipWait
Send {lalt down}{tab}{lalt up}
Sleep, 50
Send {lcontrol down}v{lcontrol up}
Sleep, 50
Send {enter}{left}{left}{left}
Return


^!+F20:: ; New word doc

Run, "winword" /w
Return

^!+F22:: ; Word: Print Envelope

Send {lalt down}me{lalt up}
Return

^!+F24:: ; Open AHK script in editor

Edit
Return

^!+F23:: ; Outlook: opens file browser for attachments 

Send {lalt down}hafb{lalt up}
Return
