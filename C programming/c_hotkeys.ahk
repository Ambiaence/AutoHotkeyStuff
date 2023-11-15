$i::
{
if GetKeyState("CapsLock", "T") {
    Send {#} 
    SendInput include 
    SetCapsLockState off
} else  {
    Send, i
}
}
return

$s::
{
if GetKeyState("CapsLock", "T") {
    if GetKeyState("Enter", "P") {
        SendInput static
    } else {
        SendInput short 
    }
    SetCapsLockState, Off
} else {
    SendInput s
}
}
return

$d::
{
if GetKeyState("CapsLock", "T") {
    if GetKeyState("Enter", "P") {
        SendInput double
    } else {
        SendInput delete 
    }
    SetCapsLockState, Off

} else  {
    Send, d
}
}
return

$p::
{
if GetKeyState("CapsLock", "T") {
    SendInput private 
    SetCapsLockState off
} else  {
    Send, p
}
}
return

$enter:: 
{
if GetKeyState("CapsLock", "T") {
} else {
    send, {enter}
}
}