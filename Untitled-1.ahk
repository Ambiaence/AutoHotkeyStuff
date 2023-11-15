Gui +LastFound  ; Ensure the GUI window is the active window for #IfWinActive

Gui, Add, Button, Default, Trigger Function
Gui, Show
return

ButtonTriggerFunction:
; Define your AutoHotkey function here
MsgBox, The button was clicked, and the GUI is in focus.
return

#IfWinActive  ; Now, we apply the condition to the GUI
GuiClose:
ExitApp
