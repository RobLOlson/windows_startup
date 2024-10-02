;Robert Olson
#NoEnv
#SingleInstance force

#HotkeyModifierTimeout 0

toggle := false
clickSpeed := 10  ; Milliseconds between clicks (adjust as needed)

; Toggle auto-click on left mouse button press
~+!^RButton::
    if (A_PriorHotkey <> "~LButton" or A_TimeSincePriorHotkey > 400)
    {
        ; Wait for button to be released
        KeyWait, LButton
        ; Toggle the auto-click state
        toggle := !toggle
        if (toggle)
        {
            SetTimer, PerformClick, %clickSpeed%
        }
        else
        {
            SetTimer, PerformClick, Off
        }
    }
return

; Function to perform the click
PerformClick:
    Click
return


~+!^LButton::
    While GetKeyState("LButton", "P")
    {
        Click
        Sleep 5   ; Adjust this value to change click speed (lower = faster)
    }
return



Alt::
KeyWait, Alt
return

LAlt Up::
if (A_PriorKey = "Alt")
    return
return

;; Avoid Ctrl getting stuck in down state, even when not physically pressed:
#MenuMaskKey vkFF

global group_count := 9

#IfWinActive ahk_exe BloonsTD6.exe Firefox.exe
    +!q::
        SetTimer, auto_Left, % (t1:=!t1) ? 10 : "Off"
    Return

    auto_Left:
        Click Left
    Return

; StarCraft commands:
; ctrl + mouse drag => assign to ctrl groups 9,8,7,6 (in that order)
; ctrl + a => assign all units on screen to ctrl groups 9,8,7,6
; ctrl + RMouseButton => issue attack command to all units in groups 9,8,7,6
; alt + RMouseButton => issue move command to all units in groups 9,8,7,6
; ctrl + shift + RMouseButton => issue attack command to all units in groups 4,3,2,1
; ` (backtick) => deselect top left unit in control group (for cloning)
; ctrl + ` => ctrl click top left unit in control group
; MButton4 => attack (`f`) and then left click (twice)
; MButton5 => right click and then backtick
; ctrl + q => buy 4 'q' units from rax in ctrl group 5 (split over raxes built vertically)
; ctrl + e => buy 4 'e' units from rax in ctrl group 5 (split over raxes built vertically)
; ctrl + shift + q => buy 8 'q' units
; ctrl + shift + e => buy 8 'e' units
; ctrl + g => move unit randomly on map (and then deselect one from ctrl group)
; ctrl + shift + g => patrol unit randomly on map (and then deselect one)
; ctrl + t => move unit randomly on screen (and then deselect one from ctrl group)
; ctrl + z => ctrl select top left unit in ctrl group and then press z
; k => turn on autobuy (uses ctrl+shift+q+e every 30s)
; , => turn off autobuy

