;Robert Olson
#NoEnv
#SingleInstance force

#HotkeyModifierTimeout 0

; TargetKeys := ["Backspace", "Tab", "Delete", "NumpadClear", "Enter", "Escape", "Space", "NumpadPgUp", "NumpadPgDn", "NumpadEnd", "NumpadHome", "NumpadLeft", "NumpadUp", "NumpadRight", "NumpadDown", "PrintScreen", "NumpadIns", "NumpadDel", "0", "1", "7", "8", "9", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "Numpad0", "Numpad1", "Numpad2", "Numpad3", "Numpad4", "Numpad5", "Numpad6", "Numpad7", "Numpad8", "Numpad9", "NumpadMult", "NumpadAdd", "NumpadSub", "NumpadDot", "NumpadDiv", "F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8", "F9", "F10", "F11", "F12", "=", "-", ".", "/", "\", "[", "]", ","]

; hks = "~Backspace" ,"!~Backspace" ,"^~Backspace" ,"+~Backspace" ,"!^~Backspace" ,"!+~Backspace" ,"^!+~Backspace" ,"~Tab" ,"!~Tab" ,"^~Tab" ,"+~Tab" ,"!^~Tab" ,"!+~Tab" ,"^!+~Tab" ,"~Delete" ,"!~Delete" ,"^~Delete" ,"+~Delete" ,"!^~Delete" ,"!+~Delete" ,"^!+~Delete" ,"~NumpadClear" ,"!~NumpadClear" ,"^~NumpadClear" ,"+~NumpadClear" ,"!^~NumpadClear" ,"!+~NumpadClear" ,"^!+~NumpadClear" ,"~Enter" ,"!~Enter" ,"^~Enter" ,"+~Enter" ,"!^~Enter" ,"!+~Enter" ,"^!+~Enter" ,"~Escape" ,"!~Escape" ,"^~Escape" ,"+~Escape" ,"!^~Escape" ,"!+~Escape" ,"^!+~Escape" ,"~Space" ,"!~Space" ,"^~Space" ,"+~Space" ,"!^~Space" ,"!+~Space" ,"^!+~Space" ,"~NumpadPgUp" ,"!~NumpadPgUp" ,"^~NumpadPgUp" ,"+~NumpadPgUp" ,"!^~NumpadPgUp" ,"!+~NumpadPgUp" ,"^!+~NumpadPgUp" ,"~NumpadPgDn" ,"!~NumpadPgDn" ,"^~NumpadPgDn" ,"+~NumpadPgDn" ,"!^~NumpadPgDn" ,"!+~NumpadPgDn" ,"^!+~NumpadPgDn" ,"~NumpadEnd" ,"!~NumpadEnd" ,"^~NumpadEnd" ,"+~NumpadEnd" ,"!^~NumpadEnd" ,"!+~NumpadEnd" ,"^!+~NumpadEnd" ,"~NumpadHome" ,"!~NumpadHome" ,"^~NumpadHome" ,"+~NumpadHome" ,"!^~NumpadHome" ,"!+~NumpadHome" ,"^!+~NumpadHome" ,"~NumpadLeft" ,"!~NumpadLeft" ,"^~NumpadLeft" ,"+~NumpadLeft" ,"!^~NumpadLeft" ,"!+~NumpadLeft" ,"^!+~NumpadLeft" ,"~NumpadUp" ,"!~NumpadUp" ,"^~NumpadUp" ,"+~NumpadUp" ,"!^~NumpadUp" ,"!+~NumpadUp" ,"^!+~NumpadUp" ,"~NumpadRight" ,"!~NumpadRight" ,"^~NumpadRight" ,"+~NumpadRight" ,"!^~NumpadRight" ,"!+~NumpadRight" ,"^!+~NumpadRight" ,"~NumpadDown" ,"!~NumpadDown" ,"^~NumpadDown" ,"+~NumpadDown" ,"!^~NumpadDown" ,"!+~NumpadDown" ,"^!+~NumpadDown" ,"~PrintScreen" ,"!~PrintScreen" ,"^~PrintScreen" ,"+~PrintScreen" ,"!^~PrintScreen" ,"!+~PrintScreen" ,"^!+~PrintScreen" ,"~NumpadIns" ,"!~NumpadIns" ,"^~NumpadIns" ,"+~NumpadIns" ,"!^~NumpadIns" ,"!+~NumpadIns" ,"^!+~NumpadIns" ,"~NumpadDel" ,"!~NumpadDel" ,"^~NumpadDel" ,"+~NumpadDel" ,"!^~NumpadDel" ,"!+~NumpadDel" ,"^!+~NumpadDel" ,"~0" ,"!~0" ,"^~0" ,"+~0" ,"!^~0" ,"!+~0" ,"^!+~0" ,"~1" ,"!~1" ,"^~1" ,"+~1" ,"!^~1" ,"!+~1" ,"^!+~1" ,"~7" ,"!~7" ,"^~7" ,"+~7" ,"!^~7" ,"!+~7" ,"^!+~7" ,"~8" ,"!~8" ,"^~8" ,"+~8" ,"!^~8" ,"!+~8" ,"^!+~8" ,"~9" ,"!~9" ,"^~9" ,"+~9" ,"!^~9" ,"!+~9" ,"^!+~9" ,"~a" ,"!~a" ,"^~a" ,"+~a" ,"!^~a" ,"!+~a" ,"^!+~a" ,"~b" ,"!~b" ,"^~b" ,"+~b" ,"!^~b" ,"!+~b" ,"^!+~b" ,"~c" ,"!~c" ,"^~c" ,"+~c" ,"!^~c" ,"!+~c" ,"^!+~c" ,"~d" ,"!~d" ,"^~d" ,"+~d" ,"!^~d" ,"!+~d" ,"^!+~d" ,"~e" ,"!~e" ,"^~e" ,"+~e" ,"!^~e" ,"!+~e" ,"^!+~e" ,"~f" ,"!~f" ,"^~f" ,"+~f" ,"!^~f" ,"!+~f" ,"^!+~f" ,"~g" ,"!~g" ,"^~g" ,"+~g" ,"!^~g" ,"!+~g" ,"^!+~g" ,"~h" ,"!~h" ,"^~h" ,"+~h" ,"!^~h" ,"!+~h" ,"^!+~h" ,"~i" ,"!~i" ,"^~i" ,"+~i" ,"!^~i" ,"!+~i" ,"^!+~i" ,"~j" ,"!~j" ,"^~j" ,"+~j" ,"!^~j" ,"!+~j" ,"^!+~j" ,"~k" ,"!~k" ,"^~k" ,"+~k" ,"!^~k" ,"!+~k" ,"^!+~k" ,"~l" ,"!~l" ,"^~l" ,"+~l" ,"!^~l" ,"!+~l" ,"^!+~l" ,"~m" ,"!~m" ,"^~m" ,"+~m" ,"!^~m" ,"!+~m" ,"^!+~m" ,"~n" ,"!~n" ,"^~n" ,"+~n" ,"!^~n" ,"!+~n" ,"^!+~n" ,"~o" ,"!~o" ,"^~o" ,"+~o" ,"!^~o" ,"!+~o" ,"^!+~o" ,"~p" ,"!~p" ,"^~p" ,"+~p" ,"!^~p" ,"!+~p" ,"^!+~p" ,"~q" ,"!~q" ,"^~q" ,"+~q" ,"!^~q" ,"!+~q" ,"^!+~q" ,"~r" ,"!~r" ,"^~r" ,"+~r" ,"!^~r" ,"!+~r" ,"^!+~r" ,"~s" ,"!~s" ,"^~s" ,"+~s" ,"!^~s" ,"!+~s" ,"^!+~s" ,"~t" ,"!~t" ,"^~t" ,"+~t" ,"!^~t" ,"!+~t" ,"^!+~t" ,"~u" ,"!~u" ,"^~u" ,"+~u" ,"!^~u" ,"!+~u" ,"^!+~u" ,"~v" ,"!~v" ,"^~v" ,"+~v" ,"!^~v" ,"!+~v" ,"^!+~v" ,"~w" ,"!~w" ,"^~w" ,"+~w" ,"!^~w" ,"!+~w" ,"^!+~w" ,"~x" ,"!~x" ,"^~x" ,"+~x" ,"!^~x" ,"!+~x" ,"^!+~x" ,"~y" ,"!~y" ,"^~y" ,"+~y" ,"!^~y" ,"!+~y" ,"^!+~y" ,"~z" ,"!~z" ,"^~z" ,"+~z" ,"!^~z" ,"!+~z" ,"^!+~z" ,"~Numpad0" ,"!~Numpad0" ,"^~Numpad0" ,"+~Numpad0" ,"!^~Numpad0" ,"!+~Numpad0" ,"^!+~Numpad0" ,"~Numpad1" ,"!~Numpad1" ,"^~Numpad1" ,"+~Numpad1" ,"!^~Numpad1" ,"!+~Numpad1" ,"^!+~Numpad1" ,"~Numpad2" ,"!~Numpad2" ,"^~Numpad2" ,"+~Numpad2" ,"!^~Numpad2" ,"!+~Numpad2" ,"^!+~Numpad2" ,"~Numpad3" ,"!~Numpad3" ,"^~Numpad3" ,"+~Numpad3" ,"!^~Numpad3" ,"!+~Numpad3" ,"^!+~Numpad3" ,"~Numpad4" ,"!~Numpad4" ,"^~Numpad4" ,"+~Numpad4" ,"!^~Numpad4" ,"!+~Numpad4" ,"^!+~Numpad4" ,"~Numpad5" ,"!~Numpad5" ,"^~Numpad5" ,"+~Numpad5" ,"!^~Numpad5" ,"!+~Numpad5" ,"^!+~Numpad5" ,"~Numpad6" ,"!~Numpad6" ,"^~Numpad6" ,"+~Numpad6" ,"!^~Numpad6" ,"!+~Numpad6" ,"^!+~Numpad6" ,"~Numpad7" ,"!~Numpad7" ,"^~Numpad7" ,"+~Numpad7" ,"!^~Numpad7" ,"!+~Numpad7" ,"^!+~Numpad7" ,"~Numpad8" ,"!~Numpad8" ,"^~Numpad8" ,"+~Numpad8" ,"!^~Numpad8" ,"!+~Numpad8" ,"^!+~Numpad8" ,"~Numpad9" ,"!~Numpad9" ,"^~Numpad9" ,"+~Numpad9" ,"!^~Numpad9" ,"!+~Numpad9" ,"^!+~Numpad9" ,"~NumpadMult" ,"!~NumpadMult" ,"^~NumpadMult" ,"+~NumpadMult" ,"!^~NumpadMult" ,"!+~NumpadMult" ,"^!+~NumpadMult" ,"~NumpadAdd" ,"!~NumpadAdd" ,"^~NumpadAdd" ,"+~NumpadAdd" ,"!^~NumpadAdd" ,"!+~NumpadAdd" ,"^!+~NumpadAdd" ,"~NumpadSub" ,"!~NumpadSub" ,"^~NumpadSub" ,"+~NumpadSub" ,"!^~NumpadSub" ,"!+~NumpadSub" ,"^!+~NumpadSub" ,"~NumpadDot" ,"!~NumpadDot" ,"^~NumpadDot" ,"+~NumpadDot" ,"!^~NumpadDot" ,"!+~NumpadDot" ,"^!+~NumpadDot" ,"~NumpadDiv" ,"!~NumpadDiv" ,"^~NumpadDiv" ,"+~NumpadDiv" ,"!^~NumpadDiv" ,"!+~NumpadDiv" ,"^!+~NumpadDiv" ,"~F1" ,"!~F1" ,"^~F1" ,"+~F1" ,"!^~F1" ,"!+~F1" ,"^!+~F1" ,"~F2" ,"!~F2" ,"^~F2" ,"+~F2" ,"!^~F2" ,"!+~F2" ,"^!+~F2" ,"~F3" ,"!~F3" ,"^~F3" ,"+~F3" ,"!^~F3" ,"!+~F3" ,"^!+~F3" ,"~F4" ,"!~F4" ,"^~F4" ,"+~F4" ,"!^~F4" ,"!+~F4" ,"^!+~F4" ,"~F5" ,"!~F5" ,"^~F5" ,"+~F5" ,"!^~F5" ,"!+~F5" ,"^!+~F5" ,"~F6" ,"!~F6" ,"^~F6" ,"+~F6" ,"!^~F6" ,"!+~F6" ,"^!+~F6" ,"~F7" ,"!~F7" ,"^~F7" ,"+~F7" ,"!^~F7" ,"!+~F7" ,"^!+~F7" ,"~F8" ,"!~F8" ,"^~F8" ,"+~F8" ,"!^~F8" ,"!+~F8" ,"^!+~F8" ,"~F9" ,"!~F9" ,"^~F9" ,"+~F9" ,"!^~F9" ,"!+~F9" ,"^!+~F9" ,"~F10" ,"!~F10" ,"^~F10" ,"+~F10" ,"!^~F10" ,"!+~F10" ,"^!+~F10" ,"~F11" ,"!~F11" ,"^~F11" ,"+~F11" ,"!^~F11" ,"!+~F11" ,"^!+~F11" ,"~F12" ,"!~F12" ,"^~F12" ,"+~F12" ,"!^~F12" ,"!+~F12" ,"^!+~F12" ,"~=" ,"!~=" ,"^~=" ,"+~=" ,"!^~=" ,"!+~=" ,"^!+~=" ,"~-" ,"!~-" ,"^~-" ,"+~-" ,"!^~-" ,"!+~-" ,"^!+~-" ,"~." ,"!~." ,"^~." ,"+~." ,"!^~." ,"!+~." ,"^!+~." ,"~/" ,"!~/" ,"^~/" ,"+~/" ,"!^~/" ,"!+~/" ,"^!+~/" ,"~\" ,"!~\" ,"^~\" ,"+~\" ,"!^~\" ,"!+~\" ,"^!+~\" ,"~[" ,"!~[" ,"^~[" ,"+~[" ,"!^~[" ,"!+~[" ,"^!+~[" ,"~]" ,"!~]" ,"^~]" ,"+~]" ,"!^~]" ,"!+~]" ,"^!+~]" ,"~," ,"!~," ,"^~," ,"+~," ,"!^~," ,"!+~," ,"^!+~,"]

; Hotkey, If, repeatKey > 0

; for index, element in TargetKeys
; {
;         Hotkey % "~" element, repeatLabel
;         Hotkey % "!~" element, repeatLabel
;         Hotkey % "^~" element, repeatLabel
;         Hotkey % "+~" element, repeatLabel
;         Hotkey % "!^~" element, repeatLabel
;         Hotkey % "!+~" element, repeatLabel
;         Hotkey % "^!+~" element, repeatLabel
; }

; Hotkey, If
; !2::repeatKey = 1
; !3::repeatKey = 2
; !4::repeatKey = 3
; !5::repeatKey = 4
; !6::repeatKey = 5

; #If repeatKey > 0
; repeatLabel:
; loop, % repeatKey {
;     Send % StrReplace(A_Thishotkey, "~", "{") "}"
; }
; repeatKey = 0
; Return



Alt::
KeyWait, Alt
return

LAlt Up::
if (A_PriorKey = "Alt")
    return
return



