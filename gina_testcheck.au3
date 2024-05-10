#include <File.au3>
#include "include/imgsearch.au3"

; #INDEX# =======================================================================================================================
; Title .........: GINA - Graphics Interface Network App
; Language ......: English / Romanian
; Description ...: Check TT tests status provided by GINA
; Author(s) .....: Porosnicu Bogdan - blankode
; ===============================================================================================================================

HotKeySet("{Esc}", "_exit")

Opt("WinTitleMatchMode", 2)

;required paths trimmed
Global $imgpath = @ScriptDir & "\lib\img\search\"
Global $savestatus = "\\timsrv03\Common\aaaaaaaaaa\vncstatus.txt"

;image library
Global $pluguut = $imgpath & "pluguut.PNG"
Global $pluguut2 = $imgpath & "module.PNG"
Global $latch = $imgpath & "latch.PNG"
Global $led = $imgpath & "led.PNG"
Global $module = $imgpath & "module.PNG"
Global $yellow = $imgpath & "yellow.PNG"
Global $pass = $imgpath & "pass.PNG"
Global $dutconfiguration = $imgpath & "dutconfiguration.PNG"
Global $runtime = $imgpath & "runtime.PNG"
Global $login = $imgpath & "login.PNG"

;pause variables
Global $waitafterVNC = 1000
Global $waitbetweenSearches = 200

;begin searching
_ft15()

;FT 15
Func _ft15()
   ToolTip("Searching for anomalies at FT 15...(1/27)", @DesktopWidth / 2 - 200, 0)
   ShellExecute("vncviewer.exe","135.247.88.142 -password vnc", "lib/vnc/")
   Sleep ($waitafterVNC)
   WinActivate("service mode")
   _FileWriteToLine($savestatus, 15, "0", True)
	  For $checkforpluguut = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($pluguut)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 15, "1", True)
			_ft2_16()
		 EndIf
	  Next
	  For $checkforlatch = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($latch)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 15, "2", True)
			_ft2_16()
		 EndIf
	  Next
	  For $checkforled = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($led)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 15, "3", True)
			_ft2_16()
		 EndIf
	  Next
	  For $checkformodule = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($module)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 15, "4", True)
			_ft2_16()
		 EndIf
	  Next
	  For $checkforyellow = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($yellow)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 15, "5", True)
			_ft2_16()
		 EndIf
	  Next
	  For $checkforpass = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($pass)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 15, "6", True)
			_ft2_16()
		 EndIf
	  Next
	  For $checkfordutconfiguration = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($dutconfiguration)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 15, "7", True)
			_ft2_16()
		 EndIf
	  Next
	  For $checkforruntime = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($runtime)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 15, "8", True)
			_ft2_16()
		 EndIf
	  Next
	  For $checkforlogin = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($login)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 15, "9", True)
			_ft2_16()
		 EndIf
	  Next
	  For $cleanram = 0 To 3
		 WinClose("VncViewer Message Box")
		 WinClose("VNC Viewer Status for")
		 WinClose("service mode")
	  Next
	  _ft2_16()
   EndFunc
;FT2 16
Func _ft2_16()
   ToolTip("Searching for anomalies at FT 2 - 16... (2/27)", @DesktopWidth / 2 - 200, 0)
   ShellExecute("vncviewer.exe","135.247.88.150 -password vnc", "lib/vnc/")
   Sleep ($waitafterVNC)
   WinActivate("service mode")
   _FileWriteToLine($savestatus, 17, "0", True)
	  For $checkforpluguut = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($pluguut)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 17, "1", True)
			_ft17()
		 EndIf
	  Next
	  For $checkforlatch = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($latch)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 17, "2", True)
			_ft17()
		 EndIf
	  Next
	  For $checkforled = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($led)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 17, "3", True)
			_ft17()
		 EndIf
	  Next
	  For $checkformodule = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($module)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 17, "4", True)
			_ft17()
		 EndIf
	  Next
	  For $checkforyellow = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($yellow)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 17, "5", True)
			_ft17()
		 EndIf
	  Next
	  For $checkforpass = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($pass)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 17, "6", True)
			_ft17()
		 EndIf
	  Next
	  For $checkfordutconfiguration = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($dutconfiguration)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 17, "7", True)
			_ft17()
		 EndIf
	  Next
	  For $checkforruntime = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($runtime)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 17, "8", True)
			_ft17()
		 EndIf
	  Next
	  For $checkforlogin = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($login)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 17, "9", True)
			_ft17()
		 EndIf
	  Next
	  For $cleanram = 0 To 3
		 WinClose("VncViewer Message Box")
		 WinClose("VNC Viewer Status for")
		 WinClose("service mode")
	  Next
	  _ft17()
   EndFunc
;FT 17
Func _ft17()
   ToolTip("Searching for anomalies at FT 17... (3/27)", @DesktopWidth / 2 - 200, 0)
   ShellExecute("vncviewer.exe","135.247.88.81 -password vnc", "lib/vnc/")
   Sleep ($waitafterVNC)
   WinActivate("service mode")
   _FileWriteToLine($savestatus, 19, "0", True)
	  For $checkforpluguut = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($pluguut)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 19, "1", True)
			_ft18()
		 EndIf
	  Next
	  For $checkforlatch = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($latch)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 19, "2", True)
			_ft18()
		 EndIf
	  Next
	  For $checkforled = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($led)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 19, "3", True)
			_ft18()
		 EndIf
	  Next
	  For $checkformodule = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($module)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 19, "4", True)
			_ft18()
		 EndIf
	  Next
	  For $checkforyellow = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($yellow)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 19, "5", True)
			_ft18()
		 EndIf
	  Next
	  For $checkforpass = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($pass)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 19, "6", True)
			_ft18()
		 EndIf
	  Next
	  For $checkfordutconfiguration = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($dutconfiguration)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 19, "7", True)
			_ft18()
		 EndIf
	  Next
	  For $checkforruntime = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($runtime)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 19, "8", True)
			_ft18()
		 EndIf
	  Next
	  For $checkforlogin = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($login)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 19, "9", True)
			_ft18()
		 EndIf
	  Next
	  For $cleanram = 0 To 3
		 WinClose("VncViewer Message Box")
		 WinClose("VNC Viewer Status for")
		 WinClose("service mode")
	  Next
	  _ft18()
   EndFunc
