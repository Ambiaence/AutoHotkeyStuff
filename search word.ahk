; Define a hotkey to trigger the operation

Context := "dormant"
LingqTitle := ""

#IF (Context = "dormant")
^!v::AppendToClipboardText()
^!g::chatgpt()
^!j::Record()
^!l::next()
^!h::back()
^!k::play()
^!m::GrabWord()
#IF

#IF (Context = "ready")
v::AppendToClipboardText()
g::chatgpt()
j::Record()
l::next()
h::back()
k::play()
#IF

^r::  ; Press Ctrl+R to trigger a script reload
messege := "Reloaded the lingq script."
MsgBox, Reloaded
Reload  ; Reload the current script
return

^!d::
    Context := "dormant"
return

^i::
    Context := "ready"
    WinActivate, %LingqTitle%
return

enter_dormant_mode() {
    Context := "dormant"
}
play() {
    Click, 690, 300
}

next() {
    Click, 1350, 630
    sleep, 200
    Click, 690, 300
}

back() {
    Click, 30, 630
    sleep, 200
    Click, 690, 300
}
chatgpt() {
    Global Context
    Context := "dormant"
    url:= "chat.openai.com/"
    Send, ^n
    sleep, 300
    SendInput, %url%	
    Send, {Enter}	
}


AppendToClipboardText() {
    Global Context
    Context := "dormant"
    InputBox, Clipboard, What german word?
    stringToAppend := "https://context.reverso.net/translation/german-english/"
    dictString:= "https://www.collinsdictionary.com/dictionary/german-english/"

    ; Get the current clipboard content

    ; Read the clipboard content and append the string
    reverso := stringToAppend Clipboard 
    dictString := dictString Clipboard 

    ; Press Control+N
    Send, ^n
    sleep, 800
    ; Type the modified text without changing the clipboard
    ;SendInput, %dictString%	
    ;sleep, 400
    ;Send, {Enter}
    ;sleep, 400
    ;Send, ^t
    ;sleep, 400
    SendInput, %reverso%
    sleep, 400	
    Send, {Enter}
}

GrabWord() {
    send, {F9}
    sleep, 200
    WinActivate, Add
    sleep, 1000
    send, ^v
}

Record() {
    Global Context
    Context := "dormant"
	Send, {F3}
	sleep, 2000
	Click, 690, 300
    WinActivate, Add
}

F12::
    Global LingqTitle
    WinGetTitle, LingqTitle, A
    MsgBox, "%LingqTitle%"
return
