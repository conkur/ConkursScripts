#Persistent

; For each app you want to move to the first display, place its path in this var
global appsToMove := ["C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"]

; If app x-coordinate is less than this var, then move the app to a new display
moveAppIfXPositionIsUnder = 0

Loop {
    for index, app in appsToMove {
        WinWaitActive, ahk_exe %app% ; Wait until the application window is active
        WinGetPos x,,,, ahk_exe %app% ; Get the current coordinates of the application window. This can be customized to get y-coord, width, etc.
        if (x > moveAppIfXPositionIsUnder) {
            Send #+{Left} ; Make Window + Shift + Left-Arrow keystroke
        }
    
        WinWaitClose, ahk_exe %app% ; Wait until the application window is inactive, and then start the logic all over again
    }
}