;FT 18
Func _ft18()
   ToolTip("Searching for anomalies at FT 18... (4/27)", @DesktopWidth / 2 - 200, 0)
   ShellExecute("vncviewer.exe","135.247.88.71 -password vnc", "lib/vnc/")
   Sleep ($waitafterVNC)
   WinActivate("service mode")
   _FileWriteToLine($savestatus, 21, "0", True)
	  For $checkforpluguut = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($pluguut)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 21, "1", True)
			_ft19()
		 EndIf
	  Next
	  For $checkforlatch = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($latch)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 21, "2", True)
			_ft19()
		 EndIf
	  Next
	  For $checkforled = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($led)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 21, "3", True)
			_ft19()
		 EndIf
	  Next
	  For $checkformodule = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($module)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 21, "4", True)
			_ft19()
		 EndIf
	  Next
	  For $checkforyellow = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($yellow)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 21, "5", True)
			_ft19()
		 EndIf
	  Next
	  For $checkforpass = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($pass)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 21, "6", True)
			_ft19()
		 EndIf
	  Next
	  For $checkfordutconfiguration = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($dutconfiguration)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 21, "7", True)
			_ft19()
		 EndIf
	  Next
	  For $checkforruntime = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($runtime)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 21, "8", True)
			_ft19()
		 EndIf
	  Next
	  For $checkforlogin = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($login)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 21, "9", True)
			_ft19()
		 EndIf
	  Next
	  For $cleanram = 0 To 3
		 WinClose("VncViewer Message Box")
		 WinClose("VNC Viewer Status for")
		 WinClose("service mode")
	  Next
	  _ft19()
   EndFunc
;FT 19
Func _ft19()
   ToolTip("Searching for anomalies at FT 19... (5/27)", @DesktopWidth / 2 - 200, 0)
   ShellExecute("vncviewer.exe","135.247.88.164 -password vnc", "lib/vnc/")
   Sleep ($waitafterVNC)
   WinActivate("service mode")
   _FileWriteToLine($savestatus, 23, "0", True)
	  For $checkforpluguut = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($pluguut)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 23, "1", True)
			_ft20()
		 EndIf
	  Next
	  For $checkforlatch = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($latch)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 23, "2", True)
			_ft20()
		 EndIf
	  Next
	  For $checkforled = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($led)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 23, "3", True)
			_ft20()
		 EndIf
	  Next
	  For $checkformodule = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($module)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 23, "4", True)
			_ft20()
		 EndIf
	  Next
	  For $checkforyellow = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($yellow)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 23, "5", True)
			_ft20()
		 EndIf
	  Next
	  For $checkforpass = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($pass)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 23, "6", True)
			_ft20()
		 EndIf
	  Next
	  For $checkfordutconfiguration = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($dutconfiguration)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 23, "7", True)
			_ft20()
		 EndIf
	  Next
	  For $checkforruntime = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($runtime)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 23, "8", True)
			_ft20()
		 EndIf
	  Next
	  For $checkforlogin = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($login)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 23, "9", True)
			_ft20()
		 EndIf
	  Next
	  For $cleanram = 0 To 3
		 WinClose("VncViewer Message Box")
		 WinClose("VNC Viewer Status for")
		 WinClose("service mode")
	  Next
	  _ft20()
   EndFunc
;FT 20
Func _ft20()
   ToolTip("Searching for anomalies at FT 20... (6/27)", @DesktopWidth / 2 - 200, 0)
   ShellExecute("vncviewer.exe","135.247.88.160 -password vnc", "lib/vnc/")
   Sleep ($waitafterVNC)
   WinActivate("service mode")
   _FileWriteToLine($savestatus, 25, "0", True)
	  For $checkforpluguut = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($pluguut)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 25, "1", True)
			_ft21()
		 EndIf
	  Next
	  For $checkforlatch = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($latch)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 25, "2", True)
			_ft21()
		 EndIf
	  Next
	  For $checkforled = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($led)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 25, "3", True)
			_ft21()
		 EndIf
	  Next
	  For $checkformodule = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($module)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 25, "4", True)
			_ft21()
		 EndIf
	  Next
	  For $checkforyellow = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($yellow)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 25, "5", True)
			_ft21()
		 EndIf
	  Next
	  For $checkforpass = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($pass)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 25, "6", True)
			_ft21()
		 EndIf
	  Next
	  For $checkfordutconfiguration = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($dutconfiguration)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 25, "7", True)
			_ft21()
		 EndIf
	  Next
	  For $checkforruntime = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($runtime)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 25, "8", True)
			_ft21()
		 EndIf
	  Next
	  For $checkforlogin = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($login)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 25, "9", True)
			_ft21()
		 EndIf
	  Next
	  For $cleanram = 0 To 3
		 WinClose("VncViewer Message Box")
		 WinClose("VNC Viewer Status for")
		 WinClose("service mode")
	  Next
	  _ft21()
   EndFunc
