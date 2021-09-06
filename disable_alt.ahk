;Robert Olson
#NoEnv
#SingleInstance force

; Not sure what this does, but it was causing problems with Brood Wars
SendMode Input

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

; #IfWinNotActive Brood War

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

; #IfWinNotActive

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

#IfWinActive Brood War

    ; a::Send,{left}
    ; s::Send,{down}
    ; w::Send,{up}
    ; d::Send,{right}
    ; return
    w::
        send {blind}{up down}
        ; keywait w
    return
    a::
        send {blind}{left down}
        ; keywait a
    return
    s::
        send {blind}{down down}
        ; keywait s
    return
    d::
        send {blind}{right down}
        ; keywait d
    return

    w up::send {blind}{up up}
    a up::send {blind}{left up}
    s up::send {blind}{down up}
    d up::send {blind}{right up}
#IfWinActive
