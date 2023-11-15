; Define the string to append
stringToAppend := " AppendedText"

; Define a hotkey to trigger the append operation
^!v::AppendToClipboardText()

AppendToClipboardText() {
    ; Get the current clipboard content
    Clipboard := ClipboardAll

    ; Append the string to the clipboard content
    NewClipboard := Clipboard . stringToAppend

    ; Update the clipboard with the modified text
    Clipboard := NewClipboard
    ClipboardAll := Clipboard

    ; Paste the modified clipboard content
    Send, ^v
}