;FT 21
Func _ft21()
   ToolTip("Searching for anomalies at FT 21... (7/27)", @DesktopWidth / 2 - 200, 0)
   ShellExecute("vncviewer.exe","135.247.88.155 -password vnc", "lib/vnc/")
   Sleep ($waitafterVNC)
   WinActivate("service mode")
   _FileWriteToLine($savestatus, 27, "0", True)
	  For $checkforpluguut = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($pluguut)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 27, "1", True)
			_ft22_207()
		 EndIf
	  Next
	  For $checkforlatch = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($latch)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 27, "2", True)
			_ft22_207()
		 EndIf
	  Next
	  For $checkforled = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($led)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 27, "3", True)
			_ft22_207()
		 EndIf
	  Next
	  For $checkformodule = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($module)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 27, "4", True)
			_ft22_207()
		 EndIf
	  Next
	  For $checkforyellow = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($yellow)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 27, "5", True)
			_ft22_207()
		 EndIf
	  Next
	  For $checkforpass = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($pass)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 27, "6", True)
			_ft22_207()
		 EndIf
	  Next
	  For $checkfordutconfiguration = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($dutconfiguration)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 27, "7", True)
			_ft22_207()
		 EndIf
	  Next
	  For $checkforruntime = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($runtime)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 27, "8", True)
			_ft22_207()
		 EndIf
	  Next
	  For $checkforlogin = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($login)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 27, "9", True)
			_ft22_207()
		 EndIf
	  Next
	  For $cleanram = 0 To 3
		 WinClose("VncViewer Message Box")
		 WinClose("VNC Viewer Status for")
		 WinClose("service mode")
	  Next
	  _ft22_207()
   EndFunc
;FT 22 - 207
Func _ft22_207()
   ToolTip("Searching for anomalies at FT 22 - 207... (8/27)", @DesktopWidth / 2 - 200, 0)
   ShellExecute("vncviewer.exe","135.247.88.139 -password vnc", "lib/vnc/")
   Sleep ($waitafterVNC)
   WinActivate("service mode")
   _FileWriteToLine($savestatus, 29, "0", True)
	  For $checkforpluguut = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($pluguut)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 29, "1", True)
			_ft22_985()
		 EndIf
	  Next
	  For $checkforlatch = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($latch)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 29, "2", True)
			_ft22_985()
		 EndIf
	  Next
	  For $checkforled = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($led)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 29, "3", True)
			_ft22_985()
		 EndIf
	  Next
	  For $checkformodule = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($module)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 29, "4", True)
			_ft22_985()
		 EndIf
	  Next
	  For $checkforyellow = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($yellow)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 29, "5", True)
			_ft22_985()
		 EndIf
	  Next
	  For $checkforpass = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($pass)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 29, "6", True)
			_ft22_985()
		 EndIf
	  Next
	  For $checkfordutconfiguration = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($dutconfiguration)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 29, "7", True)
			_ft22_985()
		 EndIf
	  Next
	  For $checkforruntime = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($runtime)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 29, "8", True)
			_ft22_985()
		 EndIf
	  Next
	  For $checkforlogin = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($login)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 29, "9", True)
			_ft22_985()
		 EndIf
	  Next
	  For $cleanram = 0 To 3
		 WinClose("VncViewer Message Box")
		 WinClose("VNC Viewer Status for")
		 WinClose("service mode")
	  Next
	  _ft22_985()
   EndFunc
;FT 22 - 985
Func _ft22_985()
   ToolTip("Searching for anomalies at FT 22 - 985... (9/27)", @DesktopWidth / 2 - 200, 0)
   ShellExecute("vncviewer.exe","135.247.88.158 -password vnc", "lib/vnc/")
   Sleep ($waitafterVNC)
   WinActivate("service mode")
   _FileWriteToLine($savestatus, 31, "0", True)
	  For $checkforpluguut = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($pluguut)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 31, "1", True)
			_ft36()
		 EndIf
	  Next
	  For $checkforlatch = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($latch)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 31, "2", True)
			_ft36()
		 EndIf
	  Next
	  For $checkforled = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($led)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 31, "3", True)
			_ft36()
		 EndIf
	  Next
	  For $checkformodule = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($module)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 31, "4", True)
			_ft36()
		 EndIf
	  Next
	  For $checkforyellow = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($yellow)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 31, "5", True)
			_ft36()
		 EndIf
	  Next
	  For $checkforpass = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($pass)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 31, "6", True)
			_ft36()
		 EndIf
	  Next
	  For $checkfordutconfiguration = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($dutconfiguration)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 31, "7", True)
			_ft36()
		 EndIf
	  Next
	  For $checkforruntime = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($runtime)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 31, "8", True)
			_ft36()
		 EndIf
	  Next
	  For $checkforlogin = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($login)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 31, "9", True)
			_ft36()
		 EndIf
	  Next
	  For $cleanram = 0 To 3
		 WinClose("VncViewer Message Box")
		 WinClose("VNC Viewer Status for")
		 WinClose("service mode")
	  Next
	  _ft36()
   EndFunc
;FT 36
Func _ft36()
   ToolTip("Searching for anomalies at FT 36... (10/27)", @DesktopWidth / 2 - 200, 0)
   ShellExecute("vncviewer.exe","135.247.88.177 -password vnc", "lib/vnc/")
   Sleep ($waitafterVNC)
   WinActivate("service mode")
   _FileWriteToLine($savestatus, 33, "0", True)
	  For $checkforpluguut = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($pluguut)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 33, "1", True)
			_ft37()
		 EndIf
	  Next
	  For $checkforlatch = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($latch)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 33, "2", True)
			_ft37()
		 EndIf
	  Next
	  For $checkforled = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($led)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 33, "3", True)
			_ft37()
		 EndIf
	  Next
	  For $checkformodule = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($module)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 33, "4", True)
			_ft37()
		 EndIf
	  Next
	  For $checkforyellow = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($yellow)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 33, "5", True)
			_ft37()
		 EndIf
	  Next
	  For $checkforpass = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($pass)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 33, "6", True)
			_ft37()
		 EndIf
	  Next
	  For $checkfordutconfiguration = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($dutconfiguration)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 33, "7", True)
			_ft37()
		 EndIf
	  Next
	  For $checkforruntime = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($runtime)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 33, "8", True)
			_ft37()
		 EndIf
	  Next
	  For $checkforlogin = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($login)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 33, "9", True)
			_ft37()
		 EndIf
	  Next
	  For $cleanram = 0 To 3
		 WinClose("VncViewer Message Box")
		 WinClose("VNC Viewer Status for")
		 WinClose("service mode")
	  Next
	  _ft37()
   EndFunc
