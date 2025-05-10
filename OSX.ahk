; --------------------------------------------------------------
; NOTES
; --------------------------------------------------------------
; ! = ALT
; <! = LEFT ALT
; >! = RIGHT ALT
; ^ = CTRL
; + = SHIFT
; # = WIN
;
; Debug action snippet: MsgBox You pressed Control-A while Notepad is active.

; Navigation using of bigger chunks (Skip to start/end of line/paragraph/document)
<!A::Send {Home}
<!E::Send {End}
<!+A::Send {Shift down}{Home}{Shift Up}
<!+E::Send {Shift down}{End}{Shift Up}	
<!F::Send {Right}
<!N::Send {Left}
<!P::Send {Up}
<!M::Send {Down}
<!^+F::Send {CTRL down}{Shift down}{Right}{CTRL Up}{Shift Up}
<!W::Send {CTRL down}{Right}{CTRL Up}
<!+W::Send {CTRL down}{Shift down}{Right}{CTRL Up}{Shift Up}
<!^+N::Send {CTRL down}{Shift down}{Left}{CTRL Up}{Shift Up}
<!Q::Send {CTRL down}{Left}{CTRL Up}
<!+Q::Send {CTRL down}{Shift down}{Left}{CTRL Up}{Shift Up}
<!^F::Send {CTRL down}{Right}{CTRL Up}
<!^N::Send {CTRL down}{Left}{CTRL Up}
<!O::Send {Enter}{Up}
<!H::Send {Backspace}
<!D::Send {Delete}
<!K::Send {CTRL down}{Shift down}{k}{CTRL Up}{Shift Up}

; Change languages
CapsLockStartTime := 0

CapsLock::
    CapsLockStartTime := A_TickCount ; Record when the key was pressed
    KeyWait, CapsLock, T0.3 ; Wait to check if it's released in 500 ms
    if (ErrorLevel) {
        ; Long press detected
        SetCapsLockState, % GetKeyState("CapsLock", "T") ? "Off" : "On"
    } else {
        ; Short press detected
        Send {LWin Down}{Space}{LWin Up}
    }
    return
    
; ตัวหนอน
<!`::Send {Alt Down}{Numpad9}{Numpad6}{Alt Up}
<!+`::Send {Alt Down}{Numpad1}{Numpad2}{Numpad6}{Alt Up}

;เพิ่มเสียงที่เมาส์
XButton1 & WheelUp::Send {Volume_Up 2}
XButton1 & WheelDown::Send {Volume_Down 2}
XButton1:: Send {Xbutton1}


; AlwaysOnTop
>^SPACE::  Winset, Alwaysontop, , A
