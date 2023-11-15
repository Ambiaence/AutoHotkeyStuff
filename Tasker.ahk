Context := "markbrowser"

CurrentFlow := 0

#IF (Context = "markbrowser")
    ^n::MarkBrowser()
#IF

#IF (Context = "marknotes")
    ^n::MarkNotes()
#IF

#IF (Context = "locked")
    !Tab::return
    ^!p::LockOut()
    ^!u::unlock()
#IF

#IF (Context = "study")
    ^!p::LockOut()
#IF

; Functions to stop execution of a thread when another thread has started.
;function_start() {
;    global CurrentFlow
;    CurrentFlow := CurrentFlow + 1
;}
;
;should_exit(FlowInQuestion) {
;    global CurrentFlow
;    if (FlowInQuestion = CurrentFlow) {
;        return false
;    }
;    Exit
;}
;;


MarkBrowser() {
    global browserid
    global Context
    browserid := ""
    WinGet, browserid, PID, A
    MsgBox, Great Now Select Your Notes . %browserid%
    Context := "marknotes"
}

MarkNotes() {
    global notesid
    global Context
    notesid := ""
    WinGet, notesid, PID, A
    Context := "study"
    BeginStudy()
}

BeginStudy() {
    global minutes
    global notesid
    global browserid
    global Context

    InputBox, minutes, how long for this task??
    time := minutes * 1000 * 60 * -1
    SetTimer, LockOut, %time%
}

LockOut() {
    global Context
    global notesid
    Context := "locked"
    WinActivate, ahk_pid %notesid%
    send, {@}
    send, {s}
}

unlock() {
    SetTimer, LockOut, Off
    temp := ""
    InputBox, temp, Did you accopmlish your task?
    if (temp != "logos") {
        Exit
    }
    InputBox, temp, Did you write what you are going to do? 
    if (temp != "logos") {
        Exit
    }
    InputBox, temp, Did you you reset your alarm? 
    if (temp != "logos") {
        Exit
    }
    InputBox, temp, Did you start music? 
    if (temp != "logos") {
        Exit
    }
    global Context
    Context := "study"
    BeginStudy()
}