;FT 37
Func _ft37()
   ToolTip("Searching for anomalies at FT 37... (11/27)", @DesktopWidth / 2 - 200, 0)
   ShellExecute("vncviewer.exe","135.247.88.180 -password vnc", "lib/vnc/")
   Sleep ($waitafterVNC)
   WinActivate("service mode")
   _FileWriteToLine($savestatus, 35, "0", True)
	  For $checkforpluguut = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($pluguut)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 35, "1", True)
			_ft41()
		 EndIf
	  Next
	  For $checkforlatch = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($latch)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 35, "2", True)
			_ft41()
		 EndIf
	  Next
	  For $checkforled = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($led)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 35, "3", True)
			_ft41()
		 EndIf
	  Next
	  For $checkformodule = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($module)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 35, "4", True)
			_ft41()
		 EndIf
	  Next
	  For $checkforyellow = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($yellow)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 35, "5", True)
			_ft41()
		 EndIf
	  Next
	  For $checkforpass = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($pass)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 35, "6", True)
			_ft41()
		 EndIf
	  Next
	  For $checkfordutconfiguration = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($dutconfiguration)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 35, "7", True)
			_ft41()
		 EndIf
	  Next
	  For $checkforruntime = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($runtime)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 35, "8", True)
			_ft41()
		 EndIf
	  Next
	  For $checkforlogin = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($login)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 35, "9", True)
			_ft41()
		 EndIf
	  Next
	  For $cleanram = 0 To 3
		 WinClose("VncViewer Message Box")
		 WinClose("VNC Viewer Status for")
		 WinClose("service mode")
	  Next
	  _ft41()
   EndFunc
;FT 41
Func _ft41()
   ToolTip("Searching for anomalies at FT 41... (12/27)", @DesktopWidth / 2 - 200, 0)
   ShellExecute("vncviewer.exe","137.247.88.112 -password vnc", "lib/vnc/")
   Sleep ($waitafterVNC)
   WinActivate("service mode")
   _FileWriteToLine($savestatus, 37, "0", True)
	  For $checkforpluguut = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($pluguut)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 37, "1", True)
			_ft44()
		 EndIf
	  Next
	  For $checkforlatch = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($latch)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 37, "2", True)
			_ft44()
		 EndIf
	  Next
	  For $checkforled = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($led)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 37, "3", True)
			_ft44()
		 EndIf
	  Next
	  For $checkformodule = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($module)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 37, "4", True)
			_ft44()
		 EndIf
	  Next
	  For $checkforyellow = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($yellow)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 37, "5", True)
			_ft44()
		 EndIf
	  Next
	  For $checkforpass = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($pass)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 37, "6", True)
			_ft44()
		 EndIf
	  Next
	  For $checkfordutconfiguration = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($dutconfiguration)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 37, "7", True)
			_ft44()
		 EndIf
	  Next
	  For $checkforruntime = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($runtime)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 37, "8", True)
			_ft44()
		 EndIf
	  Next
	  For $checkforlogin = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($login)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 37, "9", True)
			_ft44()
		 EndIf
	  Next
	  For $cleanram = 0 To 3
		 WinClose("VncViewer Message Box")
		 WinClose("VNC Viewer Status for")
		 WinClose("service mode")
	  Next
	  _ft44()
   EndFunc
;FT 44
Func _ft44()
   ToolTip("Searching for anomalies at FT 44... (13/27)", @DesktopWidth / 2 - 200, 0)
   ShellExecute("vncviewer.exe","135.247.88.197 -password vnc", "lib/vnc/")
   Sleep ($waitafterVNC)
   WinActivate("service mode")
   _FileWriteToLine($savestatus, 39, "0", True)
	  For $checkforpluguut = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($pluguut)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 39, "1", True)
			_ft49()
		 EndIf
	  Next
	  For $checkforlatch = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($latch)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 39, "2", True)
			_ft49()
		 EndIf
	  Next
	  For $checkforled = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($led)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 39, "3", True)
			_ft49()
		 EndIf
	  Next
	  For $checkformodule = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($module)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 39, "4", True)
			_ft49()
		 EndIf
	  Next
	  For $checkforyellow = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($yellow)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 39, "5", True)
			_ft49()
		 EndIf
	  Next
	  For $checkforpass = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($pass)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 39, "6", True)
			_ft49()
		 EndIf
	  Next
	  For $checkfordutconfiguration = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($dutconfiguration)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 39, "7", True)
			_ft49()
		 EndIf
	  Next
	  For $checkforruntime = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($runtime)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 39, "8", True)
			_ft49()
		 EndIf
	  Next
	  For $checkforlogin = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($login)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 39, "9", True)
			_ft49()
		 EndIf
	  Next
	  For $cleanram = 0 To 3
		 WinClose("VncViewer Message Box")
		 WinClose("VNC Viewer Status for")
		 WinClose("service mode")
	  Next
	  _ft49()
   EndFunc
