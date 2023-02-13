#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>
#Region ### START Koda GUI section ### 
$Form1 = GUICreate("Lid Manager", 533, 231, 2728, 755)
$Group3 = GUICtrlCreateGroup("Power Button", 8, 8, 241, 209)
$Group2 = GUICtrlCreateGroup("DC ", 8, 128, 241, 89)
$Button3 = GUICtrlCreateButton("Nothing", 32, 152, 185, 25)
$Button4 = GUICtrlCreateButton("Sleep", 32, 184, 185, 25)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group1 = GUICtrlCreateGroup("Battery", 8, 40, 241, 97)
$Button1 = GUICtrlCreateButton("Nothing", 32, 64, 185, 25)
$Button2 = GUICtrlCreateButton("Sleep", 32, 96, 185, 25)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group4 = GUICtrlCreateGroup("Lid", 272, 8, 249, 209)
$Group5 = GUICtrlCreateGroup("Battery", 272, 40, 249, 97)
$Button5 = GUICtrlCreateButton("Nothing", 296, 64, 201, 25)
$Button6 = GUICtrlCreateButton("Sleep", 296, 96, 201, 25)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group6 = GUICtrlCreateGroup("DC", 272, 128, 249, 97)
$Button7 = GUICtrlCreateButton("Nothing", 296, 152, 201, 25)
$Button8 = GUICtrlCreateButton("Sleep", 296, 184, 201, 25)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###


Func Callpwrcfg($type,$action,$button)
Switch $type
Case "Battery"
    $cmd = "powercfg -setdcvalueindex SCHEME_CURRENT 4f971e89-eebd-4455-a8de-9e59040e7347"
Case "AC"
    $cmd = "powercfg -setacvalueindex SCHEME_CURRENT 4f971e89-eebd-4455-a8de-9e59040e7347"
EndSwitch
Switch $button
Case "Power"
    $pwr = " 7648efa3-dd9c-4e3e-b566-50f929386280 "
case "Lid"
    $pwr = " 5ca83367-6e45-459f-a27b-476b1d01c936 "  
EndSwitch
Run($cmd & $pwr & $action)
EndFunc
While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
        Case $Button1
            Callpwrcfg("Battery","0","Power")
        Case $Button2
            Callpwrcfg("Battery","1","Power")
        Case $Button3
            Callpwrcfg("AC","0","Power")    
        Case $Button4
            Callpwrcfg("AC","1","Power")
        Case $Button5
            Callpwrcfg("Battery","0","Lid")
        Case $Button6
            Callpwrcfg("Battery","1","Lid")
        Case $Button7
            Callpwrcfg("AC","0","Lid")    
        Case $Button8
            Callpwrcfg("AC","1","Lid")
        
	EndSwitch
WEnd
