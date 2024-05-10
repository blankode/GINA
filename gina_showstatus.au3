#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>

; #INDEX# =======================================================================================================================
; Title .........: GINA - Graphics Interface Network App
; Language ......: English / Romanian
; Description ...: Return TT tests status
; Author(s) .....: Porosnicu Bogdan - blankode
; ===============================================================================================================================

HotKeySet("{Esc}", "_exit")

$MainForm = GUICreate("Graphics Interface Network App", 349, 311, @DesktopWidth / 2 - 174, @DesktopHeight / 2 - 155 ,$WS_EX_TOOLWINDOW, $WS_EX_TOPMOST)

GUISetState(@SW_SHOW)

Global $imgpath = @ScriptDir & "\lib\img\status\"
;Global $readstatus = "\\timsrv03\Common\aaaaaaaaaa\vncstatus.txt"
Global $readstatus = "vncstatus.txt"

;background images declaration
Global $gray = $imgpath & "grayBG.bmp"
Global $green = $imgpath & "greenBG.bmp"
Global $yellow = $imgpath & "yellowBG.bmp"
Global $red = $imgpath & "redBG.bmp"

Global $wait = 100
Global $waitForscan = 2000

;how to exit info
GUICtrlCreateLabel("* press ESC to exit program", 1, 2, 130, 15)

;if UUT needs intervention notify me
Local $notifications = 0, $showmessage = 0, $notifyTimeout = 0

;starts script
_checkStatus()

;[LEGEND]
;0 = UUT IS RUNNING
;1 = PLUG UUT
;2 = LATCH TEST
;3 = LEDS TEST
;4 = MODULES TEST
;5 = YELLOW
;6 = IS PASS
;7 = SCAN UUT
;8 = RUNTIME
;9 = LOGIN

Func _checkStatus()
Local $currentStatus = GUICtrlCreateLabel("getting status for FT15...", 180, 2, 130, 15)
;IF NOTIFICATIONS ARE ENABLED
   ;making sure that we show notifications if they are enabled
   If $notifications = 1 Then
	  $showmessage = 1
   EndIf
	  ;if notification timeout a certain number we reset it to 0 and so it will display again the notifications
	   If $notifyTimeout = 100 Then
		 $notifyTimeout = 0
	  EndIf