;FT 49
Func _ft49()
   ToolTip("Searching for anomalies at FT 49... (14/27)", @DesktopWidth / 2 - 200, 0)
   ShellExecute("vncviewer.exe","135.247.88.190 -password vnc", "lib/vnc/")
   Sleep ($waitafterVNC)
   WinActivate("service mode")
   _FileWriteToLine($savestatus, 41, "0", True)
	  For $checkforpluguut = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($pluguut)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 41, "1", True)
			_ft25()
		 EndIf
	  Next
	  For $checkforlatch = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($latch)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 41, "2", True)
			_ft25()
		 EndIf
	  Next
	  For $checkforled = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($led)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 41, "3", True)
			_ft25()
		 EndIf
	  Next
	  For $checkformodule = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($module)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 41, "4", True)
			_ft25()
		 EndIf
	  Next
	  For $checkforyellow = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($yellow)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 41, "5", True)
			_ft25()
		 EndIf
	  Next
	  For $checkforpass = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($pass)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 41, "6", True)
			_ft25()
		 EndIf
	  Next
	  For $checkfordutconfiguration = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($dutconfiguration)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 41, "7", True)
			_ft25()
		 EndIf
	  Next
	  For $checkforruntime = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($runtime)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 41, "8", True)
			_ft25()
		 EndIf
	  Next
	  For $checkforlogin = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($login)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 41, "9", True)
			_ft25()
		 EndIf
	  Next
	  For $cleanram = 0 To 3
		 WinClose("VncViewer Message Box")
		 WinClose("VNC Viewer Status for")
		 WinClose("service mode")
	  Next
	  _ft25()
   EndFunc
;FT 25
Func _ft25()
   ToolTip("Searching for anomalies at FT 25... (14/27)", @DesktopWidth / 2 - 200, 0)
   ShellExecute("vncviewer.exe","135.247.88.202 -password vnc", "lib/vnc/")
   Sleep ($waitafterVNC)
   WinActivate("service mode")
   _FileWriteToLine($savestatus, 43, "0", True)
	  For $checkforpluguut = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($pluguut)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 43, "1", True)
			_ft50()
		 EndIf
	  Next
	  For $checkforlatch = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($latch)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 43, "2", True)
			_ft50()
		 EndIf
	  Next
	  For $checkforled = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($led)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 43, "3", True)
			_ft50()
		 EndIf
	  Next
	  For $checkformodule = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($module)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 43, "4", True)
			_ft50()
		 EndIf
	  Next
	  For $checkforyellow = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($yellow)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 43, "5", True)
			_ft50()
		 EndIf
	  Next
	  For $checkforpass = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($pass)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 43, "6", True)
			_ft50()
		 EndIf
	  Next
	  For $checkfordutconfiguration = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($dutconfiguration)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 43, "7", True)
			_ft50()
		 EndIf
	  Next
	  For $checkforruntime = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($runtime)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 43, "8", True)
			_ft50()
		 EndIf
	  Next
	  For $checkforlogin = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($login)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 43, "9", True)
			_ft50()
		 EndIf
	  Next
	  For $cleanram = 0 To 3
		 WinClose("VncViewer Message Box")
		 WinClose("VNC Viewer Status for")
		 WinClose("service mode")
	  Next
	  _ft50()
   EndFunc
;FT 50
Func _ft50()
   ToolTip("Searching for anomalies at FT 50... (15/27)", @DesktopWidth / 2 - 200, 0)
   ShellExecute("vncviewer.exe","135.247.88.178 -password vnc", "lib/vnc/")
   Sleep ($waitafterVNC)
   WinActivate("service mode")
   _FileWriteToLine($savestatus, 45, "0", True)
	  For $checkforpluguut = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($pluguut)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 45, "1", True)
			_ft51()
		 EndIf
	  Next
	  For $checkforlatch = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($latch)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 45, "2", True)
			_ft51()
		 EndIf
	  Next
	  For $checkforled = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($led)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 45, "3", True)
			_ft51()
		 EndIf
	  Next
	  For $checkformodule = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($module)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 45, "4", True)
			_ft51()
		 EndIf
	  Next
	  For $checkforyellow = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($yellow)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 45, "5", True)
			_ft51()
		 EndIf
	  Next
	  For $checkforpass = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($pass)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 45, "6", True)
			_ft51()
		 EndIf
	  Next
	  For $checkfordutconfiguration = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($dutconfiguration)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 45, "7", True)
			_ft51()
		 EndIf
	  Next
	  For $checkforruntime = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($runtime)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 45, "8", True)
			_ft51()
		 EndIf
	  Next
	  For $checkforlogin = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($login)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 45, "9", True)
			_ft51()
		 EndIf
	  Next
	  For $cleanram = 0 To 3
		 WinClose("VncViewer Message Box")
		 WinClose("VNC Viewer Status for")
		 WinClose("service mode")
	  Next
	  _ft51()
   EndFunc
;FT 51
Func _ft51()
   ToolTip("Searching for anomalies at FT 51... (16/27)", @DesktopWidth / 2 - 200, 0)
   ShellExecute("vncviewer.exe","135.247.88.161 -password vnc", "lib/vnc/")
   Sleep ($waitafterVNC)
   WinActivate("service mode")
   _FileWriteToLine($savestatus, 47, "0", True)
	  For $checkforpluguut = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($pluguut)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 47, "1", True)
			_ft48()
		 EndIf
	  Next
	  For $checkforlatch = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($latch)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 47, "2", True)
			_ft48()
		 EndIf
	  Next
	  For $checkforled = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($led)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 47, "3", True)
			_ft48()
		 EndIf
	  Next
	  For $checkformodule = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($module)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 47, "4", True)
			_ft48()
		 EndIf
	  Next
	  For $checkforyellow = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($yellow)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 47, "5", True)
			_ft48()
		 EndIf
	  Next
	  For $checkforpass = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($pass)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 47, "6", True)
			_ft48()
		 EndIf
	  Next
	  For $checkfordutconfiguration = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($dutconfiguration)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 47, "7", True)
			_ft48()
		 EndIf
	  Next
	  For $checkforruntime = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($runtime)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 47, "8", True)
			_ft48()
		 EndIf
	  Next
	  For $checkforlogin = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($login)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 47, "9", True)
			_ft48()
		 EndIf
	  Next
	  For $cleanram = 0 To 3
		 WinClose("VncViewer Message Box")
		 WinClose("VNC Viewer Status for")
		 WinClose("service mode")
	  Next
	  _ft48()
   EndFunc
