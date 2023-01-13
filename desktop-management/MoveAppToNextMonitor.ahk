#Persistent

; For each app you want to move to the first display, place its path in this var
global appsToMove := ["C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe", "M:\Program Files\Firefox Developer Edition\firefox.exe"]

; If app x-coordinate is less than this var, then move the app to a new display
moveAppIfXPositionIsUnder = 0

Loop {
    for index, app in appsToMove {
        WinWaitActive, ahk_exe %app%,, 5 ; Wait until the application window is active
        if ErrorLevel {
            Continue ; Reached timeout waiting for the application to become active. Move on to watching the next application.
        }

        ; The only possible time we want to consider moving the application is if it's the first time the application is opened.
        ; So only check to see if it needs to be this one time.
        appsToMove.RemoveAt(index)
        WinGetPos x,,,, ahk_exe %app% ; Get the current coordinates of the application window. This can be customized to get y-coord, width, etc.
        if (x > moveAppIfXPositionIsUnder) {
            Send #+{Left} ; Make Window + Shift + Left-Arrow keystroke
        }
    }
}
