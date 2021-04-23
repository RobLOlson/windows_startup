;Robert Olson
#NoEnv
#SingleInstance force
SendMode Input

Capslock::Send, {Enter}
^Capslock::Send, ^{Enter}

; Not sure what these are supposed to do :\
; #IfWinActive ahk_exe sublime_text.exe
;     Alt::
;     KeyWait, Alt
;     return

;     LAlt Up::
;     if (A_PriorKey = "Alt")
;         return
;     return

; #IfWinActive ahk_exe chrome.exe
;     Alt::
;     KeyWait, Alt
;     return



;     LAlt Up::
;     if (A_PriorKey = "Alt")
;         return
;     return

#IfWinActive ;ahk_exe sublime_text.exe

    ; j::
    ; s::
    ; Send, Q
    ; return


    ;Stop alt from interfering with white space manipulations
    !Space::Send, {Space}
    !Backspace::Send, {Backspace}
    !^Backspace::Send, ^{Backspace}
    !Del::Send, {Del}
    !^Del::Send, ^{Del}
    !Enter::Send, {Enter}
    !^Enter::Send, {Enter}


    MoveCursor(key) {
        shift := GetKeyState("SHIFT","P")
        control := GetKeyState("CONTROL","P")
        controlShift := control && shift

        if controlShift {
            Send, ^+%key%
        }
        else if shift {
            Send, +%key%
        }
        else if control {
            Send, ^%key%
        }
        else {
            Send, %key%
        }
    }

    Alt & w::MoveCursor("{UP}")
    Alt & k::MoveCursor("{UP}")


    Alt & a::MoveCursor("{LEFT}")
    Alt & h::MoveCursor("{LEFT}")

    Alt & s::MoveCursor("{DOWN}")
    Alt & j::MoveCursor("{DOWN}")

    Alt & d::MoveCursor("{RIGHT}")
    Alt & l::MoveCursor("{RIGHT}")

    ; !j::
    ; !s::
    ; Send, {Down}
    ; return

    ; !^j::
    ; !^s::
    ; Send,{PgDn}
    ; return

    ; !+j::
    ; !+s::
    ; Send, +{Down}
    ; return

    ; !+^j::
    ; !+^s::
    ; Send, +^{Down}
    ; return

    ; !k::
    ; !w::
    ; Send, {Up}
    ; return

    ; !^k::
    ; !^w::
    ; Send, {PgUp}
    ; return

    ; !+k::
    ; !+w::
    ; Send, +{Up}
    ; return

    ; !^+k::
    ; !^+w::
    ; Send, +^{Up}
    ; return

    ; !h::
    ; !a::
    ; Send, {left}
    ; return

    ; !^h::
    ; !^a::
    ; Send, ^{left}
    ; return

    ; !+h::
    ; !+a::
    ; Send, +{left}
    ; return

    ; !^+h::
    ; !^+a::
    ; Send, +^{left}
    ; return

    ; !l::
    ; !d::
    ; Send, {right}
    ; return

    ; !^l::
    ; !^d::
    ; Send, ^{right}
    ; return

    ; !+l::
    ; !+d::
    ; Send, +{right}
    ; return

    ; !^+l::
    ; !^+d::
    ; Send, +^{right}
    ; return