;FT 48
Func _ft48()
   ToolTip("Searching for anomalies at FT 48... (17/27)", @DesktopWidth / 2 - 200, 0)
   ShellExecute("vncviewer.exe","135.247.88.195 -password vnc", "lib/vnc/")
   Sleep ($waitafterVNC)
   WinActivate("service mode")
   _FileWriteToLine($savestatus, 49, "0", True)
	  For $checkforpluguut = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($pluguut)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 49, "1", True)
			_ft47()
		 EndIf
	  Next
	  For $checkforlatch = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($latch)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 49, "2", True)
			_ft47()
		 EndIf
	  Next
	  For $checkforled = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($led)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 49, "3", True)
			_ft47()
		 EndIf
	  Next
	  For $checkformodule = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($module)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 49, "4", True)
			_ft47()
		 EndIf
	  Next
	  For $checkforyellow = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($yellow)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 49, "5", True)
			_ft47()
		 EndIf
	  Next
	  For $checkforpass = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($pass)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 49, "6", True)
			_ft47()
		 EndIf
	  Next
	  For $checkfordutconfiguration = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($dutconfiguration)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 49, "7", True)
			_ft47()
		 EndIf
	  Next
	  For $checkforruntime = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($runtime)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 49, "8", True)
			_ft47()
		 EndIf
	  Next
	  For $checkforlogin = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($login)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 49, "9", True)
			_ft47()
		 EndIf
	  Next
	  For $cleanram = 0 To 3
		 WinClose("VncViewer Message Box")
		 WinClose("VNC Viewer Status for")
		 WinClose("service mode")
	  Next
	  _ft47()
   EndFunc
;FT 47
Func _ft47()
   ToolTip("Searching for anomalies at FT 47... (18/27)", @DesktopWidth / 2 - 200, 0)
   ShellExecute("vncviewer.exe","135.247.88.194 -password vnc", "lib/vnc/")
   Sleep ($waitafterVNC)
   WinActivate("service mode")
   _FileWriteToLine($savestatus, 51, "0", True)
	  For $checkforpluguut = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($pluguut)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 51, "1", True)
			_ft46()
		 EndIf
	  Next
	  For $checkforlatch = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($latch)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 51, "2", True)
			_ft46()
		 EndIf
	  Next
	  For $checkforled = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($led)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 51, "3", True)
			_ft46()
		 EndIf
	  Next
	  For $checkformodule = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($module)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 51, "4", True)
			_ft46()
		 EndIf
	  Next
	  For $checkforyellow = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($yellow)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 51, "5", True)
			_ft46()
		 EndIf
	  Next
	  For $checkforpass = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($pass)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 51, "6", True)
			_ft46()
		 EndIf
	  Next
	  For $checkfordutconfiguration = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($dutconfiguration)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 51, "7", True)
			_ft46()
		 EndIf
	  Next
	  For $checkforruntime = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($runtime)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 51, "8", True)
			_ft46()
		 EndIf
	  Next
	  For $checkforlogin = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($login)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 51, "9", True)
			_ft46()
		 EndIf
	  Next
	  For $cleanram = 0 To 3
		 WinClose("VncViewer Message Box")
		 WinClose("VNC Viewer Status for")
		 WinClose("service mode")
	  Next
	  _ft46()
   EndFunc
;FT 46
Func _ft46()
   ToolTip("Searching for anomalies at FT 46... (19/27)", @DesktopWidth / 2 - 200, 0)
   ShellExecute("vncviewer.exe","135.247.88.191 -password vnc", "lib/vnc/")
   Sleep ($waitafterVNC)
   WinActivate("service mode")
   _FileWriteToLine($savestatus, 53, "0", True)
	  For $checkforpluguut = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($pluguut)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 53, "1", True)
			_ft45()
		 EndIf
	  Next
	  For $checkforlatch = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($latch)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 53, "2", True)
			_ft45()
		 EndIf
	  Next
	  For $checkforled = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($led)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 53, "3", True)
			_ft45()
		 EndIf
	  Next
	  For $checkformodule = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($module)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 53, "4", True)
			_ft45()
		 EndIf
	  Next
	  For $checkforyellow = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($yellow)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 53, "5", True)
			_ft45()
		 EndIf
	  Next
	  For $checkforpass = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($pass)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 53, "6", True)
			_ft45()
		 EndIf
	  Next
	  For $checkfordutconfiguration = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($dutconfiguration)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 53, "7", True)
			_ft45()
		 EndIf
	  Next
	  For $checkforruntime = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($runtime)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 53, "8", True)
			_ft45()
		 EndIf
	  Next
	  For $checkforlogin = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($login)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 53, "9", True)
			_ft45()
		 EndIf
	  Next
	  For $cleanram = 0 To 3
		 WinClose("VncViewer Message Box")
		 WinClose("VNC Viewer Status for")
		 WinClose("service mode")
	  Next
	  _ft45()
   EndFunc