#IfWinActive ahk_exe StarCraft.exe

    ; 1842, 1662 (unit profile pic)
    global pic_x := 1984
    global pic_y := 1667

    ; 875, 1550 (unit selected position)
    global select_x := 845
    global select_y := 1550

    ; 150,0 <--> 2575, 1225 (visible game)
    global game_min_x := 0
    global game_min_y := 0
    global game_max_x := 2735
    global game_max_y := 1225

    ; 15, 1330 <--> 510, 1780  (minimap)
    global map_min_x := 15
    global map_min_y := 1330
    global map_max_x := 500
    global map_max_y := 1780

    global group_count := 9
    global group_count2 := 1

    a::Left
    s::Down
    d::Right
    w::Up

    c::
        global pic_x, pic_y
        BlockInput MouseMove
        MouseGetPos, old_x, old_y
        MouseClick, left, 1984, 1667, 1, 0
        MouseMove, old_x, old_y, 0
        BlockInput MouseMoveOff
        return

    ; Select units on screen
    ^a::
        global select_x, select_y
        BlockInput MouseMove
        MouseGetPos, old_x, old_y
        MouseClickDrag, left, 1350, 650, 20, 20, 0
        MouseMove, 875, 1550, 0
        Send, {Ctrl down}
        MouseClick
        Send, {Ctrl up}
        Send {ctrl down}9{ctrl up}
        MouseClickDrag, left, 1350, 650, 2700, 20, 0
        MouseMove, 875, 1550, 0
        Send, {Ctrl down}
        MouseClick
        Send, {Ctrl up}
        Send {ctrl down}8{ctrl up}
        MouseClickDrag, left, 1350, 650, 20, 1300, 0
        MouseMove, 875, 1550, 0
        Send, {Ctrl down}
        MouseClick
        Send, {Ctrl up}
        Send {ctrl down}7{ctrl up}
        MouseClickDrag, left, 1350, 650, 2700, 1300, 0
        MouseMove, 875, 1550, 0
        Send, {Ctrl down}
        MouseClick
        Send, {Ctrl up}
        Send {ctrl down}6{ctrl up}
        MouseMove, old_x, old_y, 0
        BlockInput MouseMoveOff
        return

    ^z::
        global select_x, select_y
        BlockInput On
        MouseGetPos, old_x, old_y
        ; counter := 1
        ; while(counter < 10){
        ;     if(counter != 5){
        ;         Send %counter%
        ;         MouseMove, 875, 1550, 0
        ;         SendInput {ctrl down}{click}{Ctrl up}z
        ;     }
        ;     counter := counter + 1
        ; }
        Send 1
        MouseMove, 875, 1550, 0
        ; Send, {Ctrl down}
        SendInput {Ctrl down}{click}{Ctrl up}
        ; MouseClick
        ; Send, {Ctrl up}
        Send, z
        ; Send 2
        ; MouseMove, 875, 1550, 0
        ; ; Send, {Ctrl down}
        ; ; MouseClick
        ; ; Send, {Ctrl up}
        ; SendInput {Ctrl down}{click}{Ctrl up}
        ; Send, z
        ; ; Send {ctrl down}2{ctrl up}
        ; Send 3
        ; MouseMove, 875, 1550, 0
        ; ; Send, {Ctrl down}
        ; ; MouseClick
        ; ; Send, {Ctrl up}
        ; SendInput {Ctrl down}{click}{Ctrl up}
        ; Send, z
        ; ; Send {ctrl down}3{ctrl up}
        ; Send 4
        ; MouseMove, 875, 1550, 0
        ; ; Send, {Ctrl down}
        ; ; MouseClick
        ; ; Send, {Ctrl up}
        ; SendInput {Ctrl down}{click}{Ctrl up}
        ; Send, z
        ; ; Send {ctrl down}4{ctrl up}
        MouseMove, old_x, old_y, 0
        BlockInput Off
        return

    ; Select units on screen and stim/burrow them
    ; ^z::
    ;     global select_x, select_y
    ;     BlockInput MouseMove
    ;     MouseGetPos, old_x, old_y
    ;     MouseClickDrag, left, 1350, 650, 20, 20, 0
    ;     MouseMove, 875, 1550, 0
    ;     Send, {Ctrl down}
    ;     MouseClick
    ;     Send, {Ctrl up}
    ;     Send, z
    ;     ; Send {ctrl down}1{ctrl up}
    ;     MouseClickDrag, left, 1350, 650, 2700, 20, 0
    ;     MouseMove, 875, 1550, 0
    ;     Send, {Ctrl down}
    ;     MouseClick
    ;     Send, {Ctrl up}
    ;     Send, z
    ;     ; Send {ctrl down}2{ctrl up}
    ;     MouseClickDrag, left, 1350, 650, 20, 1300, 0
    ;     MouseMove, 875, 1550, 0
    ;     Send, {Ctrl down}
    ;     MouseClick
    ;     Send, {Ctrl up}
    ;     Send, z
    ;     ; Send {ctrl down}3{ctrl up}
    ;     MouseClickDrag, left, 1350, 650, 2700, 1300, 0
    ;     MouseMove, 875, 1550, 0
    ;     Send, {Ctrl down}
    ;     MouseClick
    ;     Send, {Ctrl up}
    ;     Send, z
    ;     ; Send {ctrl down}4{ctrl up}
    ;     MouseMove, old_x, old_y, 0
    ;     BlockInput MouseMoveOff
    ;     return

    ; CTRL BUG
    ; mass unburrow
    ; !x::
    ;     global select_x, select_y
    ;     BlockInput MouseMove
    ;     MouseGetPos, old_x, old_y
    ;     Send 1
    ;     MouseMove, 875, 1550, 0
    ;     Send, {Ctrl down}
    ;     MouseClick
    ;     Send, {Ctrl up}
    ;     Send, x
    ;     Send 2
    ;     MouseMove, 875, 1550, 0
    ;     Send, {Ctrl down}
    ;     MouseClick
    ;     Send, {Ctrl up}
    ;     Send, x
    ;     ; Send {ctrl down}2{ctrl up}
    ;     Send 3
    ;     MouseMove, 875, 1550, 0
    ;     Send, {Ctrl down}eeeeee
    ;     MouseClick
    ;     Send, {Ctrl up}
    ;     Send, x
    ;     ; Send {ctrl down}3{ctrl up}
    ;     Send 4
    ;     MouseMove, 875, 1550, 0
    ;     Send, {Ctrl down}
    ;     MouseClick
    ;     Send, {Ctrl up}
    ;     Send, x
    ;     ; Send {ctrl down}4{ctrl up}
    ;     MouseMove, old_x, old_y, 0
    ;     BlockInput MouseMoveOff
    ;     return

    ; CTRL BUG
    ; scatter (move)
    ^t::
        BlockInput MouseMove
        MouseGetPos, old_x, old_y
        ; MouseMove, (Random, Num, 150, 2575), (Random, Num, 0, 1225), 0
        ; Random, act_x, 150, 2575
        ; Random, act_y, 0, 1225
        delta_x += 250
        delta_x := Mod(delta_x, 2425)
        delta_y += 250
        delta_y := Mod(delta_y, 1225)

        act_x := 150 + delta_x
        act_y := delta_y
        Send {blind}{Shift up}
        MouseClick, right, act_x, act_y, 1, 0

        MouseMove, 875, 1550, 0
        Send, {Shift down}
        MouseClick
        Send, {blind}{shift Up}
        MouseMove, old_x, old_y, 0
        BlockInput MouseMoveOff
        return


    ; CTRL BUG
    ; scatter (patrol)
    ; BUG: ctrl+shift+t interferes with ctrl+t when ctrl+t is held (causing unwanted patrols)
    ; ^+t::
    ;     BlockInput MouseMove
    ;     MouseGetPos, old_x, old_y
    ;     ; MouseMove, (Random, Num, 150, 2575), (Random, Num, 0, 1225), 0
    ;     ; Random, act_x, 150, 2575
    ;     ; Random, act_y, 0, 1225
    ;     delta_x += 250
    ;     delta_x := Mod(delta_x, 2425)
    ;     delta_y += 250
    ;     delta_y := Mod(delta_y, 1225)

    ;     act_x := 150 + delta_x
    ;     act_y := delta_y

    ;     Send y
    ;     Send {blind}{shift up}
    ;     MouseClick, left, act_x, act_y, 1, 0

    ;     MouseMove, 875, 1550, 0
    ;     Send, {Shift down}
    ;     MouseClick
    ;     Send, {shift Up}
    ;     MouseMove, old_x, old_y, 0

    ;     MouseClick, right, act_x, act_y, 1, 0
    ;     BlockInput MouseMoveOff
    ;     return

    ; ctrl right click sends a-move to 1,2,3,4
    ; (NOTE: this will mistakenly overwrite ctrl groups if block input i snot enabled by running script in administrator mode)

    +^RButton::
    ; !q::
        BlockInput, On
        BlockInput, Send
        Send {Blind}{Alt up}{Ctrl up}{Shift up}
        MouseGetPos, old_x, old_y
        counter := 4
        while(counter > 0){
            SendInput {ctrl up}%counter%
            send f
            MouseClick, left, old_x, old_y, 1, 0
            Send {Blind}{Alt up}{Ctrl up}{Shift up}
            counter := counter -1
        }
        BlockInput, Off
        return

    ; +!RButton::
    ; ; !q::
    ;     BlockInput, On
    ;     BlockInput, Send
    ;     Send {Blind}{Alt up}{Ctrl up}{Shift up}
    ;     MouseGetPos, old_x, old_y
    ;     counter := 4
    ;     while(counter > 0){
    ;         SendInput {ctrl up}%counter%
    ;         MouseClick, right, old_x, old_y, 1, 0
    ;         Send {Blind}{Alt up}{Ctrl up}{Shift up}
    ;         counter := counter -1
    ;     }
    ;     BlockInput, Off
    ;     return


    ; ctrl right click sends a-move to 6,7,8,9
    ^RButton::
    ; !q::
        BlockInput, On
        BlockInput, Send
        Send {Blind}{Alt up}{Ctrl up}{Shift up}
        MouseGetPos, old_x, old_y
        counter := 9
        while(counter > 5){
            SendInput {ctrl up}%counter%
            send f
            MouseClick, left, old_x, old_y, 1, 0
            Send {Blind}{Alt up}{Ctrl up}{Shift up}
            counter := counter -1
        }
        BlockInput, Off

        return

    ; ctrl shift right click sends move command to 6,7,8,9
    !RButton::
    ; !q::
        BlockInput, On
        BlockInput, Send
        Send {Blind}{Alt up}{Ctrl up}{Shift up}
        MouseGetPos, old_x, old_y
        counter := 9
        while(counter > 5){
            SendInput {ctrl up}%counter%
            MouseClick, right, old_x, old_y, 1, 0
            Send {Blind}{Alt up}{Ctrl up}{Shift up}
            counter := counter -1
        }
        BlockInput, Off

        return

    ; ctrl+alt right click sends a-move to all groups (1-9 except 5)
    !^RButton::
    ; !q::
        BlockInput, On
        BlockInput, Send
        MouseGetPos, old_x, old_y
        Send {Blind}{Alt up}{Ctrl up}{Shift up}
        counter := 1
        while(counter < 10){
            if(counter!=5){
                SendInput {ctrl up}%counter%
                send f
                MouseClick, left, old_x, old_y, 1, 0
                Send {Blind}{Alt up}{Ctrl up}{Shift up}
            }
            counter := counter + 1
        }
        BlockInput, Off

        return



    ; ctrl+e will order 4 'e' units from the rax stack on ctrl group 5
    ^e::
        Goto !4
        ; BlockInput on
        ; Send {Blind}{Alt up}{Ctrl up}{Shift up}
        ; Send, {Ctrl down}5{Ctrl up}
        ; Sleep, 10
        ; MouseClick, left, 1350+330, 730, 1, 0
        ; SendInput eeee
        ; MouseClick, left, 1350, 730+330, 1, 0
        ; SendInput eeee
        ; MouseClick, left, 1350+330, 730+330, 1, 0
        ; SendInput eeee

        ; Send {Blind}{Alt up}{Ctrl up}{Shift up}
        ; BlockInput off
        return

        ; BlockInput on
        ; Send {Blind}{Alt up}{Ctrl up}{Shift up}

        ; Send, {Ctrl down}5{Ctrl up}
        ; Sleep, 10
        ; Send, 55eeee
        ; MouseClick, left, 1350+330, 730, 1, 0
        ; SendInput eeee
        ; MouseClick, left, 1350, 730+330, 1, 0
        ; SendInput eeee
        ; MouseClick, left, 1350+330, 730+330, 1, 0
        ; SendInput eeee

        ; Send {Blind}{Alt up}{Ctrl up}{Shift up}
        ; BlockInput off
        ; return


    +2::
        BlockInput on
        Send {Shift down}{F3}{Shift up}
        Send, 55q
        Send {blind}{Shift up}
        MouseClick, left, 1350, 730-330, 1, 0
        Send q
        Send {F3}
        BlockInput off
        return

    +3::
        Send {Shift up}
        BlockInput on
        Send {Shift down}{F3}{Shift up}
        Send, 55q
        Send {blind}{Shift up}
        MouseClick, left, 1350, 730-330, 1, 0
        Send q
        Gosub c
        Send {blind}{Shift up}
        MouseClick, left, 1350, 730-330, 1, 0
        Send q
        Send {F3}
        BlockInput off
        return

    +4::
        BlockInput on
        Send {Shift down}{F3}{Shift up}
        Send, 55q
        Send {blind}{Shift up}
        MouseClick, left, 1350, 730-330, 1, 0
        Send q
        Gosub c
        Send {blind}{Shift up}
        MouseClick, left, 1350, 730-330, 1, 0
        Send q
        Gosub c
        Send {blind}{Shift up}
        MouseClick, left, 1350, 730-330, 1, 0
        Send q
        Send {F3}
        BlockInput off
        return

    +5::
        BlockInput on
        Send {Shift down}{F3}{Shift up}
        Send, 55q
        Send {blind}{Shift up}
        MouseClick, left, 1350, 730-330, 1, 0
        Send q
        Gosub c
        Send {blind}{Shift up}
        MouseClick, left, 1350, 730-330, 1, 0
        Send q
        Gosub c
        Send {blind}{Shift up}
        MouseClick, left, 1350, 730-330, 1, 0
        Send q
        Gosub c
        Send {blind}{Shift up}
        MouseClick, left, 1350, 730-330, 1, 0
        Send q
        Gosub c
        Send {blind}{Shift up}
        MouseClick, left, 1350, 730-330, 1, 0
        Send q
        Gosub c
        Send {blind}{Shift up}
        MouseClick, left, 1350, 730-330, 1, 0
        Send q
        Gosub c
        Send {blind}{Shift up}
        MouseClick, left, 1350, 730-330, 1, 0
        Send q
        Send {F3}
        BlockInput off
        return


    !2::
        BlockInput on
        Send {Shift down}{F3}{Shift up}
        Send, 55e
        Send {blind}{Shift up}
        MouseClick, left, 1350, 730-330, 1, 0
        Send e
        Send {F3}
        BlockInput off
        return

    !3::
        BlockInput on
        Send {Shift down}{F3}{Shift up}
        Send, 55e
        Send {blind}{Shift up}
        MouseClick, left, 1350, 730-330, 1, 0
        Send e
        Gosub c
        Send {blind}{Shift up}
        MouseClick, left, 1350, 730-330, 1, 0
        Send e
        Send {F3}
        BlockInput off
        return

    !4::
        BlockInput on
        Send {Shift down}{F3}{Shift up}
        Send, 55e
        Send {blind}{Shift up}
        MouseClick, left, 1350, 730-330, 1, 0
        Send ek
        Gosub c
        Send {blind}{Shift up}
        MouseClick, left, 1350, 730-330, 1, 0
        Send e
        Gosub c
        Send {blind}{Shift up}
        MouseClick, left, 1350, 730-330, 1, 0
        Send e
        Send {F3}
        BlockInput off
        return

    !5::
        BlockInput on
        Send {Shift down}{F3}{Shift up}
        Send, 55e
        Send {blind}{Shift up}
        MouseClick, left, 1350, 730-330, 1, 0
        Send e
        Gosub c
        Send {blind}{Shift up}
        MouseClick, left, 1350, 730-330, 1, 0
        Send e
        Gosub c
        Send {blind}{Shift up}
        MouseClick, left, 1350, 730-330, 1, 0
        Send e
        Gosub c
        Send {blind}{Shift up}
        MouseClick, left, 1350, 730-330, 1, 0
        Send e
        Gosub c
        Send {blind}{Shift up}
        MouseClick, left, 1350, 730-330, 1, 0
        Send e
        Gosub c
        Send {blind}{Shift up}
        MouseClick, left, 1350, 730-330, 1, 0
        Send e
        Gosub c
        Send {blind}{Shift up}
        MouseClick, left, 1350, 730-330, 1, 0
        Send e
        Send {F3}
        BlockInput off
        return

    ; +^e::
    ;     BlockInput on
    ;     SendInput ^9
    ;     Send {Blind}{Alt up}{Ctrl up}{Shift up}

    ;     SendInput 55
    ;     ; Sleep, 100
    ;     SendInput eeee
    ;     ; SLeep, 500
    ;     MouseClick, left, 1350+330, 730, 1, 0
    ;     ; Sleep, 500
    ;     SendInput eeee
    ;     MouseClick, left, 1350, 730+330, 1, 0
    ;     ; Sleep, 500
    ;     SendInput eeee
    ;     MouseClick, left, 1350+330, 730+330, 1, 0
    ;     ; Sleep, 500
    ;     SendInput eeee

    ;     SendInput 99
    ;     Send {Blind}{Alt up}{Ctrl up}{Shift up}

    ;     BlockInput off
    ;     return

    ^q::
        Goto +4
        ; BlockInput on
        ; Send {Blind}{Alt up}{Ctrl up}{Shift up}

        ; Send, {Ctrl down}5{Ctrl up}
        ; Sleep, 10
        ; Send, 55qqqq
        ; MouseClick, left, 1350+330, 730, 1, 0
        ; SendInput qqqq
        ; MouseClick, left, 1350, 730+330, 1, 0
        ; SendInput qqqq
        ; MouseClick, left, 1350+330, 730+330, 1, 0
        ; SendInput qqqq

        ; Send {Blind}{Alt up}{Ctrl up}{Shift up}

        ; BlockInput off
        return

    ^+q::
        Goto +5
        ; BlockInput on
        ; SendInput ^9
        ; Send {Blind}{Alt up}{Ctrl up}{Shift up}

        ; SendInput 55
        ; ; Sleep, 100
        ; SendInput qqqq
        ; ; SLeep, 500
        ; MouseClick, left, 1350+330, 730, 1, 0
        ; ; Sleep, 500
        ; SendInput qqqq
        ; MouseClick, left, 1350, 730+330, 1, 0
        ; ; Sleep, 500
        ; SendInput qqqq
        ; MouseClick, left, 1350+330, 730+330, 1, 0
        ; ; Sleep, 500
        ; SendInput qqqq

        ; SendInput 99
        ; Send {Blind}{Alt up}{Ctrl up}{Shift up}

        ; BlockInput off
        return



    ; (not finished)
    ; move units randomly into bounding box by most recent cursor drag
    ; ^b::
    ;     BlockInput MouseMove
    ;     MouseGetPos, old_x, old_y
    ;     ; MouseMove, (Random, Num, 150, 2575), (Random, Num, 0, 1225), 0
    ;     ; Random, act_x, 150, 2575
    ;     ; Random, act_y, 0, 1225
    ;     global up_x, down_x, up_y, down_y

    ;     if(up_x < down_x){
    ;         temp := up_x
    ;         up_x := down_x
    ;         down_x := temp
    ;     }
    ;     if(up_y < down_y){
    ;         temp := up_y
    ;         up_y := down_y
    ;         down_y := temp
    ;     }
    ;     diff_x := up_x - down_x
    ;     diff_y := up_y - down_y

    ;     delta_x += 337
    ;     delta_x := Mod(delta_x, diff_x)
    ;     delta_y += 1012
    ;     delta_y := Mod(delta_y, diff_y)

    ;     act_x := down_x + delta_x
    ;     act_y := down_y + delta_y

    ;     MouseClick, right, act_x, act_y, 1, 0

    ;     MouseMove, 875, 1550, 0
    ;     Send, {Shift down}
    ;     MouseClick
    ;     Send, {shift Up}
    ;     MouseMove, old_x, old_y, 0
    ;     BlockInput MouseMoveOff
    ;     return

    ; global move randomly
    ^g::
        BlockInput MouseMove
        MouseGetPos, old_x, old_y
        ; MouseMove, 875, 1550, 0
        Send, {Shift down}
        MouseClick, left, 875, 1550, 1, 0
        Send, {Shift up}
        Random, act_x, 15, 500
        Random, act_y, 1330, 1780
        MouseClick, right, act_x, act_y, 1, 0
        MouseMove, old_x, old_y, 0
        BlockInput MouseMoveOff
        return

    ; global patrol
    ; (use repeatedly with a control group to send them patroling randomly around the map)
    +^g::
        BlockInput MouseMove
        MouseGetPos, old_x, old_y
        MouseMove, 875, 1550, 0
        ; Send, {Shift down}
        MouseClick
        ; Send, {shift Up}
        Random, act_x, 15, 500
        Random, act_y, 1330, 1780
        Send y
        Send {blind}{Shift Up}
        MouseClick, left, act_x, act_y, 1, 0
        MouseMove, old_x, old_y, 0
        BlockInput MouseMoveOff
        return


    ~^h::
        BlockInput, On
        BlockInput, Send
        Send {Blind}{Alt up}{Ctrl up}{Shift up}
        MouseGetPos, old_x, old_y
        counter := 9
        while(counter > 5){
            SendInput {ctrl up}%counter%
            send h
            Send {Blind}{Alt up}{Ctrl up}{Shift up}
            counter := counter -1
        }
        BlockInput, Off

        return
        ; Send {Blind}{Alt up}{Ctrl up}{Shift up}
        ; return
    ; horizontal align
    ; ^h::
    ;     BlockInput MouseMove
    ;     MouseGetPos, old_x, old_y

    ;     delta_x += 500
    ;     delta_x := Mod(delta_x, 1499)
    ;     act_x := 200 + delta_x - 500 + old_x

    ;     MouseClick, right, act_x, old_y, 1, 0

    ;     MouseMove, 875, 1550, 0
    ;     Send, {Shift down}
    ;     MouseClick
    ;     Send, {shift Up}
    ;     MouseMove, old_x, old_y, 0
    ;     BlockInput MouseMoveOff
    ;     return

    ; vertical align
    ^v::
        BlockInput MouseMove
        MouseGetPos, old_x, old_y

        delta_y += 350
        delta_y := Mod(delta_y, 1000)
        act_y := delta_y + old_y - 500

        MouseClick, right, old_x, act_y, 1, 0

        MouseMove, 875, 1550, 0
        Send, {Shift down}
        MouseClick
        Send, {shift Up}
        MouseMove, old_x, old_y, 0
        BlockInput MouseMoveOff
        return

    ; deselect first selected unit
    PgUp::
    `::
        BlockInput MouseMove
        MouseGetPos, old_x, old_y
        MouseMove, 875, 1550, 0
        Send, {Shift down}
        MouseClick
        Send, {shift Up}
        MouseMove, old_x, old_y, 0
        BlockInput MouseMoveOff
        return

    ; ctrl select first selected unit type
    PgDn::
    ^`::
        global select_x, select_y
        BlockInput MouseMove
        MouseGetPos, old_x, old_y
        MouseMove, 875, 1550, 0
        Send, {Ctrl down}
        MouseClick
        Send, {Ctrl up}
        MouseMove, old_x, old_y, 0
        BlockInput MouseMoveOff
        return

    ~LButton::
        global down_x, down_y
        MouseGetPos, down_x, down_y
        return

    ~^LButton::
        global down_x, down_y
        MouseGetPos, down_x, down_y
        return

    ~!LButton::
        global down_x, down_y
        MouseGetPos, down_x, down_y
        return

    ; alt box select adds units to grps 1,2,3,4
    ~!LButton Up::
        global up_x, up_y, group_count, group_count2, down_x, down_y
        MouseGetPos, up_x, up_y
        if(up_x > down_x){
            temp := up_x
            up_x := down_x
            down_x := temp
        }
        if(up_y > down_y){
            temp := up_y
            up_y := down_y
            down_y := temp
        }

        if(down_x - up_x < 250 || down_y - up_y < 250){
            return
        }

        mid_x := up_x + (down_x-up_x)/2
        mid_y := up_y + (down_y-up_y)/2


        MouseClickDrag, left, mid_x, mid_y, up_x, up_y, 0
        SendInput ^1

        MouseClickDrag, left, mid_x, mid_y, up_x, down_y, 0
        SendInput ^2

        MouseClickDrag, left, mid_x, mid_y, down_x, up_y, 0
        SendInput ^3

        MouseClickDrag, left, mid_x, mid_y, down_x, down_y, 0
        SendInput ^4

        Send {Blind}{Alt up}{Ctrl up}{Shift up}
        return

    ; holding alt and drag selecting adds units to ctrl group 9,8,7,6..
    ~^LButton Up::
        global up_x, up_y, group_count, group_count2, down_x, down_y
        MouseGetPos, up_x, up_y
        if(up_x > down_x){
            temp := up_x
            up_x := down_x
            down_x := temp
        }
        if(up_y > down_y){
            temp := up_y
            up_y := down_y
            down_y := temp
        }

        if(down_x - up_x < 220 || down_y - up_y < 220){
            return
        }

        mid_x := up_x + (down_x-up_x)/2
        mid_y := up_y + (down_y-up_y)/2


        MouseClickDrag, left, mid_x, mid_y, up_x, up_y, 0
        Send ^9

        MouseClickDrag, left, mid_x, mid_y, up_x, down_y, 0
        Send ^8

        MouseClickDrag, left, mid_x, mid_y, down_x, up_y, 0
        Send ^7

        MouseClickDrag, left, mid_x, mid_y, down_x, down_y, 0
        Send ^6

        Send {Blind}{Alt up}{Ctrl up}{Shift up}
        return

    F1::0


    ; select all units on screen and add to (1,2,3,4)
    ^b::
        global select_x, select_y
        BlockInput On
        MouseGetPos, old_x, old_y
        MouseClickDrag, left, 1350, 650, 20, 20, 0
        Send ^1

        MouseClickDrag, left, 1350, 650, 2700, 20, 0
        Send ^2

        MouseClickDrag, left, 1350, 650, 20, 1300, 0
        Send ^3

        MouseClickDrag, left, 1350, 650, 2700, 1300, 0
        Send ^4

        Send {Blind}{Alt up}{Ctrl up}{Shift up}

        MouseMove, old_x, old_y, 0
        BlockInput Off
        return


    k::
        SetTimer NewTimer, 30000
        return

    ,::
        SetTimer NewTimer, Off
        return

    NewTimer() {
        Gosub +5
        Gosub !5
    }


    +^e::
        Goto !5
        return
        ; if !bool {
        ;     Send test1
        ;     bool = !bool
        ;     return
        ; }
        ; else {
        ;     while bool {
        ;         SetTimer After400, 400 ; Wait for more presses within a 400 millisecond window.

        ;         After400()  ;
        ;         {
        ;             Send test
        ;             Gosub c
        ;         }
        ;     }
        ;     bool = !bool
        ; }
        ; return

    !q::
        Send qqqqqqqqq
        return

    ; Set Rally
    ^y::
        BlockInput On
        Send {Blind}{Alt up}{Ctrl up}{Shift up}
        Send {Shift}{F1}
        global rally_x, rally_y
        MouseGetPos rally_x, rally_y
        BlockInput Off
        return

    +y::
        Send {Shift down}{F4}{Shift up}
        global rally_x, rally_y
        MouseGetPos rally_x, rally_y
        return

    F4::
        Send {Shift down}{F4}{Shift up}
        global rally_x, rally_y
        MouseGetPos rally_x, rally_y
        return

    ; ^y::
    ;     BlockInput On
    ;     Send {Blind}{Alt up}{Ctrl up}{Shift up}
    ;     global rally_x, rally_y
    ;     MouseGetPos rally_x, rally_y
    ;     send y
    ;     MouseClick, left, rally_x, rally_y, 1, 0
    ;     BlockInput Off
    ;     return

    ; Use Existing Rally
    y::
        BlockInput MouseMove
        MouseGetPos, old_x, old_y
        Send {F4}
        Sleep 20
        Send y
        Sleep 20
        MouseClick, left, rally_x, rally_y, 1, 0
        MouseMove, old_x, old_y, 0
        Gosub c
        BlockInput, MouseMoveOff
        return

    !y::
        Gosub y
        MouseClick, left, 1350, 730-330, 1, 0
        Gosub y
        return


    Xbutton1::
        Click Right
        Goto PgUp
        return

    XButton2::
        Send f
        Click Left
        Click left
        ; MouseClick, left, , , 1, 0
        return

    ; For SOME REASON you simply CANNOT send a shift-queued hold position command
    ; RButton::
    ; {
          Click right
    ;     Sendinput, {Shift down}{h down}
    ;     keywait, h
    ;     Sendinput, {h up}{Shift up}
    ; }
    ; Return


    ^p::
        Send {Enter}
        Send show me the money
        Send {Enter}
        Send {Enter}
        Send operation CWAL
        Send {Enter}
        Send {Enter}
        Send food for thought
        Send {Enter}
        Send {Enter}
        Send modify the phase variance
        Send {Enter}
        Send {Enter}
        Send the gathering
        Send {Enter}
        Send {Enter}
        Send something for nothing
        Send {Enter}
        Send {Enter}
        Send power overwhelming
        Send {Enter}
        Send {Enter}
        Send medieval man
        Send {Enter}
        Send {Enter}
        Send zoom zoom
        Send {Enter}
        return

    ; *k::KeyHistory



