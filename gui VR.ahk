#SingleInstance Force
    #NoEnv
SetWorkingDir %A_ScriptDir%
SetBatchLines -1

Gui Add, Button, gBrowse x288 y112 w80 h23, &Browse
Gui Add, Text, x32 y114 w120 h34, 1) Select Game Folder
Gui Add, Text, x32 y160 w278 h23, 2) Tool will find appropriate files and backup originals 
Gui Add, Text, x32 y248 w120 h23, 4) Go-baby-go
Gui Add, Button, gButt x288 y248 w80 h23, OK
Gui Add, Text, x32 y8 w296 h86, Select the highest folder in a game's directory. `n`nIf the game is in:`nC:\Games\Fortnite\Binary\Fortnite Win64\`nBrowse for:`nC:\Games\Fortnite
Gui Add, ComboBox, x288 y192 w81 vMenu, High||Medium|Low
Gui Add, Text, x32 y194 w167 h29 +0x200, 3) Select your PC's capabilities
Gui Add, Link, x288 y8 w120 h23, <a href="https://autohotkey.com">autohotkey.com</a>

Gui Show, w392 h304, VR Universal Mod - VRfect & FSR
Return

Browse:
    FileSelectFolder, GameFolderVar, , 2
    if GameFolderVar =
        MsgBox, You didn't select a folder.
    else
    {
        MsgBox, You selected folder "%GameFolderVar%".
    }
return

Butt:
Gui, Submit
    Vrlogger := "\GameFolder.txt"
    Vrreturn := "\Return.txt"
    Levels := "\Levels.txt"
Logfile := A_AppDataCommon Vrlogger
Logreturn := A_AppDataCommon Vrreturn
LevelsFile := A_AppDataCommon Levels
FileDelete %LevelsFile%
FileAppend, %Menu%, %LevelsFile%
FileDelete, %Logfile%
FileAppend, %GameFolderVar%, %Logfile% 
Run, "find file.exe"
FileReadLine, ReturnVar, %Logreturn%, 2
MsgBox, "Completed, see readme for more tweaks."
return

GuiEscape:
GuiClose:
    ExitApp
    