;FT 45
Func _ft45()
   ToolTip("Searching for anomalies at FT 45... (20/27)", @DesktopWidth / 2 - 200, 0)
   ShellExecute("vncviewer.exe","135.247.88.200 -password vnc", "lib/vnc/")
   Sleep ($waitafterVNC)
   WinActivate("service mode")
   _FileWriteToLine($savestatus, 55, "0", True)
	  For $checkforpluguut = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($pluguut)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 55, "1", True)
			_ft1_16()
		 EndIf
	  Next
	  For $checkforlatch = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($latch)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 55, "2", True)
			_ft1_16()
		 EndIf
	  Next
	  For $checkforled = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($led)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 55, "3", True)
			_ft1_16()
		 EndIf
	  Next
	  For $checkformodule = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($module)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 55, "4", True)
			_ft1_16()
		 EndIf
	  Next
	  For $checkforyellow = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($yellow)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 55, "5", True)
			_ft1_16()
		 EndIf
	  Next
	  For $checkforpass = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($pass)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 55, "6", True)
			_ft1_16()
		 EndIf
	  Next
	  For $checkfordutconfiguration = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($dutconfiguration)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 55, "7", True)
			_ft1_16()
		 EndIf
	  Next
	  For $checkforruntime = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($runtime)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 55, "8", True)
			_ft1_16()
		 EndIf
	  Next
	  For $checkforlogin = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($login)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 55, "9", True)
			_ft1_16()
		 EndIf
	  Next
	  For $cleanram = 0 To 3
		 WinClose("VncViewer Message Box")
		 WinClose("VNC Viewer Status for")
		 WinClose("service mode")
	  Next
	  _ft1_16()
   EndFunc
;FT1 16
Func _ft1_16()
   ToolTip("Searching for anomalies at FT 1 16... (21/27)", @DesktopWidth / 2 - 200, 0)
   ShellExecute("vncviewer.exe","135.247.88.204 -password vnc", "lib/vnc/")
   Sleep ($waitafterVNC)
   WinActivate("service mode")
   _FileWriteToLine($savestatus, 57, "0", True)
	  For $checkforpluguut = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($pluguut)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 57, "1", True)
			_ft10()
		 EndIf
	  Next
	  For $checkforlatch = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($latch)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 57, "2", True)
			_ft10()
		 EndIf
	  Next
	  For $checkforled = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($led)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 57, "3", True)
			_ft10()
		 EndIf
	  Next
	  For $checkformodule = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($module)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 57, "4", True)
			_ft10()
		 EndIf
	  Next
	  For $checkforyellow = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($yellow)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 57, "5", True)
			_ft10()
		 EndIf
	  Next
	  For $checkforpass = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($pass)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 57, "6", True)
			_ft10()
		 EndIf
	  Next
	  For $checkfordutconfiguration = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($dutconfiguration)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 57, "7", True)
			_ft10()
		 EndIf
	  Next
	  For $checkforruntime = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($runtime)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 57, "8", True)
			_ft10()
		 EndIf
	  Next
	  For $checkforlogin = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($login)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 57, "9", True)
			_ft10()
		 EndIf
	  Next
	  For $cleanram = 0 To 3
		 WinClose("VncViewer Message Box")
		 WinClose("VNC Viewer Status for")
		 WinClose("service mode")
	  Next
	  _ft10()
   EndFunc
;FT 10
Func _ft10()
   ToolTip("Searching for anomalies at FT 10... (22/27)", @DesktopWidth / 2 - 200, 0)
   ShellExecute("vncviewer.exe","135.247.88.140 -password vnc", "lib/vnc/")
   Sleep ($waitafterVNC)
   WinActivate("service mode")
   _FileWriteToLine($savestatus, 59, "0", True)
	  For $checkforpluguut = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($pluguut)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 59, "1", True)
			_ft11()
		 EndIf
	  Next
	  For $checkforlatch = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($latch)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 59, "2", True)
			_ft11()
		 EndIf
	  Next
	  For $checkforled = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($led)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 59, "3", True)
			_ft11()
		 EndIf
	  Next
	  For $checkformodule = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($module)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 59, "4", True)
			_ft11()
		 EndIf
	  Next
	  For $checkforyellow = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($yellow)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 59, "5", True)
			_ft11()
		 EndIf
	  Next
	  For $checkforpass = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($pass)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 59, "6", True)
			_ft11()
		 EndIf
	  Next
	  For $checkfordutconfiguration = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($dutconfiguration)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 59, "7", True)
			_ft11()
		 EndIf
	  Next
	  For $checkforruntime = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($runtime)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 59, "8", True)
			_ft11()
		 EndIf
	  Next
	  For $checkforlogin = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($login)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 59, "9", True)
			_ft11()
		 EndIf
	  Next
	  For $cleanram = 0 To 3
		 WinClose("VncViewer Message Box")
		 WinClose("VNC Viewer Status for")
		 WinClose("service mode")
	  Next
	  _ft11()
   EndFunc
;FT 11
Func _ft11()
   ToolTip("Searching for anomalies at FT 11... (23/27)", @DesktopWidth / 2 - 200, 0)
   ShellExecute("vncviewer.exe","135.247.88.143 -password vnc", "lib/vnc/")
   Sleep ($waitafterVNC)
   WinActivate("service mode")
   _FileWriteToLine($savestatus, 61, "0", True)
	  For $checkforpluguut = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($pluguut)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 61, "1", True)
			_ft12()
		 EndIf
	  Next
	  For $checkforlatch = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($latch)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next

			_FileWriteToLine($savestatus, 61, "2", True)
			_ft12()
		 EndIf
	  Next
	  For $checkforled = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($led)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 61, "3", True)
			_ft12()
		 EndIf
	  Next
	  For $checkformodule = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($module)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 61, "4", True)
			_ft12()
		 EndIf
	  Next
	  For $checkforyellow = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($yellow)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 61, "5", True)
			_ft12()
		 EndIf
	  Next
	  For $checkforpass = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($pass)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 61, "6", True)
			_ft12()
		 EndIf
	  Next
	  For $checkfordutconfiguration = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($dutconfiguration)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 61, "7", True)
			_ft12()
		 EndIf
	  Next
	  For $checkforruntime = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($runtime)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 61, "8", True)
			_ft12()
		 EndIf
	  Next
	  For $checkforlogin = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($login)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 61, "9", True)
			_ft12()
		 EndIf
	  Next
	  For $cleanram = 0 To 3
		 WinClose("VncViewer Message Box")
		 WinClose("VNC Viewer Status for")
		 WinClose("service mode")
	  Next
	  _ft12()
   EndFunc