;first column
;FT 15
   Local $ft15 = FileReadLine($readstatus, 15)
   Local $toptext = 24
   Local $topBG = 20
   Sleep($waitForscan)
	  If $ft15 = 0 Then
		 $ft15status = GUICtrlCreateLabel("FT15 - ALL GOOD", 25, $toptext, 130, 15)
		 $ft15background = GUICtrlCreatePic($green, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft15 = 1 Then
		 $ft15status = GUICtrlCreateLabel("FT15 - PLUG UUT MESSAGE", 25, $toptext, 130, 15)
		 $ft15background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft15 = 2 Then
		 $ft15status = GUICtrlCreateLabel("FT15 - LATCH TEST", 25, $toptext, 130, 15)
		 $ft15background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft15 = 3 Then
		 $ft15status = GUICtrlCreateLabel("FT15 - LEDS TEST", 25, $toptext, 130, 15)
		 $ft15background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft15 = 4 Then
		 $ft15status = GUICtrlCreateLabel("FT15 - MODULES TEST", 25, $toptext, 130, 15)
		 $ft15background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft15 = 5 Then
		 $ft15status = GUICtrlCreateLabel("FT15 - DEBUG", 25, $toptext, 130, 15)
		 $ft15background = GUICtrlCreatePic($red, 1, $topBG, 170, 21)
		 If $showmessage = 1 <> $notifyTimeout = 0 Then
			MsgBox($MB_ICONERROR + $MB_TOPMOST, "GINA", "FT 15 a picat !", $MB_TOPMOST)
		 EndIf
		 Sleep($wait)
	  ElseIf $ft15 = 6 Then
		 $ft15status = GUICtrlCreateLabel("FT15 - PASS", 25, $toptext, 130, 15)
		 $ft15background = GUICtrlCreatePic($green, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft15 = 7 Then
		 $ft15status = GUICtrlCreateLabel("FT15 - SCAN UUT", 25, $toptext, 130, 15)
		 $ft15background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft15 = 8 Then
		 $ft15status = GUICtrlCreateLabel("FT15 - RUNTIME ERROR", 25, $toptext, 130, 15)
		 $ft15background = GUICtrlCreatePic($yellow, 1, $topBG, 170, 21)
		 If $showmessage = 1 <> $notifyTimeout = 0 Then
			MsgBox($MB_ICONERROR + $MB_TOPMOST, "GINA", "FT 15 apare retry!!", $MB_TOPMOST)
		 EndIf
		 Sleep($wait)
	  ElseIf $ft15 = 9 Then
		 $ft15status = GUICtrlCreateLabel("FT15 - NEED LOGIN", 25, $toptext, 130, 15)
		 $ft15background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  EndIf
	  ;increment our notifications timeout to prevent same notification appear
	  $notifyTimeout += 1
;FT 2 - 16
Local $currentStatus = GUICtrlCreateLabel("getting status for FT1 16...", 180, 2, 130, 15)
   Local $ft2_16 = FileReadLine($readstatus, 17)
   Local $toptext = 44
   Local $topBG = 40
   Sleep($waitForscan)
	  If $ft2_16 = 0 Then
		 $ft2_16status = GUICtrlCreateLabel("FT 2 16 - ALL GOOD", 25, $toptext, 130, 15)
		 $ft2_16background = GUICtrlCreatePic($green, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft2_16 = 1 Then
		 $ft2_16status = GUICtrlCreateLabel("FT 2 16 - PLUG UUT MESSAGE", 25, $toptext, 130, 15)
		 $ft2_16background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft2_16 = 2 Then
		 $ft2_16status = GUICtrlCreateLabel("FT 2 16 - LATCH TEST", 25, $toptext, 130, 15)
		 $ft2_16background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft2_16 = 3 Then
		 $ft2_16status = GUICtrlCreateLabel("FT 2 16 - LEDS TEST", 25, $toptext, 130, 15)
		 $ft2_16background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft2_16 = 4 Then
		 $ft2_16status = GUICtrlCreateLabel("FT 2 16 - MODULES TEST", 25, $toptext, 130, 15)
		 $ft2_16background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft2_16 = 5 Then
		 $ft2_16status = GUICtrlCreateLabel("FT 2 16 - DEBUG", 25, $toptext, 130, 15)
		 $ft2_16background = GUICtrlCreatePic($red, 1, $topBG, 170, 21)
		 If $showmessage = 1 <> $notifyTimeout = 0 Then
			MsgBox($MB_ICONERROR + $MB_TOPMOST, "GINA", "FT 2 16 a picat !", $MB_TOPMOST)
		 EndIf
		 Sleep($wait)
	  ElseIf $ft2_16 = 6 Then
		 $ft2_16status = GUICtrlCreateLabel("FT 2 16 - PASS", 25, $toptext, 130, 15)
		 $ft2_16background = GUICtrlCreatePic($green, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft2_16 = 7 Then
		 $ft2_16status = GUICtrlCreateLabel("FT 2 16 - SCAN UUT", 25, $toptext, 130, 15)
		 $ft2_16background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft2_16 = 8 Then
		 $ft2_16status = GUICtrlCreateLabel("FT 2 16 - RUNTIME ERROR", 25, $toptext, 130, 15)
		 $ft2_16background = GUICtrlCreatePic($yellow, 1, $topBG, 170, 21)
		 If $showmessage = 1 <> $notifyTimeout = 0 Then
			MsgBox($MB_ICONERROR + $MB_TOPMOST, "GINA", "FT 2 16 apare retry!!", $MB_TOPMOST)
		 EndIf
		 Sleep($wait)
	  ElseIf $ft2_16 = 9 Then
		 $ft2_16status = GUICtrlCreateLabel("FT 2 16 - NEED LOGIN", 25, $toptext, 130, 15)
		 $ft2_16background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  EndIf
	  ;increment our notifications timeout to prevent same notification appear
	  $notifyTimeout += 1
;FT 17
Local $currentStatus = GUICtrlCreateLabel("getting status for FT 17...", 180, 2, 130, 15)
   Local $ft17 = FileReadLine($readstatus, 19)
   Local $toptext = 64
   Local $topBG = 60
   Sleep($waitForscan)
	  If $ft17 = 0 Then
		 $ft17status = GUICtrlCreateLabel("FT 17 - ALL GOOD", 25, $toptext, 130, 15)
		 $ft17background = GUICtrlCreatePic($green, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft17 = 1 Then
		 $ft17status = GUICtrlCreateLabel("FT 17 - PLUG UUT MESSAGE", 25, $toptext, 130, 15)
		 $ft17background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft17 = 2 Then
		 $ft17status = GUICtrlCreateLabel("FT 17 - LATCH TEST", 25, $toptext, 130, 15)
		 $ft17background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft17 = 3 Then
		 $ft17status = GUICtrlCreateLabel("FT 17 - LEDS TEST", 25, $toptext, 130, 15)
		 $ft17background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft17 = 4 Then
		 $ft17status = GUICtrlCreateLabel("FT 17 - MODULES TEST", 25, $toptext, 130, 15)
		 $ft17background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft17 = 5 Then
		 $ft17status = GUICtrlCreateLabel("FT 17 - DEBUG", 25, $toptext, 130, 15)
		 $ft17background = GUICtrlCreatePic($red, 1, $topBG, 170, 21)
		 If $showmessage = 1 <> $notifyTimeout = 0 Then
			MsgBox($MB_ICONERROR + $MB_TOPMOST, "GINA", "FT 17 a picat !", $MB_TOPMOST)
		 EndIf
		 Sleep($wait)
	  ElseIf $ft17 = 6 Then
		 $ft17status = GUICtrlCreateLabel("FT 17 - PASS", 25, $toptext, 130, 15)
		 $ft17background = GUICtrlCreatePic($green, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft17 = 7 Then
		 $ft17status = GUICtrlCreateLabel("FT 17 - SCAN UUT", 25, $toptext, 130, 15)
		 $ft17background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft17 = 8 Then
		 $ft17status = GUICtrlCreateLabel("FT 17 - RUNTIME ERROR", 25, $toptext, 130, 15)
		 $ft17background = GUICtrlCreatePic($yellow, 1, $topBG, 170, 21)
		 If $showmessage = 1 <> $notifyTimeout = 0 Then
			MsgBox($MB_ICONERROR + $MB_TOPMOST, "GINA", "FT 17 apare retry!!", $MB_TOPMOST)
		 EndIf
		 Sleep($wait)
	  ElseIf $ft17 = 9 Then
		 $ft17status = GUICtrlCreateLabel("FT 17 - NEED LOGIN", 25, $toptext, 130, 15)
		 $ft17background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  EndIf
	  ;increment our notifications timeout to prevent same notification appear
	  $notifyTimeout += 1
;FT 18
Local $currentStatus = GUICtrlCreateLabel("getting status for FT 18...", 180, 2, 130, 15)
   Local $ft18 = FileReadLine($readstatus, 21)
   Local $toptext = 84
   Local $topBG = 80
   Sleep($waitForscan)
	  If $ft18 = 0 Then
		 $ft18status = GUICtrlCreateLabel("FT 18 - ALL GOOD", 25, $toptext, 130, 15)
		 $ft18background = GUICtrlCreatePic($green, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft18 = 1 Then
		 $ft18status = GUICtrlCreateLabel("FT 18 - PLUG UUT MESSAGE", 25, $toptext, 130, 15)
		 $ft18background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft18 = 2 Then
		 $ft18status = GUICtrlCreateLabel("FT 18 - LATCH TEST", 25, $toptext, 130, 15)
		 $ft18background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft18 = 3 Then
		 $ft18status = GUICtrlCreateLabel("FT 18 - LEDS TEST", 25, $toptext, 130, 15)
		 $ft18background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft18 = 4 Then
		 $ft18status = GUICtrlCreateLabel("FT 18 - MODULES TEST", 25, $toptext, 130, 15)
		 $ft18background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft18 = 5 Then
		 $ft18status = GUICtrlCreateLabel("FT 18 - DEBUG", 25, $toptext, 130, 15)
		 $ft18background = GUICtrlCreatePic($red, 1, $topBG, 170, 21)
		 If $showmessage = 1 <> $notifyTimeout = 0 Then
			MsgBox($MB_ICONERROR + $MB_TOPMOST, "GINA", "FT 18 a picat !", $MB_TOPMOST)
		 EndIf
		 Sleep($wait)
	  ElseIf $ft18 = 6 Then
		 $ft18status = GUICtrlCreateLabel("FT 18 - PASS", 25, $toptext, 130, 15)
		 $ft18background = GUICtrlCreatePic($green, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft18 = 7 Then
		 $ft18status = GUICtrlCreateLabel("FT 18 - SCAN UUT", 25, $toptext, 130, 15)
		 $ft18background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft18 = 8 Then
		 $ft18status = GUICtrlCreateLabel("FT 18 - RUNTIME ERROR", 25, $toptext, 130, 15)
		 $ft18background = GUICtrlCreatePic($yellow, 1, $topBG, 170, 21)
		 If $showmessage = 1 <> $notifyTimeout = 0 Then
			MsgBox($MB_ICONERROR + $MB_TOPMOST, "GINA", "FT 18 apare retry!!", $MB_TOPMOST)
		 EndIf
		 Sleep($wait)
	  ElseIf $ft18 = 9 Then
		 $ft18status = GUICtrlCreateLabel("FT 18 - NEED LOGIN", 25, $toptext, 130, 15)
		 $ft18background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  EndIf
	  ;increment our notifications timeout to prevent same notification appear
	  $notifyTimeout += 1
;FT 19
Local $currentStatus = GUICtrlCreateLabel("getting status for FT 19...", 180, 2, 130, 15)
   Local $ft19 = FileReadLine($readstatus, 23)
   Local $toptext = 104
   Local $topBG = 100
   Sleep($waitForscan)
	  If $ft19 = 0 Then
		 $ft19status = GUICtrlCreateLabel("FT 19 - ALL GOOD", 25, $toptext, 130, 15)
		 $ft19background = GUICtrlCreatePic($green, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft19 = 1 Then
		 $ft19status = GUICtrlCreateLabel("FT 19 - PLUG UUT MESSAGE", 25, $toptext, 130, 15)
		 $ft19background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft19 = 2 Then
		 $ft19status = GUICtrlCreateLabel("FT 19 - LATCH TEST", 25, $toptext, 130, 15)
		 $ft19background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft19 = 3 Then
		 $ft19status = GUICtrlCreateLabel("FT 19 - LEDS TEST", 25, $toptext, 130, 15)
		 $ft19background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft19 = 4 Then
		 $ft19status = GUICtrlCreateLabel("FT 19 - MODULES TEST", 25, $toptext, 130, 15)
		 $ft19background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft19 = 5 Then
		 $ft19status = GUICtrlCreateLabel("FT 19 - DEBUG", 25, $toptext, 130, 15)
		 $ft19background = GUICtrlCreatePic($red, 1, $topBG, 170, 21)
		 If $showmessage = 1 <> $notifyTimeout = 0 Then
			MsgBox($MB_ICONERROR + $MB_TOPMOST, "GINA", "FT 19 a picat !", $MB_TOPMOST)
		 EndIf
		 Sleep($wait)
	  ElseIf $ft19 = 6 Then
		 $ft19status = GUICtrlCreateLabel("FT 19 - PASS", 25, $toptext, 130, 15)
		 $ft19background = GUICtrlCreatePic($green, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft19 = 7 Then
		 $ft19status = GUICtrlCreateLabel("FT 19 - SCAN UUT", 25, $toptext, 130, 15)
		 $ft19background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft19 = 8 Then
		 $ft19status = GUICtrlCreateLabel("FT 19 - RUNTIME ERROR", 25, $toptext, 130, 15)
		 $ft19background = GUICtrlCreatePic($yellow, 1, $topBG, 170, 21)
		 If $showmessage = 1 <> $notifyTimeout = 0 Then
			MsgBox($MB_ICONERROR + $MB_TOPMOST, "GINA", "FT 19 apare retry!!", $MB_TOPMOST)
		 EndIf
		 Sleep($wait)
	  ElseIf $ft19 = 9 Then
		 $ft19status = GUICtrlCreateLabel("FT 19 - NEED LOGIN", 25, $toptext, 130, 15)
		 $ft19background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  EndIf
	  ;increment our notifications timeout to prevent same notification appear
	  $notifyTimeout += 1
;FT 20
Local $currentStatus = GUICtrlCreateLabel("getting status for FT 20...", 180, 2, 130, 15)
   Local $ft20 = FileReadLine($readstatus, 25)
   Local $toptext = 124
   Local $topBG = 120
   Sleep($waitForscan)
	  If $ft20 = 0 Then
		 $ft20status = GUICtrlCreateLabel("FT 20 - ALL GOOD", 25, $toptext, 130, 15)
		 $ft20background = GUICtrlCreatePic($green, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft20 = 1 Then
		 $ft20status = GUICtrlCreateLabel("FT 20 - PLUG UUT MESSAGE", 25, $toptext, 130, 15)
		 $ft20background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft20 = 2 Then
		 $ft20status = GUICtrlCreateLabel("FT 20 - LATCH TEST", 25, $toptext, 130, 15)
		 $ft20background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft20 = 3 Then
		 $ft20status = GUICtrlCreateLabel("FT 20 - LEDS TEST", 25, $toptext, 130, 15)
		 $ft20background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft20 = 4 Then
		 $ft20status = GUICtrlCreateLabel("FT 20 - MODULES TEST", 25, $toptext, 130, 15)
		 $ft20background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft20 = 5 Then
		 $ft20status = GUICtrlCreateLabel("FT 20 - DEBUG", 25, $toptext, 130, 15)
		 $ft20background = GUICtrlCreatePic($red, 1, $topBG, 170, 21)
		 If $showmessage = 1 <> $notifyTimeout = 0 Then
			MsgBox($MB_ICONERROR + $MB_TOPMOST, "GINA", "FT 20 a picat !", $MB_TOPMOST)
		 EndIf
		 Sleep($wait)
	  ElseIf $ft20 = 6 Then
		 $ft20status = GUICtrlCreateLabel("FT 20 - PASS", 25, $toptext, 130, 15)
		 $ft20background = GUICtrlCreatePic($green, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft20 = 7 Then
		 $ft20status = GUICtrlCreateLabel("FT 20 - SCAN UUT", 25, $toptext, 130, 15)
		 $ft20background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft20 = 8 Then
		 $ft20status = GUICtrlCreateLabel("FT 20 - RUNTIME ERROR", 25, $toptext, 130, 15)
		 $ft20background = GUICtrlCreatePic($yellow, 1, $topBG, 170, 21)
		 If $showmessage = 1 <> $notifyTimeout = 0 Then
			MsgBox($MB_ICONERROR + $MB_TOPMOST, "GINA", "FT 20 apare retry!!", $MB_TOPMOST)
		 EndIf
		 Sleep($wait)
	  ElseIf $ft20 = 9 Then
		 $ft20status = GUICtrlCreateLabel("FT 20 - NEED LOGIN", 25, $toptext, 130, 15)
		 $ft20background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  EndIf
	  ;increment our notifications timeout to prevent same notification appear
	  $notifyTimeout += 1
;FT 21
Local $currentStatus = GUICtrlCreateLabel("getting status for FT 21...", 180, 2, 130, 15)
   Local $ft21 = FileReadLine($readstatus, 27)
   Local $toptext = 144
   Local $topBG = 140
   Sleep($waitForscan)
	  If $ft21 = 0 Then
		 $ft21status = GUICtrlCreateLabel("FT 21 - ALL GOOD", 25, $toptext, 130, 15)
		 $ft21background = GUICtrlCreatePic($green, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft21 = 1 Then
		 $ft21status = GUICtrlCreateLabel("FT 21 - PLUG UUT MESSAGE", 25, $toptext, 130, 15)
		 $ft21background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft21 = 2 Then
		 $ft21status = GUICtrlCreateLabel("FT 21 - LATCH TEST", 25, $toptext, 130, 15)
		 $ft21background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft21 = 3 Then
		 $ft21status = GUICtrlCreateLabel("FT 21 - LEDS TEST", 25, $toptext, 130, 15)
		 $ft21background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft21 = 4 Then
		 $ft21status = GUICtrlCreateLabel("FT 21 - MODULES TEST", 25, $toptext, 130, 15)
		 $ft21background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft21 = 5 Then
		 $ft21status = GUICtrlCreateLabel("FT 21 - DEBUG", 25, $toptext, 130, 15)
		 $ft21background = GUICtrlCreatePic($red, 1, $topBG, 170, 21)
		 If $showmessage = 1 <> $notifyTimeout = 0 Then
			MsgBox($MB_ICONERROR + $MB_TOPMOST, "GINA", "FT 21 a picat !", $MB_TOPMOST)
		 EndIf
		 Sleep($wait)
	  ElseIf $ft21 = 6 Then
		 $ft21status = GUICtrlCreateLabel("FT 21 - PASS", 25, $toptext, 130, 15)
		 $ft21background = GUICtrlCreatePic($green, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft21 = 7 Then
		 $ft21status = GUICtrlCreateLabel("FT 21 - SCAN UUT", 25, $toptext, 130, 15)
		 $ft21background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft21 = 8 Then
		 $ft21status = GUICtrlCreateLabel("FT 21 - RUNTIME ERROR", 25, $toptext, 130, 15)
		 $ft21background = GUICtrlCreatePic($yellow, 1, $topBG, 170, 21)
		 If $showmessage = 1 <> $notifyTimeout = 0 Then
			MsgBox($MB_ICONERROR + $MB_TOPMOST, "GINA", "FT 21 apare retry!!", $MB_TOPMOST)
		 EndIf
		 Sleep($wait)
	  ElseIf $ft21 = 9 Then
		 $ft21status = GUICtrlCreateLabel("FT 21 - NEED LOGIN", 25, $toptext, 130, 15)
		 $ft21background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  EndIf
	  ;increment our notifications timeout to prevent same notification appear
	  $notifyTimeout += 1
;FT 22 (207)
Local $currentStatus = GUICtrlCreateLabel("getting status for FT 22 (207)...", 180, 2, 150, 15)
   Local $ft22_207 = FileReadLine($readstatus, 29)
   Local $toptext = 164
   Local $topBG = 160
   Sleep($waitForscan)
	  If $ft22_207 = 0 Then
		 $ft22_207status = GUICtrlCreateLabel("FT 22 (207) - ALL GOOD", 25, $toptext, 130, 15)
		 $ft22_207background = GUICtrlCreatePic($green, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft22_207 = 1 Then
		 $ft22_207status = GUICtrlCreateLabel("FT 22 (207) - PLUG UUT MESSAGE", 25, $toptext, 130, 15)
		 $ft22_207background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft22_207 = 2 Then
		 $ft22_207status = GUICtrlCreateLabel("FT 22 (207) - LATCH TEST", 25, $toptext, 130, 15)
		 $ft22_207background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft22_207 = 3 Then
		 $ft22_207status = GUICtrlCreateLabel("FT 22 (207) - LEDS TEST", 25, $toptext, 130, 15)
		 $ft22_207background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft22_207 = 4 Then
		 $ft22_207status = GUICtrlCreateLabel("FT 22 (207) - MODULES TEST", 25, $toptext, 130, 15)
		 $ft22_207background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft22_207 = 5 Then
		 $ft22_207status = GUICtrlCreateLabel("FT 22 (207) - DEBUG", 25, $toptext, 130, 15)
		 $ft22_207background = GUICtrlCreatePic($red, 1, $topBG, 170, 21)
		 If $showmessage = 1 <> $notifyTimeout = 0 Then
			MsgBox($MB_ICONERROR + $MB_TOPMOST, "GINA", "FT 22 (207) a picat !", $MB_TOPMOST)
		 EndIf
		 Sleep($wait)
	  ElseIf $ft22_207 = 6 Then
		 $ft22_207status = GUICtrlCreateLabel("FT 22 (207) - PASS", 25, $toptext, 130, 15)
		 $ft22_207background = GUICtrlCreatePic($green, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft22_207 = 7 Then
		 $ft22_207status = GUICtrlCreateLabel("FT 22 (207) - SCAN UUT", 25, $toptext, 130, 15)
		 $ft22_207background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft22_207 = 8 Then
		 $ft22_207status = GUICtrlCreateLabel("FT 22 (207) - RUNTIME ERROR", 25, $toptext, 130, 15)
		 $ft22_207background = GUICtrlCreatePic($yellow, 1, $topBG, 170, 21)
		 If $showmessage = 1 <> $notifyTimeout = 0 Then
			MsgBox($MB_ICONERROR + $MB_TOPMOST, "GINA", "FT 22 (207) apare retry!!", $MB_TOPMOST)
		 EndIf
		 Sleep($wait)
	  ElseIf $ft22_207 = 9 Then
		 $ft22_207status = GUICtrlCreateLabel("FT 22 (207) - NEED LOGIN", 25, $toptext, 130, 15)
		 $ft22_207background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  EndIf
	  ;increment our notifications timeout to prevent same notification appear
	  $notifyTimeout += 1
;FT 22 (985)
Local $currentStatus = GUICtrlCreateLabel("getting status for FT 22 (985)...", 180, 2, 150, 15)
   Local $ft22_985 = FileReadLine($readstatus, 31)
   Local $toptext = 184
   Local $topBG = 180
   Sleep($waitForscan)
	  If $ft22_985 = 0 Then
		 $ft22_985status = GUICtrlCreateLabel("FT 22 (985) - ALL GOOD", 25, $toptext, 130, 15)
		 $ft22_985background = GUICtrlCreatePic($green, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft22_985 = 1 Then
		 $ft22_985status = GUICtrlCreateLabel("FT 22 (985) - PLUG UUT MESSAGE", 25, $toptext, 130, 15)
		 $ft22_985background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft22_985 = 2 Then
		 $ft22_985status = GUICtrlCreateLabel("FT 22 (985) - LATCH TEST", 25, $toptext, 130, 15)
		 $ft22_985background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft22_985 = 3 Then
		 $ft22_985status = GUICtrlCreateLabel("FT 22 (985) - LEDS TEST", 25, $toptext, 130, 15)
		 $ft22_985background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft22_985 = 4 Then
		 $ft22_985status = GUICtrlCreateLabel("FT 22 (985) - MODULES TEST", 25, $toptext, 130, 15)
		 $ft22_985background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft22_985 = 5 Then
		 $ft22_985status = GUICtrlCreateLabel("FT 22 (985) - DEBUG", 25, $toptext, 130, 15)
		 $ft22_985background = GUICtrlCreatePic($red, 1, $topBG, 170, 21)
		 If $showmessage = 1 <> $notifyTimeout = 0 Then
			MsgBox($MB_ICONERROR + $MB_TOPMOST, "GINA", "FT 22 (985) a picat !", $MB_TOPMOST)
		 EndIf
		 Sleep($wait)
	  ElseIf $ft22_985 = 6 Then
		 $ft22_985status = GUICtrlCreateLabel("FT 22 (985) - PASS", 25, $toptext, 130, 15)
		 $ft22_985background = GUICtrlCreatePic($green, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft22_985 = 7 Then
		 $ft22_985status = GUICtrlCreateLabel("FT 22 (985) - SCAN UUT", 25, $toptext, 130, 15)
		 $ft22_985background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft22_985 = 8 Then
		 $ft22_985status = GUICtrlCreateLabel("FT 22 (985) - RUNTIME ERROR", 25, $toptext, 130, 15)
		 $ft22_985background = GUICtrlCreatePic($yellow, 1, $topBG, 170, 21)
		 If $showmessage = 1 <> $notifyTimeout = 0 Then
			MsgBox($MB_ICONERROR + $MB_TOPMOST, "GINA", "FT 22 (985) apare retry!!", $MB_TOPMOST)
		 EndIf
		 Sleep($wait)
	  ElseIf $ft22_985 = 9 Then
		 $ft22_985status = GUICtrlCreateLabel("FT 22 (985) - NEED LOGIN", 25, $toptext, 130, 15)
		 $ft22_985background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  EndIf
	  ;increment our notifications timeout to prevent same notification appear
	  $notifyTimeout += 1
;FT 36
Local $currentStatus = GUICtrlCreateLabel("getting status for FT 36)...", 180, 2, 150, 15)
   Local $ft36 = FileReadLine($readstatus, 33)
   Local $toptext = 204
   Local $topBG = 200
   Sleep($waitForscan)
	  If $ft36 = 0 Then
		 $ft36status = GUICtrlCreateLabel("FT 36 - ALL GOOD", 25, $toptext, 130, 15)
		 $ft36background = GUICtrlCreatePic($green, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft36 = 1 Then
		 $ft36status = GUICtrlCreateLabel("FT 36 - PLUG UUT MESSAGE", 25, $toptext, 130, 15)
		 $ft36background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft36 = 2 Then
		 $ft36status = GUICtrlCreateLabel("FT 36 - LATCH TEST", 25, $toptext, 130, 15)
		 $ft36background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft36 = 3 Then
		 $ft36status = GUICtrlCreateLabel("FT 36 - LEDS TEST", 25, $toptext, 130, 15)
		 $ft36background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft36 = 4 Then
		 $ft36status = GUICtrlCreateLabel("FT 36 - MODULES TEST", 25, $toptext, 130, 15)
		 $ft36background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft36 = 5 Then
		 $ft36status = GUICtrlCreateLabel("FT 36 - DEBUG", 25, $toptext, 130, 15)
		 $ft36background = GUICtrlCreatePic($red, 1, $topBG, 170, 21)
		 If $showmessage = 1 <> $notifyTimeout = 0 Then
			MsgBox($MB_ICONERROR + $MB_TOPMOST, "GINA", "FT 36 a picat !", $MB_TOPMOST)
		 EndIf
		 Sleep($wait)
	  ElseIf $ft36 = 6 Then
		 $ft36status = GUICtrlCreateLabel("FT 36 - PASS", 25, $toptext, 130, 15)
		 $ft36background = GUICtrlCreatePic($green, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft36 = 7 Then
		 $ft36status = GUICtrlCreateLabel("FT 36 - SCAN UUT", 25, $toptext, 130, 15)
		 $ft36background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft36 = 8 Then
		 $ft36status = GUICtrlCreateLabel("FT 36 - RUNTIME ERROR", 25, $toptext, 130, 15)
		 $ft36background = GUICtrlCreatePic($yellow, 1, $topBG, 170, 21)
		 If $showmessage = 1 <> $notifyTimeout = 0 Then
			MsgBox($MB_ICONERROR + $MB_TOPMOST, "GINA", "FT 36 apare retry!!", $MB_TOPMOST)
		 EndIf
		 Sleep($wait)
	  ElseIf $ft36 = 9 Then
		 $ft36status = GUICtrlCreateLabel("FT 36 - NEED LOGIN", 25, $toptext, 130, 15)
		 $ft36background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  EndIf
	  ;increment our notifications timeout to prevent same notification appear
	  $notifyTimeout += 1
;FT 37
Local $currentStatus = GUICtrlCreateLabel("getting status for FT 37...", 180, 2, 150, 15)
   Local $ft37 = FileReadLine($readstatus, 35)
   Local $toptext = 224
   Local $topBG = 220
   Sleep($waitForscan)
	  If $ft37 = 0 Then
		 $ft37status = GUICtrlCreateLabel("FT 37 - ALL GOOD", 25, $toptext, 130, 15)
		 $ft37background = GUICtrlCreatePic($green, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft37 = 1 Then
		 $ft37status = GUICtrlCreateLabel("FT 37 - PLUG UUT MESSAGE", 25, $toptext, 130, 15)
		 $ft37background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft37 = 2 Then
		 $ft37status = GUICtrlCreateLabel("FT 37 - LATCH TEST", 25, $toptext, 130, 15)
		 $ft37background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft37 = 3 Then
		 $ft37status = GUICtrlCreateLabel("FT 37 - LEDS TEST", 25, $toptext, 130, 15)
		 $ft37background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft37 = 4 Then
		 $ft37status = GUICtrlCreateLabel("FT 37 - MODULES TEST", 25, $toptext, 130, 15)
		 $ft37background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft37 = 5 Then
		 $ft37status = GUICtrlCreateLabel("FT 37 - DEBUG", 25, $toptext, 130, 15)
		 $ft37background = GUICtrlCreatePic($red, 1, $topBG, 170, 21)
		 If $showmessage = 1 <> $notifyTimeout = 0 Then
			MsgBox($MB_ICONERROR + $MB_TOPMOST, "GINA", "FT 37 a picat !", $MB_TOPMOST)
		 EndIf
		 Sleep($wait)
	  ElseIf $ft37 = 6 Then
		 $ft37status = GUICtrlCreateLabel("FT 37 - PASS", 25, $toptext, 130, 15)
		 $ft37background = GUICtrlCreatePic($green, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft37 = 7 Then
		 $ft37status = GUICtrlCreateLabel("FT 37 - SCAN UUT", 25, $toptext, 130, 15)
		 $ft37background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft37 = 8 Then
		 $ft37status = GUICtrlCreateLabel("FT 37 - RUNTIME ERROR", 25, $toptext, 130, 15)
		 $ft37background = GUICtrlCreatePic($yellow, 1, $topBG, 170, 21)
		 If $showmessage = 1 <> $notifyTimeout = 0 Then
			MsgBox($MB_ICONERROR + $MB_TOPMOST, "GINA", "FT 37 apare retry!!", $MB_TOPMOST)
		 EndIf
		 Sleep($wait)
	  ElseIf $ft37 = 9 Then
		 $ft37status = GUICtrlCreateLabel("FT 37 - NEED LOGIN", 25, $toptext, 130, 15)
		 $ft37background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  EndIf
	  ;increment our notifications timeout to prevent same notification appear
	  $notifyTimeout += 1
;FT 41
Local $currentStatus = GUICtrlCreateLabel("getting status for FT 41...", 180, 2, 150, 15)
   Local $ft41 = FileReadLine($readstatus, 37)
   Local $toptext = 244
   Local $topBG = 240
   Sleep($waitForscan)
	  If $ft41 = 0 Then
		 $ft41status = GUICtrlCreateLabel("FT 41 - ALL GOOD", 25, $toptext, 130, 15)
		 $ft41background = GUICtrlCreatePic($green, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft41 = 1 Then
		 $ft41status = GUICtrlCreateLabel("FT 41 - PLUG UUT MESSAGE", 25, $toptext, 130, 15)
		 $ft41background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft41 = 2 Then
		 $ft41status = GUICtrlCreateLabel("FT 41 - LATCH TEST", 25, $toptext, 130, 15)
		 $ft41background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft41 = 3 Then
		 $ft41status = GUICtrlCreateLabel("FT 41 - LEDS TEST", 25, $toptext, 130, 15)
		 $ft41background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft41 = 4 Then
		 $ft41status = GUICtrlCreateLabel("FT 41 - MODULES TEST", 25, $toptext, 130, 15)
		 $ft41background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft41 = 5 Then
		 $ft41status = GUICtrlCreateLabel("FT 41 - DEBUG", 25, $toptext, 130, 15)
		 $ft41background = GUICtrlCreatePic($red, 1, $topBG, 170, 21)
		 If $showmessage = 1 <> $notifyTimeout = 0 Then
			MsgBox($MB_ICONERROR + $MB_TOPMOST, "GINA", "FT 41 a picat !", $MB_TOPMOST)
		 EndIf
		 Sleep($wait)
	  ElseIf $ft41 = 6 Then
		 $ft41status = GUICtrlCreateLabel("FT 41 - PASS", 25, $toptext, 130, 15)
		 $ft41background = GUICtrlCreatePic($green, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft41 = 7 Then
		 $ft41status = GUICtrlCreateLabel("FT 41 - SCAN UUT", 25, $toptext, 130, 15)
		 $ft41background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft41 = 8 Then
		 $ft41status = GUICtrlCreateLabel("FT 41 - RUNTIME ERROR", 25, $toptext, 130, 15)
		 $ft41background = GUICtrlCreatePic($yellow, 1, $topBG, 170, 21)
		 If $showmessage = 1 <> $notifyTimeout = 0 Then
			MsgBox($MB_ICONERROR + $MB_TOPMOST, "GINA", "FT 41 apare retry!!", $MB_TOPMOST)
		 EndIf
		 Sleep($wait)
	  ElseIf $ft41 = 9 Then
		 $ft41status = GUICtrlCreateLabel("FT 41 - NEED LOGIN", 25, $toptext, 130, 15)
		 $ft41background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  EndIf
	  ;increment our notifications timeout to prevent same notification appear
	  $notifyTimeout += 1
;FT 44
Local $currentStatus = GUICtrlCreateLabel("getting status for FT 44...", 180, 2, 150, 15)
   Local $ft44 = FileReadLine($readstatus, 39)
   Local $toptext = 264
   Local $topBG = 260
   Sleep($waitForscan)
	  If $ft44 = 0 Then
		 $ft44status = GUICtrlCreateLabel("FT 44 - ALL GOOD", 25, $toptext, 130, 15)
		 $ft44background = GUICtrlCreatePic($green, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft44 = 1 Then
		 $ft44status = GUICtrlCreateLabel("FT 44 - PLUG UUT MESSAGE", 25, $toptext, 130, 15)
		 $ft44background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft44 = 2 Then
		 $ft44status = GUICtrlCreateLabel("FT 44 - LATCH TEST", 25, $toptext, 130, 15)
		 $ft44background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft44 = 3 Then
		 $ft44status = GUICtrlCreateLabel("FT 44 - LEDS TEST", 25, $toptext, 130, 15)
		 $ft44background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft44 = 4 Then
		 $ft44status = GUICtrlCreateLabel("FT 44 - MODULES TEST", 25, $toptext, 130, 15)
		 $ft44background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft44 = 5 Then
		 $ft44status = GUICtrlCreateLabel("FT 44 - DEBUG", 25, $toptext, 130, 15)
		 $ft44background = GUICtrlCreatePic($red, 1, $topBG, 170, 21)
		 If $showmessage = 1 <> $notifyTimeout = 0 Then
			MsgBox($MB_ICONERROR + $MB_TOPMOST, "GINA", "FT 44 a picat !", $MB_TOPMOST)
		 EndIf
		 Sleep($wait)
	  ElseIf $ft44 = 6 Then
		 $ft44status = GUICtrlCreateLabel("FT 44 - PASS", 25, $toptext, 130, 15)
		 $ft44background = GUICtrlCreatePic($green, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft44 = 7 Then
		 $ft44status = GUICtrlCreateLabel("FT 44 - SCAN UUT", 25, $toptext, 130, 15)
		 $ft44background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft44 = 8 Then
		 $ft44status = GUICtrlCreateLabel("FT 44 - RUNTIME ERROR", 25, $toptext, 130, 15)
		 $ft44background = GUICtrlCreatePic($yellow, 1, $topBG, 170, 21)
		 If $showmessage = 1 <> $notifyTimeout = 0 Then
			MsgBox($MB_ICONERROR + $MB_TOPMOST, "GINA", "FT 44 apare retry!!", $MB_TOPMOST)
		 EndIf
		 Sleep($wait)
	  ElseIf $ft44 = 9 Then
		 $ft44status = GUICtrlCreateLabel("FT 44 - NEED LOGIN", 25, $toptext, 130, 15)
		 $ft44background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  EndIf
	  ;increment our notifications timeout to prevent same notification appear
	  $notifyTimeout += 1
;FT 49
Local $currentStatus = GUICtrlCreateLabel("getting status for FT 49...", 180, 2, 150, 15)
   Local $ft49 = FileReadLine($readstatus, 41)
   Local $toptext = 284
   Local $topBG = 280
   Sleep($waitForscan)
	  If $ft49 = 0 Then
		 $ft49status = GUICtrlCreateLabel("FT 49 - ALL GOOD", 25, $toptext, 130, 15)
		 $ft49background = GUICtrlCreatePic($green, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft49 = 1 Then
		 $ft49status = GUICtrlCreateLabel("FT 49 - PLUG UUT MESSAGE", 25, $toptext, 130, 15)
		 $ft49background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft49 = 2 Then
		 $ft49status = GUICtrlCreateLabel("FT 49 - LATCH TEST", 25, $toptext, 130, 15)
		 $ft49background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft49 = 3 Then
		 $ft49status = GUICtrlCreateLabel("FT 49 - LEDS TEST", 25, $toptext, 130, 15)
		 $ft49background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft49 = 4 Then
		 $ft49status = GUICtrlCreateLabel("FT 49 - MODULES TEST", 25, $toptext, 130, 15)
		 $ft49background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft49 = 5 Then
		 $ft49status = GUICtrlCreateLabel("FT 49 - DEBUG", 25, $toptext, 130, 15)
		 $ft49background = GUICtrlCreatePic($red, 1, $topBG, 170, 21)
		 If $showmessage = 1 <> $notifyTimeout = 0 Then
			MsgBox($MB_ICONERROR + $MB_TOPMOST, "GINA", "FT 49 a picat !", $MB_TOPMOST)
		 EndIf
		 Sleep($wait)
	  ElseIf $ft49 = 6 Then
		 $ft49status = GUICtrlCreateLabel("FT 49 - PASS", 25, $toptext, 130, 15)
		 $ft49background = GUICtrlCreatePic($green, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft49 = 7 Then
		 $ft49status = GUICtrlCreateLabel("FT 49 - SCAN UUT", 25, $toptext, 130, 15)
		 $ft49background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft49 = 8 Then
		 $ft49status = GUICtrlCreateLabel("FT 49 - RUNTIME ERROR", 25, $toptext, 130, 15)
		 $ft49background = GUICtrlCreatePic($yellow, 1, $topBG, 170, 21)
		 If $showmessage = 1 <> $notifyTimeout = 0 Then
			MsgBox($MB_ICONERROR + $MB_TOPMOST, "GINA", "FT 49 apare retry!!", $MB_TOPMOST)
		 EndIf
		 Sleep($wait)
	  ElseIf $ft49 = 9 Then
		 $ft49status = GUICtrlCreateLabel("FT 49 - NEED LOGIN", 25, $toptext, 130, 15)
		 $ft49background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  EndIf
	  ;increment our notifications timeout to prevent same notification appear
	  $notifyTimeout += 1
;FT 25
Local $currentStatus = GUICtrlCreateLabel("getting status for FT 25...", 180, 2, 150, 15)
   Local $ft25 = FileReadLine($readstatus, 43)
   Local $toptext = 304
   Local $topBG = 300
   Sleep($waitForscan)
	  If $ft25 = 0 Then
		 $ft25status = GUICtrlCreateLabel("FT 25 - ALL GOOD", 25, $toptext, 130, 15)
		 $ft25background = GUICtrlCreatePic($green, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft25 = 1 Then
		 $ft25status = GUICtrlCreateLabel("FT 25 - PLUG UUT MESSAGE", 25, $toptext, 130, 15)
		 $ft25background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft25 = 2 Then
		 $ft25status = GUICtrlCreateLabel("FT 25 - LATCH TEST", 25, $toptext, 130, 15)
		 $ft25background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft25 = 3 Then
		 $ft25status = GUICtrlCreateLabel("FT 25 - LEDS TEST", 25, $toptext, 130, 15)
		 $ft25background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft25 = 4 Then
		 $ft25status = GUICtrlCreateLabel("FT 25 - MODULES TEST", 25, $toptext, 130, 15)
		 $ft25background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft25 = 5 Then
		 $ft25status = GUICtrlCreateLabel("FT 25 - DEBUG", 25, $toptext, 130, 15)
		 $ft25background = GUICtrlCreatePic($red, 1, $topBG, 170, 21)
		 If $showmessage = 1 <> $notifyTimeout = 0 Then
			MsgBox($MB_ICONERROR + $MB_TOPMOST, "GINA", "FT 25 a picat !", $MB_TOPMOST)
		 EndIf
		 Sleep($wait)
	  ElseIf $ft25 = 6 Then
		 $ft25status = GUICtrlCreateLabel("FT 25 - PASS", 25, $toptext, 130, 15)
		 $ft25background = GUICtrlCreatePic($green, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft25 = 7 Then
		 $ft25status = GUICtrlCreateLabel("FT 25 - SCAN UUT", 25, $toptext, 130, 15)
		 $ft25background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft25 = 8 Then
		 $ft25status = GUICtrlCreateLabel("FT 25 - RUNTIME ERROR", 25, $toptext, 130, 15)
		 $ft25background = GUICtrlCreatePic($yellow, 1, $topBG, 170, 21)
		 If $showmessage = 1 <> $notifyTimeout = 0 Then
			MsgBox($MB_ICONERROR + $MB_TOPMOST, "GINA", "FT 25 apare retry!!", $MB_TOPMOST)
		 EndIf
		 Sleep($wait)
	  ElseIf $ft25 = 9 Then
		 $ft25status = GUICtrlCreateLabel("FT 25 - NEED LOGIN", 25, $toptext, 130, 15)
		 $ft25background = GUICtrlCreatePic($gray, 1, $topBG, 170, 21)
		 Sleep($wait)
	  EndIf
	  ;increment our notifications timeout to prevent same notification appear
	  $notifyTimeout += 1
;second column
;FT 50
Local $currentStatus = GUICtrlCreateLabel("getting status for FT 50...", 180, 2, 150, 15)
   Local $ft50 = FileReadLine($readstatus, 45)
   Local $toptext = 24
   Local $topBG = 20
   Sleep($waitForscan)
	  If $ft50 = 0 Then
		 $ft50status = GUICtrlCreateLabel("FT 50 - ALL GOOD", 196, $toptext, 130, 15)
		 $ft50background = GUICtrlCreatePic($green, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft50 = 1 Then
		 $ft50status = GUICtrlCreateLabel("FT 50 - PLUG UUT MESSAGE", 196, $toptext, 130, 15)
		 $ft50background = GUICtrlCreatePic($gray, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft50 = 2 Then
		 $ft50status = GUICtrlCreateLabel("FT 50 - LATCH TEST", 196, $toptext, 130, 15)
		 $ft50background = GUICtrlCreatePic($gray, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft50 = 3 Then
		 $ft50status = GUICtrlCreateLabel("FT 50 - LEDS TEST", 196, $toptext, 130, 15)
		 $ft50background = GUICtrlCreatePic($gray, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft50 = 4 Then
		 $ft50status = GUICtrlCreateLabel("FT 50 - MODULES TEST", 196, $toptext, 130, 15)
		 $ft50background = GUICtrlCreatePic($gray, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft50 = 5 Then
		 $ft50status = GUICtrlCreateLabel("FT 50 - DEBUG", 196, $toptext, 130, 15)
		 $ft50background = GUICtrlCreatePic($red, 172, $topBG, 170, 21)
		 If $showmessage = 1 <> $notifyTimeout = 0 Then
			MsgBox($MB_ICONERROR + $MB_TOPMOST, "GINA", "FT 50 a picat !", $MB_TOPMOST)
		 EndIf
		 Sleep($wait)
	  ElseIf $ft50 = 6 Then
		 $ft50status = GUICtrlCreateLabel("FT 50 - PASS", 196, $toptext, 130, 15)
		 $ft50background = GUICtrlCreatePic($green, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft50 = 7 Then
		 $ft50status = GUICtrlCreateLabel("FT 50 - SCAN UUT", 196, $toptext, 130, 15)
		 $ft50background = GUICtrlCreatePic($gray, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft50 = 8 Then
		 $ft50status = GUICtrlCreateLabel("FT 50 - RUNTIME ERROR", 196, $toptext, 130, 15)
		 $ft50background = GUICtrlCreatePic($yellow, 172, $topBG, 170, 21)
		 If $showmessage = 1 <> $notifyTimeout = 0 Then
			MsgBox($MB_ICONERROR + $MB_TOPMOST, "GINA", "FT 50 apare retry!!", $MB_TOPMOST)
		 EndIf
		 Sleep($wait)
	  ElseIf $ft50 = 9 Then
		 $ft50status = GUICtrlCreateLabel("FT 50 - NEED LOGIN", 196, $toptext, 130, 15)
		 $ft50background = GUICtrlCreatePic($gray, 172, $topBG, 170, 21)
		 Sleep($wait)
	  EndIf
	  ;increment our notifications timeout to prevent same notification appear
	  $notifyTimeout += 1
;FT 51
Local $currentStatus = GUICtrlCreateLabel("getting status for FT 51...", 180, 2, 150, 15)
   Local $ft51 = FileReadLine($readstatus, 47)
   Local $toptext = 44
   Local $topBG = 40
   Sleep($waitForscan)
	  If $ft51 = 0 Then
		 $ft51status = GUICtrlCreateLabel("FT 51 - ALL GOOD", 196, $toptext, 130, 15)
		 $ft51background = GUICtrlCreatePic($green, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft51 = 1 Then
		 $ft51status = GUICtrlCreateLabel("FT 51 - PLUG UUT MESSAGE", 196, $toptext, 130, 15)
		 $ft51background = GUICtrlCreatePic($gray, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft51 = 2 Then
		 $ft51status = GUICtrlCreateLabel("FT 51 - LATCH TEST", 196, $toptext, 130, 15)
		 $ft51background = GUICtrlCreatePic($gray, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft51 = 3 Then
		 $ft51status = GUICtrlCreateLabel("FT 51 - LEDS TEST", 196, $toptext, 130, 15)
		 $ft51background = GUICtrlCreatePic($gray, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft51 = 4 Then
		 $ft51status = GUICtrlCreateLabel("FT 51 - MODULES TEST", 196, $toptext, 130, 15)
		 $ft51background = GUICtrlCreatePic($gray, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft51 = 5 Then
		 $ft51status = GUICtrlCreateLabel("FT 51 - DEBUG", 196, $toptext, 130, 15)
		 $ft51background = GUICtrlCreatePic($red, 172, $topBG, 170, 21)
		 If $showmessage = 1 <> $notifyTimeout = 0 Then
			MsgBox($MB_ICONERROR + $MB_TOPMOST, "GINA", "FT 51 a picat !", $MB_TOPMOST)
		 EndIf
		 Sleep($wait)
	  ElseIf $ft51 = 6 Then
		 $ft51status = GUICtrlCreateLabel("FT 51 - PASS", 196, $toptext, 130, 15)
		 $ft51background = GUICtrlCreatePic($green, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft51 = 7 Then
		 $ft51status = GUICtrlCreateLabel("FT 51 - SCAN UUT", 196, $toptext, 130, 15)
		 $ft51background = GUICtrlCreatePic($gray, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft51 = 8 Then
		 $ft51status = GUICtrlCreateLabel("FT 51 - RUNTIME ERROR", 196, $toptext, 130, 15)
		 $ft51background = GUICtrlCreatePic($yellow, 172, $topBG, 170, 21)
		 If $showmessage = 1 <> $notifyTimeout = 0 Then
			MsgBox($MB_ICONERROR + $MB_TOPMOST, "GINA", "FT 51 apare retry!!", $MB_TOPMOST)
		 EndIf
		 Sleep($wait)
	  ElseIf $ft51 = 9 Then
		 $ft51status = GUICtrlCreateLabel("FT 51 - NEED LOGIN", 196, $toptext, 130, 15)
		 $ft51background = GUICtrlCreatePic($gray, 172, $topBG, 170, 21)
		 Sleep($wait)
	  EndIf
	  ;increment our notifications timeout to prevent same notification appear
	  $notifyTimeout += 1
;FT 48
Local $currentStatus = GUICtrlCreateLabel("getting status for FT 48...", 180, 2, 150, 15)
   Local $ft48 = FileReadLine($readstatus, 49)
   Local $toptext = 64
   Local $topBG = 60
   Sleep($waitForscan)
	  If $ft48 = 0 Then
		 $ft48status = GUICtrlCreateLabel("FT 48 - ALL GOOD", 196, $toptext, 130, 15)
		 $ft48background = GUICtrlCreatePic($green, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft48 = 1 Then
		 $ft48status = GUICtrlCreateLabel("FT 48 - PLUG UUT MESSAGE", 196, $toptext, 130, 15)
		 $ft48background = GUICtrlCreatePic($gray, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft48 = 2 Then
		 $ft48status = GUICtrlCreateLabel("FT 48 - LATCH TEST", 196, $toptext, 130, 15)
		 $ft48background = GUICtrlCreatePic($gray, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft48 = 3 Then
		 $ft48status = GUICtrlCreateLabel("FT 48 - LEDS TEST", 196, $toptext, 130, 15)
		 $ft48background = GUICtrlCreatePic($gray, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft48 = 4 Then
		 $ft48status = GUICtrlCreateLabel("FT 48 - MODULES TEST", 196, $toptext, 130, 15)
		 $ft48background = GUICtrlCreatePic($gray, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft48 = 5 Then
		 $ft48status = GUICtrlCreateLabel("FT 48 - DEBUG", 196, $toptext, 130, 15)
		 $ft48background = GUICtrlCreatePic($red, 172, $topBG, 170, 21)
		 If $showmessage = 1 <> $notifyTimeout = 0 Then
			MsgBox($MB_ICONERROR + $MB_TOPMOST, "GINA", "FT 48 a picat !", $MB_TOPMOST)
		 EndIf
		 Sleep($wait)
	  ElseIf $ft48 = 6 Then
		 $ft48status = GUICtrlCreateLabel("FT 48 - PASS", 196, $toptext, 130, 15)
		 $ft48background = GUICtrlCreatePic($green, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft48 = 7 Then
		 $ft48status = GUICtrlCreateLabel("FT 48 - SCAN UUT", 196, $toptext, 130, 15)
		 $ft48background = GUICtrlCreatePic($gray, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft48 = 8 Then
		 $ft48status = GUICtrlCreateLabel("FT 48 - RUNTIME ERROR", 196, $toptext, 130, 15)
		 $ft48background = GUICtrlCreatePic($yellow, 172, $topBG, 170, 21)
		 If $showmessage = 1 <> $notifyTimeout = 0 Then
			MsgBox($MB_ICONERROR + $MB_TOPMOST, "GINA", "FT 48 apare retry!!", $MB_TOPMOST)
		 EndIf
		 Sleep($wait)
	  ElseIf $ft48 = 9 Then
		 $ft48status = GUICtrlCreateLabel("FT 48 - NEED LOGIN", 196, $toptext, 130, 15)
		 $ft48background = GUICtrlCreatePic($gray, 172, $topBG, 170, 21)
		 Sleep($wait)
	  EndIf
	  ;increment our notifications timeout to prevent same notification appear
	  $notifyTimeout += 1
;FT 47
Local $currentStatus = GUICtrlCreateLabel("getting status for FT 47...", 180, 2, 150, 15)
   Local $ft47 = FileReadLine($readstatus, 51)
   Local $toptext = 84
   Local $topBG = 80
   Sleep($waitForscan)
	  If $ft47 = 0 Then
		 $ft47status = GUICtrlCreateLabel("FT 47 - ALL GOOD", 196, $toptext, 130, 15)
		 $ft47background = GUICtrlCreatePic($green, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft47 = 1 Then
		 $ft47status = GUICtrlCreateLabel("FT 47 - PLUG UUT MESSAGE", 196, $toptext, 130, 15)
		 $ft47background = GUICtrlCreatePic($gray, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft47 = 2 Then
		 $ft47status = GUICtrlCreateLabel("FT 47 - LATCH TEST", 196, $toptext, 130, 15)
		 $ft47background = GUICtrlCreatePic($gray, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft47 = 3 Then
		 $ft47status = GUICtrlCreateLabel("FT 47 - LEDS TEST", 196, $toptext, 130, 15)
		 $ft47background = GUICtrlCreatePic($gray, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft47 = 4 Then
		 $ft47status = GUICtrlCreateLabel("FT 47 - MODULES TEST", 196, $toptext, 130, 15)
		 $ft47background = GUICtrlCreatePic($gray, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft47 = 5 Then
		 $ft47status = GUICtrlCreateLabel("FT 47 - DEBUG", 196, $toptext, 130, 15)
		 $ft47background = GUICtrlCreatePic($red, 172, $topBG, 170, 21)
		 If $showmessage = 1 <> $notifyTimeout = 0 Then
			MsgBox($MB_ICONERROR + $MB_TOPMOST, "GINA", "FT 47 a picat !", $MB_TOPMOST)
		 EndIf
		 Sleep($wait)
	  ElseIf $ft47 = 6 Then
		 $ft47status = GUICtrlCreateLabel("FT 47 - PASS", 196, $toptext, 130, 15)
		 $ft47background = GUICtrlCreatePic($green, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft47 = 7 Then
		 $ft47status = GUICtrlCreateLabel("FT 47 - SCAN UUT", 196, $toptext, 130, 15)
		 $ft47background = GUICtrlCreatePic($gray, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft47 = 8 Then
		 $ft47status = GUICtrlCreateLabel("FT 47 - RUNTIME ERROR", 196, $toptext, 130, 15)
		 $ft47background = GUICtrlCreatePic($yellow, 172, $topBG, 170, 21)
		 If $showmessage = 1 <> $notifyTimeout = 0 Then
			MsgBox($MB_ICONERROR + $MB_TOPMOST, "GINA", "FT 47 apare retry!!", $MB_TOPMOST)
		 EndIf
		 Sleep($wait)
	  ElseIf $ft47 = 9 Then
		 $ft47status = GUICtrlCreateLabel("FT 47 - NEED LOGIN", 196, $toptext, 130, 15)
		 $ft47background = GUICtrlCreatePic($gray, 172, $topBG, 170, 21)
		 Sleep($wait)
	  EndIf
	  ;increment our notifications timeout to prevent same notification appear
	  $notifyTimeout += 1
;FT 46
Local $currentStatus = GUICtrlCreateLabel("getting status for FT 46...", 180, 2, 150, 15)
   Local $ft46 = FileReadLine($readstatus, 53)
   Local $toptext = 104
   Local $topBG = 100
   Sleep($waitForscan)
	  If $ft46 = 0 Then
		 $ft46status = GUICtrlCreateLabel("FT 46 - ALL GOOD", 196, $toptext, 130, 15)
		 $ft46background = GUICtrlCreatePic($green, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft46 = 1 Then
		 $ft46status = GUICtrlCreateLabel("FT 46 - PLUG UUT MESSAGE", 196, $toptext, 130, 15)
		 $ft46background = GUICtrlCreatePic($gray, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft46 = 2 Then
		 $ft46status = GUICtrlCreateLabel("FT 46 - LATCH TEST", 196, $toptext, 130, 15)
		 $ft46background = GUICtrlCreatePic($gray, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft46 = 3 Then
		 $ft46status = GUICtrlCreateLabel("FT 46 - LEDS TEST", 196, $toptext, 130, 15)
		 $ft46background = GUICtrlCreatePic($gray, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft46 = 4 Then
		 $ft46status = GUICtrlCreateLabel("FT 46 - MODULES TEST", 196, $toptext, 130, 15)
		 $ft46background = GUICtrlCreatePic($gray, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft46 = 5 Then
		 $ft46status = GUICtrlCreateLabel("FT 46 - DEBUG", 196, $toptext, 130, 15)
		 $ft46background = GUICtrlCreatePic($red, 172, $topBG, 170, 21)
		 If $showmessage = 1 <> $notifyTimeout = 0 Then
			MsgBox($MB_ICONERROR + $MB_TOPMOST, "GINA", "FT 46 a picat !", $MB_TOPMOST)
		 EndIf
		 Sleep($wait)
	  ElseIf $ft46 = 6 Then
		 $ft46status = GUICtrlCreateLabel("FT 46 - PASS", 196, $toptext, 130, 15)
		 $ft46background = GUICtrlCreatePic($green, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft46 = 7 Then
		 $ft46status = GUICtrlCreateLabel("FT 46 - SCAN UUT", 196, $toptext, 130, 15)
		 $ft46background = GUICtrlCreatePic($gray, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft46 = 8 Then
		 $ft46status = GUICtrlCreateLabel("FT 46 - RUNTIME ERROR", 196, $toptext, 130, 15)
		 $ft46background = GUICtrlCreatePic($yellow, 172, $topBG, 170, 21)
		 If $showmessage = 1 <> $notifyTimeout = 0 Then
			MsgBox($MB_ICONERROR + $MB_TOPMOST, "GINA", "FT 46 apare retry!!", $MB_TOPMOST)
		 EndIf
		 Sleep($wait)
	  ElseIf $ft46 = 9 Then
		 $ft46status = GUICtrlCreateLabel("FT 46 - NEED LOGIN", 196, $toptext, 130, 15)
		 $ft46background = GUICtrlCreatePic($gray, 172, $topBG, 170, 21)
		 Sleep($wait)
	  EndIf
	  ;increment our notifications timeout to prevent same notification appear
	  $notifyTimeout += 1
;FT 45
Local $currentStatus = GUICtrlCreateLabel("getting status for FT 45...", 180, 2, 150, 15)
   Local $ft45 = FileReadLine($readstatus, 55)
   Local $toptext = 124
   Local $topBG = 120
   Sleep($waitForscan)
	  If $ft45 = 0 Then
		 $ft45status = GUICtrlCreateLabel("FT 45 - ALL GOOD", 196, $toptext, 130, 15)
		 $ft45background = GUICtrlCreatePic($green, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft45 = 1 Then
		 $ft45status = GUICtrlCreateLabel("FT 45 - PLUG UUT MESSAGE", 196, $toptext, 130, 15)
		 $ft45background = GUICtrlCreatePic($gray, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft45 = 2 Then
		 $ft45status = GUICtrlCreateLabel("FT 45 - LATCH TEST", 196, $toptext, 130, 15)
		 $ft45background = GUICtrlCreatePic($gray, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft45 = 3 Then
		 $ft45status = GUICtrlCreateLabel("FT 45 - LEDS TEST", 196, $toptext, 130, 15)
		 $ft45background = GUICtrlCreatePic($gray, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft45 = 4 Then
		 $ft45status = GUICtrlCreateLabel("FT 45 - MODULES TEST", 196, $toptext, 130, 15)
		 $ft45background = GUICtrlCreatePic($gray, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft45 = 5 Then
		 $ft45status = GUICtrlCreateLabel("FT 45 - DEBUG", 196, $toptext, 130, 15)
		 $ft45background = GUICtrlCreatePic($red, 172, $topBG, 170, 21)
		 If $showmessage = 1 <> $notifyTimeout = 0 Then
			MsgBox($MB_ICONERROR + $MB_TOPMOST, "GINA", "FT 45 a picat !", $MB_TOPMOST)
		 EndIf
		 Sleep($wait)
	  ElseIf $ft45 = 6 Then
		 $ft45status = GUICtrlCreateLabel("FT 45 - PASS", 196, $toptext, 130, 15)
		 $ft45background = GUICtrlCreatePic($green, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft45 = 7 Then
		 $ft45status = GUICtrlCreateLabel("FT 45 - SCAN UUT", 196, $toptext, 130, 15)
		 $ft45background = GUICtrlCreatePic($gray, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft45 = 8 Then
		 $ft45status = GUICtrlCreateLabel("FT 45 - RUNTIME ERROR", 196, $toptext, 130, 15)
		 $ft45background = GUICtrlCreatePic($yellow, 172, $topBG, 170, 21)
		 If $showmessage = 1 <> $notifyTimeout = 0 Then
			MsgBox($MB_ICONERROR + $MB_TOPMOST, "GINA", "FT 45 apare retry!!", $MB_TOPMOST)
		 EndIf
		 Sleep($wait)
	  ElseIf $ft45 = 9 Then
		 $ft45status = GUICtrlCreateLabel("FT 45 - NEED LOGIN", 196, $toptext, 130, 15)
		 $ft45background = GUICtrlCreatePic($gray, 172, $topBG, 170, 21)
		 Sleep($wait)
	  EndIf
	  ;increment our notifications timeout to prevent same notification appear
	  $notifyTimeout += 1
;FT 1 16
Local $currentStatus = GUICtrlCreateLabel("getting status for FT 1 16...", 180, 2, 150, 15)
   Local $ft1_16 = FileReadLine($readstatus, 57)
   Local $toptext = 144
   Local $topBG = 140
   Sleep($waitForscan)
	  If $ft1_16 = 0 Then
		 $ft1_16status = GUICtrlCreateLabel("FT 1 16 - ALL GOOD", 196, $toptext, 130, 15)
		 $ft1_16background = GUICtrlCreatePic($green, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft1_16 = 1 Then
		 $ft1_16status = GUICtrlCreateLabel("FT 1 16 - PLUG UUT MESSAGE", 196, $toptext, 130, 15)
		 $ft1_16background = GUICtrlCreatePic($gray, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft1_16 = 2 Then
		 $ft1_16status = GUICtrlCreateLabel("FT 1 16 - LATCH TEST", 196, $toptext, 130, 15)
		 $ft1_16background = GUICtrlCreatePic($gray, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft1_16 = 3 Then
		 $ft1_16status = GUICtrlCreateLabel("FT 1 16 - LEDS TEST", 196, $toptext, 130, 15)
		 $ft1_16background = GUICtrlCreatePic($gray, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft1_16 = 4 Then
		 $ft1_16status = GUICtrlCreateLabel("FT 1 16 - MODULES TEST", 196, $toptext, 130, 15)
		 $ft1_16background = GUICtrlCreatePic($gray, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft1_16 = 5 Then
		 $ft1_16status = GUICtrlCreateLabel("FT 1 16 - DEBUG", 196, $toptext, 130, 15)
		 $ft1_16background = GUICtrlCreatePic($red, 172, $topBG, 170, 21)
		 If $showmessage = 1 <> $notifyTimeout = 0 Then
			MsgBox($MB_ICONERROR + $MB_TOPMOST, "GINA", "FT 1 16 a picat !", $MB_TOPMOST)
		 EndIf
		 Sleep($wait)
	  ElseIf $ft1_16 = 6 Then
		 $ft1_16status = GUICtrlCreateLabel("FT 1 16 - PASS", 196, $toptext, 130, 15)
		 $ft1_16background = GUICtrlCreatePic($green, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft1_16 = 7 Then
		 $ft1_16status = GUICtrlCreateLabel("FT 1 16 - SCAN UUT", 196, $toptext, 130, 15)
		 $ft1_16background = GUICtrlCreatePic($gray, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft1_16 = 8 Then
		 $ft1_16status = GUICtrlCreateLabel("FT 1 16 - RUNTIME ERROR", 196, $toptext, 130, 15)
		 $ft1_16background = GUICtrlCreatePic($yellow, 172, $topBG, 170, 21)
		 If $showmessage = 1 <> $notifyTimeout = 0 Then
			MsgBox($MB_ICONERROR + $MB_TOPMOST, "GINA", "FT 1 16 apare retry!!", $MB_TOPMOST)
		 EndIf
		 Sleep($wait)
	  ElseIf $ft1_16 = 9 Then
		 $ft1_16status = GUICtrlCreateLabel("FT 1 16 - NEED LOGIN", 196, $toptext, 130, 15)
		 $ft1_16background = GUICtrlCreatePic($gray, 172, $topBG, 170, 21)
		 Sleep($wait)
	  EndIf
	  ;increment our notifications timeout to prevent same notification appear
	  $notifyTimeout += 1
;FT 10
Local $currentStatus = GUICtrlCreateLabel("getting status for FT 10...", 180, 2, 150, 15)
   Local $ft10 = FileReadLine($readstatus, 59)
   Local $toptext = 164
   Local $topBG = 160
   Sleep($waitForscan)
	  If $ft10 = 0 Then
		 $ft10status = GUICtrlCreateLabel("FT 10 - ALL GOOD", 196, $toptext, 130, 15)
		 $ft10background = GUICtrlCreatePic($green, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft10 = 1 Then
		 $ft10status = GUICtrlCreateLabel("FT 10 - PLUG UUT MESSAGE", 196, $toptext, 130, 15)
		 $ft10background = GUICtrlCreatePic($gray, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft10 = 2 Then
		 $ft10status = GUICtrlCreateLabel("FT 10 - LATCH TEST", 196, $toptext, 130, 15)
		 $ft10background = GUICtrlCreatePic($gray, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft10 = 3 Then
		 $ft10status = GUICtrlCreateLabel("FT 10 - LEDS TEST", 196, $toptext, 130, 15)
		 $ft10background = GUICtrlCreatePic($gray, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft10 = 4 Then
		 $ft10status = GUICtrlCreateLabel("FT 10 - MODULES TEST", 196, $toptext, 130, 15)
		 $ft10background = GUICtrlCreatePic($gray, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft10 = 5 Then
		 $ft10status = GUICtrlCreateLabel("FT 10 - DEBUG", 196, $toptext, 130, 15)
		 $ft10background = GUICtrlCreatePic($red, 172, $topBG, 170, 21)
		 If $showmessage = 1 <> $notifyTimeout = 0 Then
			MsgBox($MB_ICONERROR + $MB_TOPMOST, "GINA", "FT 10 a picat !", $MB_TOPMOST)
		 EndIf
		 Sleep($wait)
	  ElseIf $ft10 = 6 Then
		 $ft10status = GUICtrlCreateLabel("FT 10 - PASS", 196, $toptext, 130, 15)
		 $ft10background = GUICtrlCreatePic($green, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft10 = 7 Then
		 $ft10status = GUICtrlCreateLabel("FT 10 - SCAN UUT", 196, $toptext, 130, 15)
		 $ft10background = GUICtrlCreatePic($gray, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft10 = 8 Then
		 $ft10status = GUICtrlCreateLabel("FT 10 - RUNTIME ERROR", 196, $toptext, 130, 15)
		 $ft10background = GUICtrlCreatePic($yellow, 172, $topBG, 170, 21)
		 If $showmessage = 1 <> $notifyTimeout = 0 Then
			MsgBox($MB_ICONERROR + $MB_TOPMOST, "GINA", "FT 10 apare retry!!", $MB_TOPMOST)
		 EndIf
		 Sleep($wait)
	  ElseIf $ft10 = 9 Then
		 $ft10status = GUICtrlCreateLabel("FT 10 - NEED LOGIN", 196, $toptext, 130, 15)
		 $ft10background = GUICtrlCreatePic($gray, 172, $topBG, 170, 21)
		 Sleep($wait)
	  EndIf
	  ;increment our notifications timeout to prevent same notification appear
	  $notifyTimeout += 1
;FT 11
Local $currentStatus = GUICtrlCreateLabel("getting status for FT 11...", 180, 2, 150, 15)
   Local $ft11 = FileReadLine($readstatus, 61)
   Local $toptext = 184
   Local $topBG = 180
   Sleep($waitForscan)
	  If $ft11 = 0 Then
		 $ft11status = GUICtrlCreateLabel("FT 11 - ALL GOOD", 196, $toptext, 130, 15)
		 $ft11background = GUICtrlCreatePic($green, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft11 = 1 Then
		 $ft11status = GUICtrlCreateLabel("FT 11 - PLUG UUT MESSAGE", 196, $toptext, 130, 15)
		 $ft11background = GUICtrlCreatePic($gray, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft11 = 2 Then
		 $ft11status = GUICtrlCreateLabel("FT 11 - LATCH TEST", 196, $toptext, 130, 15)
		 $ft11background = GUICtrlCreatePic($gray, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft11 = 3 Then
		 $ft11status = GUICtrlCreateLabel("FT 11 - LEDS TEST", 196, $toptext, 130, 15)
		 $ft11background = GUICtrlCreatePic($gray, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft11 = 4 Then
		 $ft11status = GUICtrlCreateLabel("FT 11 - MODULES TEST", 196, $toptext, 130, 15)
		 $ft11background = GUICtrlCreatePic($gray, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft11 = 5 Then
		 $ft11status = GUICtrlCreateLabel("FT 11 - DEBUG", 196, $toptext, 130, 15)
		 $ft11background = GUICtrlCreatePic($red, 172, $topBG, 170, 21)
		 If $showmessage = 1 <> $notifyTimeout = 0 Then
			MsgBox($MB_ICONERROR + $MB_TOPMOST, "GINA", "FT 11 a picat !", $MB_TOPMOST)
		 EndIf
		 Sleep($wait)
	  ElseIf $ft11 = 6 Then
		 $ft11status = GUICtrlCreateLabel("FT 11 - PASS", 196, $toptext, 130, 15)
		 $ft11background = GUICtrlCreatePic($green, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft11 = 7 Then
		 $ft11status = GUICtrlCreateLabel("FT 11 - SCAN UUT", 196, $toptext, 130, 15)
		 $ft11background = GUICtrlCreatePic($gray, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft11 = 8 Then
		 $ft11status = GUICtrlCreateLabel("FT 11 - RUNTIME ERROR", 196, $toptext, 130, 15)
		 $ft11background = GUICtrlCreatePic($yellow, 172, $topBG, 170, 21)
		 If $showmessage = 1 <> $notifyTimeout = 0 Then
			MsgBox($MB_ICONERROR + $MB_TOPMOST, "GINA", "FT 11 apare retry!!", $MB_TOPMOST)
		 EndIf
		 Sleep($wait)
	  ElseIf $ft11 = 9 Then
		 $ft11status = GUICtrlCreateLabel("FT 11 - NEED LOGIN", 196, $toptext, 130, 15)
		 $ft11background = GUICtrlCreatePic($gray, 172, $topBG, 170, 21)
		 Sleep($wait)
	  EndIf
	  ;increment our notifications timeout to prevent same notification appear
	  $notifyTimeout += 1
;FT 12
Local $currentStatus = GUICtrlCreateLabel("getting status for FT 12...", 180, 2, 150, 15)
   Local $ft12 = FileReadLine($readstatus, 63)
   Local $toptext = 204
   Local $topBG = 200
   Sleep($waitForscan)
	  If $ft12 = 0 Then
		 $ft12status = GUICtrlCreateLabel("FT 12 - ALL GOOD", 196, $toptext, 130, 15)
		 $ft12background = GUICtrlCreatePic($green, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft12 = 1 Then
		 $ft12status = GUICtrlCreateLabel("FT 12 - PLUG UUT MESSAGE", 196, $toptext, 130, 15)
		 $ft12background = GUICtrlCreatePic($gray, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft12 = 2 Then
		 $ft12status = GUICtrlCreateLabel("FT 12 - LATCH TEST", 196, $toptext, 130, 15)
		 $ft12background = GUICtrlCreatePic($gray, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft12 = 3 Then
		 $ft12status = GUICtrlCreateLabel("FT 12 - LEDS TEST", 196, $toptext, 130, 15)
		 $ft12background = GUICtrlCreatePic($gray, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft12 = 4 Then
		 $ft12status = GUICtrlCreateLabel("FT 12 - MODULES TEST", 196, $toptext, 130, 15)
		 $ft12background = GUICtrlCreatePic($gray, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft12 = 5 Then
		 $ft12status = GUICtrlCreateLabel("FT 12 - DEBUG", 196, $toptext, 130, 15)
		 $ft12background = GUICtrlCreatePic($red, 172, $topBG, 170, 21)
		 If $showmessage = 1 <> $notifyTimeout = 0 Then
			MsgBox($MB_ICONERROR + $MB_TOPMOST, "GINA", "FT 12 a picat !", $MB_TOPMOST)
		 EndIf
		 Sleep($wait)
	  ElseIf $ft12 = 6 Then
		 $ft12status = GUICtrlCreateLabel("FT 12 - PASS", 196, $toptext, 130, 15)
		 $ft12background = GUICtrlCreatePic($green, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft12 = 7 Then
		 $ft12status = GUICtrlCreateLabel("FT 12 - SCAN UUT", 196, $toptext, 130, 15)
		 $ft12background = GUICtrlCreatePic($gray, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft12 = 8 Then
		 $ft12status = GUICtrlCreateLabel("FT 12 - RUNTIME ERROR", 196, $toptext, 130, 15)
		 $ft12background = GUICtrlCreatePic($yellow, 172, $topBG, 170, 21)
		 If $showmessage = 1 <> $notifyTimeout = 0 Then
			MsgBox($MB_ICONERROR + $MB_TOPMOST, "GINA", "FT 12 apare retry!!", $MB_TOPMOST)
		 EndIf
		 Sleep($wait)
	  ElseIf $ft12 = 9 Then
		 $ft12status = GUICtrlCreateLabel("FT 12 - NEED LOGIN", 196, $toptext, 130, 15)
		 $ft12background = GUICtrlCreatePic($gray, 172, $topBG, 170, 21)
		 Sleep($wait)
	  EndIf
	  ;increment our notifications timeout to prevent same notification appear
	  $notifyTimeout += 1
;FT 13
Local $currentStatus = GUICtrlCreateLabel("getting status for FT 13...", 180, 2, 150, 15)
   Local $ft13 = FileReadLine($readstatus, 65)
   Local $toptext = 224
   Local $topBG = 220
   Sleep($waitForscan)
	  If $ft13 = 0 Then
		 $ft13status = GUICtrlCreateLabel("FT 13 - ALL GOOD", 196, $toptext, 130, 15)
		 $ft13background = GUICtrlCreatePic($green, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft13 = 1 Then
		 $ft13status = GUICtrlCreateLabel("FT 13 - PLUG UUT MESSAGE", 196, $toptext, 130, 15)
		 $ft13background = GUICtrlCreatePic($gray, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft13 = 2 Then
		 $ft13status = GUICtrlCreateLabel("FT 13 - LATCH TEST", 196, $toptext, 130, 15)
		 $ft13background = GUICtrlCreatePic($gray, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft13 = 3 Then
		 $ft13status = GUICtrlCreateLabel("FT 13 - LEDS TEST", 196, $toptext, 130, 15)
		 $ft13background = GUICtrlCreatePic($gray, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft13 = 4 Then
		 $ft13status = GUICtrlCreateLabel("FT 13 - MODULES TEST", 196, $toptext, 130, 15)
		 $ft13background = GUICtrlCreatePic($gray, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft13 = 5 Then
		 $ft13status = GUICtrlCreateLabel("FT 13 - DEBUG", 196, $toptext, 130, 15)
		 $ft13background = GUICtrlCreatePic($red, 172, $topBG, 170, 21)
		 If $showmessage = 1 <> $notifyTimeout = 0 Then
			MsgBox($MB_ICONERROR + $MB_TOPMOST, "GINA", "FT 13 a picat !", $MB_TOPMOST)
		 EndIf
		 Sleep($wait)
	  ElseIf $ft13 = 6 Then
		 $ft13status = GUICtrlCreateLabel("FT 13 - PASS", 196, $toptext, 130, 15)
		 $ft13background = GUICtrlCreatePic($green, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft13 = 7 Then
		 $ft13status = GUICtrlCreateLabel("FT 13 - SCAN UUT", 196, $toptext, 130, 15)
		 $ft13background = GUICtrlCreatePic($gray, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft13 = 8 Then
		 $ft13status = GUICtrlCreateLabel("FT 13 - RUNTIME ERROR", 196, $toptext, 130, 15)
		 $ft13background = GUICtrlCreatePic($yellow, 172, $topBG, 170, 21)
		 If $showmessage = 1 <> $notifyTimeout = 0 Then
			MsgBox($MB_ICONERROR + $MB_TOPMOST, "GINA", "FT 13 apare retry!!", $MB_TOPMOST)
		 EndIf
		 Sleep($wait)
	  ElseIf $ft13 = 9 Then
		 $ft13status = GUICtrlCreateLabel("FT 13 - NEED LOGIN", 196, $toptext, 130, 15)
		 $ft13background = GUICtrlCreatePic($gray, 172, $topBG, 170, 21)
		 Sleep($wait)
	  EndIf
	  ;increment our notifications timeout to prevent same notification appear
	  $notifyTimeout += 1
;FT 14
Local $currentStatus = GUICtrlCreateLabel("getting status for FT 14...", 180, 2, 150, 15)
   Local $ft14 = FileReadLine($readstatus, 67)
   Local $toptext = 244
   Local $topBG = 240
   Sleep($waitForscan)
	  If $ft14 = 0 Then
		 $ft14status = GUICtrlCreateLabel("FT 14 - ALL GOOD", 196, $toptext, 130, 15)
		 $ft14background = GUICtrlCreatePic($green, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft14 = 1 Then
		 $ft14status = GUICtrlCreateLabel("FT 14 - PLUG UUT MESSAGE", 196, $toptext, 130, 15)
		 $ft14background = GUICtrlCreatePic($gray, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft14 = 2 Then
		 $ft14status = GUICtrlCreateLabel("FT 14 - LATCH TEST", 196, $toptext, 130, 15)
		 $ft14background = GUICtrlCreatePic($gray, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft14 = 3 Then
		 $ft14status = GUICtrlCreateLabel("FT 14 - LEDS TEST", 196, $toptext, 130, 15)
		 $ft14background = GUICtrlCreatePic($gray, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft14 = 4 Then
		 $ft14status = GUICtrlCreateLabel("FT 14 - MODULES TEST", 196, $toptext, 130, 15)
		 $ft14background = GUICtrlCreatePic($gray, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft14 = 5 Then
		 $ft14status = GUICtrlCreateLabel("FT 14 - DEBUG", 196, $toptext, 130, 15)
		 $ft14background = GUICtrlCreatePic($red, 172, $topBG, 170, 21)
		 If $showmessage = 1 <> $notifyTimeout = 0 Then
			MsgBox($MB_ICONERROR + $MB_TOPMOST, "GINA", "FT 14 a picat !", $MB_TOPMOST)
		 EndIf
		 Sleep($wait)
	  ElseIf $ft14 = 6 Then
		 $ft14status = GUICtrlCreateLabel("FT 14 - PASS", 196, $toptext, 130, 15)
		 $ft14background = GUICtrlCreatePic($green, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft14 = 7 Then
		 $ft14status = GUICtrlCreateLabel("FT 14 - SCAN UUT", 196, $toptext, 130, 15)
		 $ft14background = GUICtrlCreatePic($gray, 172, $topBG, 170, 21)
		 Sleep($wait)
	  ElseIf $ft14 = 8 Then
		 $ft14status = GUICtrlCreateLabel("FT 14 - RUNTIME ERROR", 196, $toptext, 130, 15)
		 $ft14background = GUICtrlCreatePic($yellow, 172, $topBG, 170, 21)
		 If $showmessage = 1 <> $notifyTimeout = 0 Then
			MsgBox($MB_ICONERROR + $MB_TOPMOST, "GINA", "FT 14 apare retry!!", $MB_TOPMOST)
		 EndIf
		 Sleep($wait)
	  ElseIf $ft14 = 9 Then
		 $ft14status = GUICtrlCreateLabel("FT 14 - NEED LOGIN", 196, $toptext, 130, 15)
		 $ft14background = GUICtrlCreatePic($gray, 172, $topBG, 170, 21)
		 Sleep($wait)
	  EndIf
	  ;increment our notifications timeout to prevent same notification appear
	  $notifyTimeout += 1
	  ;go back to start
	  _checkStatus()
EndFunc

Func _exit()
    Exit 0
EndFunc