;FT 12
Func _ft12()
   ToolTip("Searching for anomalies at FT 12... (24/27)", @DesktopWidth / 2 - 200, 0)
   ShellExecute("vncviewer.exe","135.247.88.162 -password vnc", "lib/vnc/")
   Sleep ($waitafterVNC)
   WinActivate("service mode")
   _FileWriteToLine($savestatus, 63, "0", True)
	  For $checkforpluguut = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($pluguut)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 63, "1", True)
			_ft13()
		 EndIf
	  Next
	  For $checkforlatch = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($latch)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 63, "2", True)
			_ft13()
		 EndIf
	  Next
	  For $checkforled = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($led)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 63, "3", True)
			_ft13()
		 EndIf
	  Next
	  For $checkformodule = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($module)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 63, "4", True)
			_ft13()
		 EndIf
	  Next
	  For $checkforyellow = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($yellow)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 63, "5", True)
			_ft13()
		 EndIf
	  Next
	  For $checkforpass = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($pass)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 63, "6", True)
			_ft13()
		 EndIf
	  Next
	  For $checkfordutconfiguration = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($dutconfiguration)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 63, "7", True)
			_ft13()
		 EndIf
	  Next
	  For $checkforruntime = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($runtime)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 63, "8", True)
			_ft13()
		 EndIf
	  Next
	  For $checkforlogin = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($login)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 63, "9", True)
			_ft13()
		 EndIf
	  Next
	  For $cleanram = 0 To 3
		 WinClose("VncViewer Message Box")
		 WinClose("VNC Viewer Status for")
		 WinClose("service mode")
	  Next
	  _ft13()
   EndFunc
;FT 13
Func _ft13()
   ToolTip("Searching for anomalies at FT 13... (25/27)", @DesktopWidth / 2 - 200, 0)
   ShellExecute("vncviewer.exe","135.247.88.165 -password vnc", "lib/vnc/")
   Sleep ($waitafterVNC)
   WinActivate("service mode")
   _FileWriteToLine($savestatus, 65, "0", True)
	  For $checkforpluguut = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($pluguut)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 65, "1", True)
			_ft14()
		 EndIf
	  Next
	  For $checkforlatch = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($latch)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 65, "2", True)
			_ft14()
		 EndIf
	  Next
	  For $checkforled = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($led)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 65, "3", True)
			_ft14()
		 EndIf
	  Next
	  For $checkformodule = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($module)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 65, "4", True)
			_ft14()
		 EndIf
	  Next
	  For $checkforyellow = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($yellow)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 65, "5", True)
			_ft14()
		 EndIf
	  Next
	  For $checkforpass = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($pass)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 65, "6", True)
			_ft14()
		 EndIf
	  Next
	  For $checkfordutconfiguration = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($dutconfiguration)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 65, "7", True)
			_ft14()
		 EndIf
	  Next
	  For $checkforruntime = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($runtime)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 65, "8", True)
			_ft14()
		 EndIf
	  Next
	  For $checkforlogin = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($login)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 65, "9", True)
			_ft14()
		 EndIf
	  Next
	  For $cleanram = 0 To 3
		 WinClose("VncViewer Message Box")
		 WinClose("VNC Viewer Status for")
		 WinClose("service mode")
	  Next
	  _ft14()
   EndFunc
;FT 14
Func _ft14()
   ToolTip("Searching for anomalies at FT 14... (26/27)", @DesktopWidth / 2 - 200, 0)
   ShellExecute("vncviewer.exe","135.247.88.74 -password vnc", "lib/vnc/")
   Sleep ($waitafterVNC)
   WinActivate("service mode")
   _FileWriteToLine($savestatus, 67, "0", True)
	  For $checkforpluguut = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($pluguut)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 67, "1", True)
			_ft15()
		 EndIf
	  Next
	  For $checkforlatch = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($latch)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 67, "2", True)
			_ft15()
		 EndIf
	  Next
	  For $checkforled = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($led)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 67, "3", True)
			_ft15()
		 EndIf
	  Next
	  For $checkformodule = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($module)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 67, "4", True)
			_ft15()
		 EndIf
	  Next
	  For $checkforyellow = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($yellow)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 67, "5", True)
			_ft15()
		 EndIf
	  Next
	  For $checkforpass = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($pass)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 67, "6", True)
			_ft15()
		 EndIf
	  Next
	  For $checkfordutconfiguration = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($dutconfiguration)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 67, "7", True)
			_ft15()
		 EndIf
	  Next
	  For $checkforruntime = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($runtime)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 67, "8", True)
			_ft15()
		 EndIf
	  Next
	  For $checkforlogin = 0 To 3
		 Sleep ($waitbetweenSearches)
		 Local $return = _ImageSearch($login)
		 If $return[0] = 1 Then
			For $cleanram = 0 To 3
				WinClose("VncViewer Message Box")
				WinClose("VNC Viewer Status for")
				WinClose("service mode")
			Next
			_FileWriteToLine($savestatus, 67, "9", True)
			_ft15()
		 EndIf
	  Next
	  For $cleanram = 0 To 3
		 WinClose("VncViewer Message Box")
		 WinClose("VNC Viewer Status for")
		 WinClose("service mode")
	  Next
	  _ft15()
EndFunc

Func _exit()
	  For $cleanram = 0 To 3
		 WinClose("VncViewer Message Box")
		 WinClose("VNC Viewer Status for")
		 WinClose("service mode")
	  Next
    Exit 0
EndFunc