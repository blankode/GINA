#include <File.au3>

; #INDEX# =======================================================================================================================
; Title .........: Generate index.html for GINA - Graphics Interface Network App
; Language ......: English / Romanian
; Description ...: Generate HTML file with TESTS status
; Author(s) .....: Porosnicu Bogdan - blankode
; ===============================================================================================================================

HotKeySet("{Esc}", "_exit")

Global $statusFile = "vncstatus.txt"
Global $wait = 300
Global $waitForscan = 100

Global $countTimesGenerated = -1

; #GENERATION VARIABLES# ========================================================================================================
;html file name
Global $index = 'index.html'
;start new row
Global $tr = @TAB & @TAB & '<tr>'
;end new row
Global $trr = @TAB & @TAB & '</tr>'
;start row contents with GRAY background
Global $td = @TAB & @TAB & @TAB & '<td>'
;end row contents with GRAY background
Global $tdd = '</td>'
;start row contents with GREEN background
Global $tdgreen = @TAB & @TAB & @TAB & '<td style = "background-color:#7CFF7A;">'
;start row contents with RED background
Global $tdred = @TAB & @TAB & @TAB & '<td style = "background-color:#FF5D5D;">'
;start row contents with YELLOW background
Global $tdyellow = @TAB & @TAB & @TAB & '<td style = "background-color:#FFD77A;">'
; ===============================================================================================================================

_generateIndex()

Func _generateIndex()
   $countTimesGenerated += 1
   Tooltip("Generating new index.html... | * press ESC to exit | TIMES GENERATED = " & $countTimesGenerated, @DesktopWidth / 2 - 130, 0)
;FT 15
	  Local $readLine = 15
      Local $ft15 = FileReadLine($statusFile, $readLine)
	  Local $testName = '<b>FT 15</b>'
	  Local $startRow = 41
	  Local $testRow = 42
	  Local $statusRow = 43
	  Local $endRow = 44
   Sleep($waitForscan)
		 ; 0 = UUT IS RUNNING
	  If $ft15 = 0 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'UUT running normal' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 1 = PLUG UUT
	  ElseIf $ft15 = 1 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Plug UUT' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 2 = LATCH TEST
	  ElseIf $ft15 = 2 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Latch test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 3 = LED TEST
	  ElseIf $ft15 = 3 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'LED test' & $tdd, True)
		 Sleep($wait)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 ; 4 = MODULES TEST
	  ElseIf $ft15 = 4 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Modules test' & $tdd, True)
		 Sleep($wait)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 ; 5 = YELLOW
	  ElseIf $ft15 = 5 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdred & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdred & 'UUT needs intervention!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 6 = IS PASS
	  ElseIf $ft15 = 6 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdgreen & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdgreen & 'UUT is PASS!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 7 = SCAN UUT
	  ElseIf $ft15 = 7 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Please scan UUT!' &$tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 8 = RUNTIME
	  ElseIf $ft15 = 8 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdyellow & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdyellow & 'Runtime error!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 9 = LOGIN
	  ElseIf $ft15 = 9 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Login box showed up!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
	  EndIf
; =========================================================================
;THOSE LINES ARE VERY IMPORTANT ! WITHOUT IT THE GENERATOR LOOPS ON ONE STEP !
;IF YOU ADD A NEW TEST ADD THIS PART OF THE CODE BEFORE IT
;increment variables used for next test
$startRow += 4
$testRow += 4
$statusRow += 4
$endRow += 4
$readLine += 2
; =====================================================
;FT 2 - 16
      Local $ft2_16 = FileReadLine($statusFile, $readLine)
	  Local $testName = '<b>FT 2 16</b>'
   Sleep($waitForscan)
		 ; 0 = UUT IS RUNNING
	  If $ft2_16 = 0 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'UUT running normal' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 1 = PLUG UUT
	  ElseIf $ft2_16 = 1 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Plug UUT' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 2 = LATCH TEST
	  ElseIf $ft2_16 = 2 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Latch test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 3 = LED TEST
	  ElseIf $ft2_16 = 3 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'LED test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 4 = MODULES TEST
	  ElseIf $ft2_16 = 4 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Modules test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 5 = YELLOW
	  ElseIf $ft2_16 = 5 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdred & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdred & 'UUT needs intervention!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 6 = IS PASS
	  ElseIf $ft2_16 = 6 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdgreen & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdgreen & 'UUT is PASS!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 7 = SCAN UUT
	  ElseIf $ft2_16 = 7 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Please scan UUT!' &$tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 8 = RUNTIME
	  ElseIf $ft2_16 = 8 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdyellow & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdyellow & 'Runtime error!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 9 = LOGIN
	  ElseIf $ft2_16 = 9 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Login box showed up!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
	  EndIf
; =========================================================================
;THOSE LINES ARE VERY IMPORTANT ! WITHOUT IT THE GENERATOR LOOPS ON ONE STEP !
;IF YOU ADD A NEW TEST ADD THIS PART OF THE CODE BEFORE IT
;increment variables used for next test
$startRow += 4
$testRow += 4
$statusRow += 4
$endRow += 4
$readLine += 2
; =====================================================
;FT 17
      Local $ft17 = FileReadLine($statusFile, $readLine)
	  Local $testName = '<b>FT 17</b>'
   Sleep($waitForscan)
		 ; 0 = UUT IS RUNNING
	  If $ft17 = 0 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'UUT running normal' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 1 = PLUG UUT
	  ElseIf $ft17 = 1 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Plug UUT' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 2 = LATCH TEST
	  ElseIf $ft17 = 2 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Latch test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 3 = LED TEST
	  ElseIf $ft17 = 3 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'LED test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 4 = MODULES TEST
	  ElseIf $ft17 = 4 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Modules test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 5 = YELLOW
	  ElseIf $ft17 = 5 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdred & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdred & 'UUT needs intervention!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 6 = IS PASS
	  ElseIf $ft17 = 6 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdgreen & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdgreen & 'UUT is PASS!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 7 = SCAN UUT
	  ElseIf $ft17 = 7 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Please scan UUT!' &$tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 8 = RUNTIME
	  ElseIf $ft17 = 8 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdyellow & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdyellow & 'Runtime error!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 9 = LOGIN
	  ElseIf $ft17 = 9 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Login box showed up!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
	  EndIf
; =========================================================================
;THOSE LINES ARE VERY IMPORTANT ! WITHOUT IT THE GENERATOR LOOPS ON ONE STEP !
;IF YOU ADD A NEW TEST ADD THIS PART OF THE CODE BEFORE IT
;increment variables used for next test
$startRow += 4
$testRow += 4
$statusRow += 4
$endRow += 4
$readLine += 2
; =====================================================
;FT 18
      Local $ft18 = FileReadLine($statusFile, $readLine)
	  Local $testName = '<b>FT 18</b>'
   Sleep($waitForscan)
		 ; 0 = UUT IS RUNNING
	  If $ft18 = 0 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'UUT running normal' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 1 = PLUG UUT
	  ElseIf $ft18 = 1 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Plug UUT' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 2 = LATCH TEST
	  ElseIf $ft18 = 2 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Latch test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 3 = LED TEST
	  ElseIf $ft18 = 3 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'LED test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 4 = MODULES TEST
	  ElseIf $ft18 = 4 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Modules test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 5 = YELLOW
	  ElseIf $ft18 = 5 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdred & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdred & 'UUT needs intervention!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 6 = IS PASS
	  ElseIf $ft18 = 6 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdgreen & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdgreen & 'UUT is PASS!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 7 = SCAN UUT
	  ElseIf $ft18 = 7 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Please scan UUT!' &$tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 8 = RUNTIME
	  ElseIf $ft18 = 8 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdyellow & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdyellow & 'Runtime error!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 9 = LOGIN
	  ElseIf $ft18 = 9 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Login box showed up!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
	  EndIf
; =========================================================================
;THOSE LINES ARE VERY IMPORTANT ! WITHOUT IT THE GENERATOR LOOPS ON ONE STEP !
;IF YOU ADD A NEW TEST ADD THIS PART OF THE CODE BEFORE IT
;increment variables used for next test
$startRow += 4
$testRow += 4
$statusRow += 4
$endRow += 4
$readLine += 2
; =====================================================
;FT 19
      Local $ft19 = FileReadLine($statusFile, $readLine)
	  Local $testName = '<b>FT 19</b>'
   Sleep($waitForscan)
		 ; 0 = UUT IS RUNNING
	  If $ft19 = 0 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'UUT running normal' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 1 = PLUG UUT
	  ElseIf $ft19 = 1 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Plug UUT' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 2 = LATCH TEST
	  ElseIf $ft19 = 2 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Latch test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 3 = LED TEST
	  ElseIf $ft19 = 3 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'LED test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 4 = MODULES TEST
	  ElseIf $ft19 = 4 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Modules test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 5 = YELLOW
	  ElseIf $ft19 = 5 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdred & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdred & 'UUT needs intervention!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 6 = IS PASS
	  ElseIf $ft19 = 6 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdgreen & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdgreen & 'UUT is PASS!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 7 = SCAN UUT
	  ElseIf $ft19 = 7 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Please scan UUT!' &$tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 8 = RUNTIME
	  ElseIf $ft19 = 8 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdyellow & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdyellow & 'Runtime error!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 9 = LOGIN
	  ElseIf $ft19 = 9 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Login box showed up!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
	  EndIf
; =========================================================================
;THOSE LINES ARE VERY IMPORTANT ! WITHOUT IT THE GENERATOR LOOPS ON ONE STEP !
;IF YOU ADD A NEW TEST ADD THIS PART OF THE CODE BEFORE IT
;increment variables used for next test
$startRow += 4
$testRow += 4
$statusRow += 4
$endRow += 4
$readLine += 2
; =====================================================
;FT 20
      Local $ft20 = FileReadLine($statusFile, $readLine)
	  Local $testName = '<b>FT 20</b>'
   Sleep($waitForscan)
		 ; 0 = UUT IS RUNNING
	  If $ft20 = 0 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'UUT running normal' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 1 = PLUG UUT
	  ElseIf $ft20 = 1 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Plug UUT' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 2 = LATCH TEST
	  ElseIf $ft20 = 2 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Latch test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 3 = LED TEST
	  ElseIf $ft20 = 3 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'LED test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 4 = MODULES TEST
	  ElseIf $ft20 = 4 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Modules test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 5 = YELLOW
	  ElseIf $ft20 = 5 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdred & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdred & 'UUT needs intervention!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 6 = IS PASS
	  ElseIf $ft20 = 6 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdgreen & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdgreen & 'UUT is PASS!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 7 = SCAN UUT
	  ElseIf $ft20 = 7 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Please scan UUT!' &$tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 8 = RUNTIME
	  ElseIf $ft20 = 8 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdyellow & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdyellow & 'Runtime error!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 9 = LOGIN
	  ElseIf $ft20 = 9 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Login box showed up!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
	  EndIf
; =========================================================================
;THOSE LINES ARE VERY IMPORTANT ! WITHOUT IT THE GENERATOR LOOPS ON ONE STEP !
;IF YOU ADD A NEW TEST ADD THIS PART OF THE CODE BEFORE IT
;increment variables used for next test
$startRow += 4
$testRow += 4
$statusRow += 4
$endRow += 4
$readLine += 2
; =====================================================
;FT 21
      Local $ft21 = FileReadLine($statusFile, $readLine)
	  Local $testName = '<b>FT 21</b>'
   Sleep($waitForscan)
		 ; 0 = UUT IS RUNNING
	  If $ft21 = 0 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'UUT running normal' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 1 = PLUG UUT
	  ElseIf $ft21 = 1 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Plug UUT' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 2 = LATCH TEST
	  ElseIf $ft21 = 2 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Latch test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 3 = LED TEST
	  ElseIf $ft21 = 3 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'LED test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 4 = MODULES TEST
	  ElseIf $ft21 = 4 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Modules test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 5 = YELLOW
	  ElseIf $ft21 = 5 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdred & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdred & 'UUT needs intervention!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 6 = IS PASS
	  ElseIf $ft21 = 6 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdgreen & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdgreen & 'UUT is PASS!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 7 = SCAN UUT
	  ElseIf $ft21 = 7 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Please scan UUT!' &$tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 8 = RUNTIME
	  ElseIf $ft21 = 8 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdyellow & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdyellow & 'Runtime error!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 9 = LOGIN
	  ElseIf $ft21 = 9 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Login box showed up!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
	  EndIf
; =========================================================================
;THOSE LINES ARE VERY IMPORTANT ! WITHOUT IT THE GENERATOR LOOPS ON ONE STEP !
;IF YOU ADD A NEW TEST ADD THIS PART OF THE CODE BEFORE IT
;increment variables used for next test
$startRow += 4
$testRow += 4
$statusRow += 4
$endRow += 4
$readLine += 2
; =====================================================
;FT 22 (207)
      Local $ft22_207 = FileReadLine($statusFile, $readLine)
	  Local $testName = '<b>FT 22 (207)</b>'
   Sleep($waitForscan)
		 ; 0 = UUT IS RUNNING
	  If $ft22_207 = 0 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'UUT running normal' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 1 = PLUG UUT
	  ElseIf $ft22_207 = 1 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Plug UUT' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 2 = LATCH TEST
	  ElseIf $ft22_207 = 2 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Latch test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 3 = LED TEST
	  ElseIf $ft22_207 = 3 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'LED test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 4 = MODULES TEST
	  ElseIf $ft22_207 = 4 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Modules test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 5 = YELLOW
	  ElseIf $ft22_207 = 5 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdred & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdred & 'UUT needs intervention!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 6 = IS PASS
	  ElseIf $ft22_207 = 6 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdgreen & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdgreen & 'UUT is PASS!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 7 = SCAN UUT
	  ElseIf $ft22_207 = 7 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Please scan UUT!' &$tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 8 = RUNTIME
	  ElseIf $ft22_207 = 8 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdyellow & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdyellow & 'Runtime error!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 9 = LOGIN
	  ElseIf $ft22_207 = 9 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Login box showed up!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
	  EndIf
; =========================================================================
;THOSE LINES ARE VERY IMPORTANT ! WITHOUT IT THE GENERATOR LOOPS ON ONE STEP !
;IF YOU ADD A NEW TEST ADD THIS PART OF THE CODE BEFORE IT
;increment variables used for next test
$startRow += 4
$testRow += 4
$statusRow += 4
$endRow += 4
$readLine += 2
; =====================================================
;FT 22 (985)
      Local $ft22_985 = FileReadLine($statusFile, $readLine)
	  Local $testName = '<b>FT 22 (985)</b>'
   Sleep($waitForscan)
		 ; 0 = UUT IS RUNNING
	  If $ft22_985 = 0 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'UUT running normal' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 1 = PLUG UUT
	  ElseIf $ft22_985 = 1 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Plug UUT' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 2 = LATCH TEST
	  ElseIf $ft22_985 = 2 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Latch test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 3 = LED TEST
	  ElseIf $ft22_985 = 3 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'LED test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 4 = MODULES TEST
	  ElseIf $ft22_985 = 4 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Modules test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 5 = YELLOW
	  ElseIf $ft22_985 = 5 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdred & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdred & 'UUT needs intervention!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 6 = IS PASS
	  ElseIf $ft22_985 = 6 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdgreen & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdgreen & 'UUT is PASS!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 7 = SCAN UUT
	  ElseIf $ft22_985 = 7 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Please scan UUT!' &$tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 8 = RUNTIME
	  ElseIf $ft22_985 = 8 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdyellow & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdyellow & 'Runtime error!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 9 = LOGIN
	  ElseIf $ft22_985 = 9 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Login box showed up!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
	  EndIf
; =========================================================================
;THOSE LINES ARE VERY IMPORTANT ! WITHOUT IT THE GENERATOR LOOPS ON ONE STEP !
;IF YOU ADD A NEW TEST ADD THIS PART OF THE CODE BEFORE IT
;increment variables used for next test
$startRow += 4
$testRow += 4
$statusRow += 4
$endRow += 4
$readLine += 2
; =====================================================
;FT 36
      Local $ft36 = FileReadLine($statusFile, $readLine)
	  Local $testName = '<b>FT 36</b>'
   Sleep($waitForscan)
		 ; 0 = UUT IS RUNNING
	  If $ft36 = 0 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'UUT running normal' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 1 = PLUG UUT
	  ElseIf $ft36 = 1 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Plug UUT' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 2 = LATCH TEST
	  ElseIf $ft36 = 2 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Latch test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 3 = LED TEST
	  ElseIf $ft36 = 3 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'LED test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 4 = MODULES TEST
	  ElseIf $ft36 = 4 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Modules test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 5 = YELLOW
	  ElseIf $ft36 = 5 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdred & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdred & 'UUT needs intervention!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 6 = IS PASS
	  ElseIf $ft36 = 6 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdgreen & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdgreen & 'UUT is PASS!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 7 = SCAN UUT
	  ElseIf $ft36 = 7 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Please scan UUT!' &$tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 8 = RUNTIME
	  ElseIf $ft36 = 8 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdyellow & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdyellow & 'Runtime error!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 9 = LOGIN
	  ElseIf $ft36 = 9 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Login box showed up!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
	  EndIf
; =========================================================================
;THOSE LINES ARE VERY IMPORTANT ! WITHOUT IT THE GENERATOR LOOPS ON ONE STEP !
;IF YOU ADD A NEW TEST ADD THIS PART OF THE CODE BEFORE IT
;increment variables used for next test
$startRow += 4
$testRow += 4
$statusRow += 4
$endRow += 4
$readLine += 2
; =====================================================
;FT 37
      Local $ft37 = FileReadLine($statusFile, $readLine)
	  Local $testName = '<b>FT 37</b>'
   Sleep($waitForscan)
		 ; 0 = UUT IS RUNNING
	  If $ft37 = 0 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'UUT running normal' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 1 = PLUG UUT
	  ElseIf $ft37 = 1 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Plug UUT' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 2 = LATCH TEST
	  ElseIf $ft37 = 2 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Latch test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 3 = LED TEST
	  ElseIf $ft37 = 3 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'LED test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 4 = MODULES TEST
	  ElseIf $ft37 = 4 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Modules test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 5 = YELLOW
	  ElseIf $ft37 = 5 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdred & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdred & 'UUT needs intervention!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 6 = IS PASS
	  ElseIf $ft37 = 6 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdgreen & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdgreen & 'UUT is PASS!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 7 = SCAN UUT
	  ElseIf $ft37 = 7 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Please scan UUT!' &$tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 8 = RUNTIME
	  ElseIf $ft37 = 8 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdyellow & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdyellow & 'Runtime error!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 9 = LOGIN
	  ElseIf $ft37 = 9 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Login box showed up!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
	  EndIf
; =========================================================================
;THOSE LINES ARE VERY IMPORTANT ! WITHOUT IT THE GENERATOR LOOPS ON ONE STEP !
;IF YOU ADD A NEW TEST ADD THIS PART OF THE CODE BEFORE IT
;increment variables used for next test
$startRow += 4
$testRow += 4
$statusRow += 4
$endRow += 4
$readLine += 2
; =====================================================
;FT 41
      Local $ft41 = FileReadLine($statusFile, $readLine)
	  Local $testName = '<b>FT 41</b>'
   Sleep($waitForscan)
		 ; 0 = UUT IS RUNNING
	  If $ft41 = 0 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'UUT running normal' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 1 = PLUG UUT
	  ElseIf $ft41 = 1 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Plug UUT' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 2 = LATCH TEST
	  ElseIf $ft41 = 2 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Latch test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 3 = LED TEST
	  ElseIf $ft41 = 3 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'LED test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 4 = MODULES TEST
	  ElseIf $ft41 = 4 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Modules test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 5 = YELLOW
	  ElseIf $ft41 = 5 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdred & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdred & 'UUT needs intervention!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 6 = IS PASS
	  ElseIf $ft41 = 6 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdgreen & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdgreen & 'UUT is PASS!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 7 = SCAN UUT
	  ElseIf $ft41 = 7 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Please scan UUT!' &$tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 8 = RUNTIME
	  ElseIf $ft41 = 8 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdyellow & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdyellow & 'Runtime error!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 9 = LOGIN
	  ElseIf $ft41 = 9 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Login box showed up!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
	  EndIf
; =========================================================================
;THOSE LINES ARE VERY IMPORTANT ! WITHOUT IT THE GENERATOR LOOPS ON ONE STEP !
;IF YOU ADD A NEW TEST ADD THIS PART OF THE CODE BEFORE IT
;increment variables used for next test
$startRow += 4
$testRow += 4
$statusRow += 4
$endRow += 4
$readLine += 2
; =====================================================
;FT 44
      Local $ft44 = FileReadLine($statusFile, $readLine)
	  Local $testName = '<b>FT 44</b>'
   Sleep($waitForscan)
		 ; 0 = UUT IS RUNNING
	  If $ft44 = 0 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'UUT running normal' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 1 = PLUG UUT
	  ElseIf $ft44 = 1 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Plug UUT' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 2 = LATCH TEST
	  ElseIf $ft44 = 2 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Latch test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 3 = LED TEST
	  ElseIf $ft44 = 3 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'LED test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 4 = MODULES TEST
	  ElseIf $ft44 = 4 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Modules test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 5 = YELLOW
	  ElseIf $ft44 = 5 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdred & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdred & 'UUT needs intervention!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 6 = IS PASS
	  ElseIf $ft44 = 6 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdgreen & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdgreen & 'UUT is PASS!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 7 = SCAN UUT
	  ElseIf $ft44 = 7 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Please scan UUT!' &$tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 8 = RUNTIME
	  ElseIf $ft44 = 8 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdyellow & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdyellow & 'Runtime error!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 9 = LOGIN
	  ElseIf $ft44 = 9 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Login box showed up!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
	  EndIf
; =========================================================================
;THOSE LINES ARE VERY IMPORTANT ! WITHOUT IT THE GENERATOR LOOPS ON ONE STEP !
;IF YOU ADD A NEW TEST ADD THIS PART OF THE CODE BEFORE IT
;increment variables used for next test
$startRow += 4
$testRow += 4
$statusRow += 4
$endRow += 4
$readLine += 2
; =====================================================
;FT 49
      Local $ft49 = FileReadLine($statusFile, $readLine)
	  Local $testName = '<b>FT 49</b>'
   Sleep($waitForscan)
		 ; 0 = UUT IS RUNNING
	  If $ft49 = 0 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'UUT running normal' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 1 = PLUG UUT
	  ElseIf $ft49 = 1 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Plug UUT' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 2 = LATCH TEST
	  ElseIf $ft49 = 2 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Latch test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 3 = LED TEST
	  ElseIf $ft49 = 3 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'LED test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 4 = MODULES TEST
	  ElseIf $ft49 = 4 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Modules test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 5 = YELLOW
	  ElseIf $ft49 = 5 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdred & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdred & 'UUT needs intervention!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 6 = IS PASS
	  ElseIf $ft49 = 6 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdgreen & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdgreen & 'UUT is PASS!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 7 = SCAN UUT
	  ElseIf $ft49 = 7 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Please scan UUT!' &$tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 8 = RUNTIME
	  ElseIf $ft49 = 8 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdyellow & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdyellow & 'Runtime error!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 9 = LOGIN
	  ElseIf $ft49 = 9 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Login box showed up!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
	  EndIf
; =========================================================================
;THOSE LINES ARE VERY IMPORTANT ! WITHOUT IT THE GENERATOR LOOPS ON ONE STEP !
;IF YOU ADD A NEW TEST ADD THIS PART OF THE CODE BEFORE IT
;increment variables used for next test
$startRow += 4
$testRow += 4
$statusRow += 4
$endRow += 4
$readLine += 2
; =====================================================
;FT 25
      Local $ft25 = FileReadLine($statusFile, $readLine)
	  Local $testName = '<b>FT 25</b>'
   Sleep($waitForscan)
		 ; 0 = UUT IS RUNNING
	  If $ft25 = 0 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'UUT running normal' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 1 = PLUG UUT
	  ElseIf $ft25 = 1 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Plug UUT' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 2 = LATCH TEST
	  ElseIf $ft25 = 2 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Latch test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 3 = LED TEST
	  ElseIf $ft25 = 3 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'LED test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 4 = MODULES TEST
	  ElseIf $ft25 = 4 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Modules test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 5 = YELLOW
	  ElseIf $ft25 = 5 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdred & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdred & 'UUT needs intervention!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 6 = IS PASS
	  ElseIf $ft25 = 6 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdgreen & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdgreen & 'UUT is PASS!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 7 = SCAN UUT
	  ElseIf $ft25 = 7 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Please scan UUT!' &$tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 8 = RUNTIME
	  ElseIf $ft25 = 8 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdyellow & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdyellow & 'Runtime error!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 9 = LOGIN
	  ElseIf $ft25 = 9 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Login box showed up!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
	  EndIf
; =========================================================================
;THOSE LINES ARE VERY IMPORTANT ! WITHOUT IT THE GENERATOR LOOPS ON ONE STEP !
;IF YOU ADD A NEW TEST ADD THIS PART OF THE CODE BEFORE IT
;increment variables used for next test
$startRow += 4
$testRow += 4
$statusRow += 4
$endRow += 4
$readLine += 2
; =====================================================
;FT 50
      Local $ft50 = FileReadLine($statusFile, $readLine)
	  Local $testName = '<b>FT 50</b>'
   Sleep($waitForscan)
		 ; 0 = UUT IS RUNNING
	  If $ft50 = 0 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'UUT running normal' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 1 = PLUG UUT
	  ElseIf $ft50 = 1 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Plug UUT' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 2 = LATCH TEST
	  ElseIf $ft50 = 2 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Latch test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 3 = LED TEST
	  ElseIf $ft50 = 3 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'LED test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 4 = MODULES TEST
	  ElseIf $ft50 = 4 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Modules test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 5 = YELLOW
	  ElseIf $ft50 = 5 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdred & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdred & 'UUT needs intervention!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 6 = IS PASS
	  ElseIf $ft50 = 6 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdgreen & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdgreen & 'UUT is PASS!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 7 = SCAN UUT
	  ElseIf $ft50 = 7 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Please scan UUT!' &$tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 8 = RUNTIME
	  ElseIf $ft50 = 8 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdyellow & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdyellow & 'Runtime error!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 9 = LOGIN
	  ElseIf $ft50 = 9 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Login box showed up!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
	  EndIf
; =========================================================================
;THOSE LINES ARE VERY IMPORTANT ! WITHOUT IT THE GENERATOR LOOPS ON ONE STEP !
;IF YOU ADD A NEW TEST ADD THIS PART OF THE CODE BEFORE IT
;increment variables used for next test
$startRow += 4
$testRow += 4
$statusRow += 4
$endRow += 4
$readLine += 2
; =====================================================
;FT 51
      Local $ft51 = FileReadLine($statusFile, $readLine)
	  Local $testName = '<b>FT 51</b>'
   Sleep($waitForscan)
		 ; 0 = UUT IS RUNNING
	  If $ft51 = 0 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'UUT running normal' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 1 = PLUG UUT
	  ElseIf $ft51 = 1 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Plug UUT' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 2 = LATCH TEST
	  ElseIf $ft51 = 2 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Latch test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 3 = LED TEST
	  ElseIf $ft51 = 3 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'LED test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 4 = MODULES TEST
	  ElseIf $ft51 = 4 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Modules test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 5 = YELLOW
	  ElseIf $ft51 = 5 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdred & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdred & 'UUT needs intervention!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 6 = IS PASS
	  ElseIf $ft51 = 6 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdgreen & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdgreen & 'UUT is PASS!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 7 = SCAN UUT
	  ElseIf $ft51 = 7 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Please scan UUT!' &$tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 8 = RUNTIME
	  ElseIf $ft51 = 8 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdyellow & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdyellow & 'Runtime error!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 9 = LOGIN
	  ElseIf $ft51 = 9 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Login box showed up!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
	  EndIf
; =========================================================================
;THOSE LINES ARE VERY IMPORTANT ! WITHOUT IT THE GENERATOR LOOPS ON ONE STEP !
;IF YOU ADD A NEW TEST ADD THIS PART OF THE CODE BEFORE IT
;increment variables used for next test
$startRow += 4
$testRow += 4
$statusRow += 4
$endRow += 4
$readLine += 2
; =====================================================
;FT 48
      Local $ft48 = FileReadLine($statusFile, $readLine)
	  Local $testName = '<b>FT 48</b>'
   Sleep($waitForscan)
		 ; 0 = UUT IS RUNNING
	  If $ft48 = 0 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'UUT running normal' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 1 = PLUG UUT
	  ElseIf $ft48 = 1 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Plug UUT' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 2 = LATCH TEST
	  ElseIf $ft48 = 2 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Latch test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 3 = LED TEST
	  ElseIf $ft48 = 3 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'LED test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 4 = MODULES TEST
	  ElseIf $ft48 = 4 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Modules test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 5 = YELLOW
	  ElseIf $ft48 = 5 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdred & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdred & 'UUT needs intervention!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 6 = IS PASS
	  ElseIf $ft48 = 6 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdgreen & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdgreen & 'UUT is PASS!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 7 = SCAN UUT
	  ElseIf $ft48 = 7 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Please scan UUT!' &$tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 8 = RUNTIME
	  ElseIf $ft48 = 8 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdyellow & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdyellow & 'Runtime error!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 9 = LOGIN
	  ElseIf $ft48 = 9 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Login box showed up!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
	  EndIf
; =========================================================================
;THOSE LINES ARE VERY IMPORTANT ! WITHOUT IT THE GENERATOR LOOPS ON ONE STEP !
;IF YOU ADD A NEW TEST ADD THIS PART OF THE CODE BEFORE IT
;increment variables used for next test
$startRow += 4
$testRow += 4
$statusRow += 4
$endRow += 4
$readLine += 2
; =====================================================
;FT 47
      Local $ft47 = FileReadLine($statusFile, $readLine)
	  Local $testName = '<b>FT 47</b>'
   Sleep($waitForscan)
		 ; 0 = UUT IS RUNNING
	  If $ft47 = 0 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'UUT running normal' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 1 = PLUG UUT
	  ElseIf $ft47 = 1 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Plug UUT' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 2 = LATCH TEST
	  ElseIf $ft47 = 2 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Latch test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 3 = LED TEST
	  ElseIf $ft47 = 3 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'LED test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 4 = MODULES TEST
	  ElseIf $ft47 = 4 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Modules test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 5 = YELLOW
	  ElseIf $ft47 = 5 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdred & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdred & 'UUT needs intervention!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 6 = IS PASS
	  ElseIf $ft47 = 6 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdgreen & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdgreen & 'UUT is PASS!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 7 = SCAN UUT
	  ElseIf $ft47 = 7 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Please scan UUT!' &$tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 8 = RUNTIME
	  ElseIf $ft47 = 8 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdyellow & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdyellow & 'Runtime error!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 9 = LOGIN
	  ElseIf $ft47 = 9 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Login box showed up!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
	  EndIf
; =========================================================================
;THOSE LINES ARE VERY IMPORTANT ! WITHOUT IT THE GENERATOR LOOPS ON ONE STEP !
;IF YOU ADD A NEW TEST ADD THIS PART OF THE CODE BEFORE IT
;increment variables used for next test
$startRow += 4
$testRow += 4
$statusRow += 4
$endRow += 4
$readLine += 2
; =====================================================
;FT 46
      Local $ft46 = FileReadLine($statusFile, $readLine)
	  Local $testName = '<b>FT 46</b>'
   Sleep($waitForscan)
		 ; 0 = UUT IS RUNNING
	  If $ft46 = 0 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'UUT running normal' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 1 = PLUG UUT
	  ElseIf $ft46 = 1 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Plug UUT' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 2 = LATCH TEST
	  ElseIf $ft46 = 2 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Latch test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 3 = LED TEST
	  ElseIf $ft46 = 3 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'LED test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 4 = MODULES TEST
	  ElseIf $ft46 = 4 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Modules test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 5 = YELLOW
	  ElseIf $ft46 = 5 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdred & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdred & 'UUT needs intervention!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 6 = IS PASS
	  ElseIf $ft46 = 6 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdgreen & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdgreen & 'UUT is PASS!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 7 = SCAN UUT
	  ElseIf $ft46 = 7 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Please scan UUT!' &$tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 8 = RUNTIME
	  ElseIf $ft46 = 8 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdyellow & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdyellow & 'Runtime error!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 9 = LOGIN
	  ElseIf $ft46 = 9 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Login box showed up!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
	  EndIf
; =========================================================================
;THOSE LINES ARE VERY IMPORTANT ! WITHOUT IT THE GENERATOR LOOPS ON ONE STEP !
;IF YOU ADD A NEW TEST ADD THIS PART OF THE CODE BEFORE IT
;increment variables used for next test
$startRow += 4
$testRow += 4
$statusRow += 4
$endRow += 4
$readLine += 2
; =====================================================
;FT 45
      Local $ft45 = FileReadLine($statusFile, $readLine)
	  Local $testName = '<b>FT 45</b>'
   Sleep($waitForscan)
		 ; 0 = UUT IS RUNNING
	  If $ft45 = 0 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'UUT running normal' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 1 = PLUG UUT
	  ElseIf $ft45 = 1 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Plug UUT' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 2 = LATCH TEST
	  ElseIf $ft45 = 2 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Latch test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 3 = LED TEST
	  ElseIf $ft45 = 3 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'LED test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 4 = MODULES TEST
	  ElseIf $ft45 = 4 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Modules test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 5 = YELLOW
	  ElseIf $ft45 = 5 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdred & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdred & 'UUT needs intervention!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 6 = IS PASS
	  ElseIf $ft45 = 6 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdgreen & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdgreen & 'UUT is PASS!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 7 = SCAN UUT
	  ElseIf $ft45 = 7 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Please scan UUT!' &$tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 8 = RUNTIME
	  ElseIf $ft45 = 8 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdyellow & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdyellow & 'Runtime error!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 9 = LOGIN
	  ElseIf $ft45 = 9 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Login box showed up!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
	  EndIf
; =========================================================================
;THOSE LINES ARE VERY IMPORTANT ! WITHOUT IT THE GENERATOR LOOPS ON ONE STEP !
;IF YOU ADD A NEW TEST ADD THIS PART OF THE CODE BEFORE IT
;increment variables used for next test
$startRow += 4
$testRow += 4
$statusRow += 4
$endRow += 4
$readLine += 2
; =====================================================
;FT 1 - 16
      Local $ft1_16 = FileReadLine($statusFile, $readLine)
	  Local $testName = '<b>FT 1 16</b>'
   Sleep($waitForscan)
		 ; 0 = UUT IS RUNNING
	  If $ft1_16 = 0 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'UUT running normal' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 1 = PLUG UUT
	  ElseIf $ft1_16 = 1 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Plug UUT' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 2 = LATCH TEST
	  ElseIf $ft1_16 = 2 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Latch test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 3 = LED TEST
	  ElseIf $ft1_16 = 3 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'LED test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 4 = MODULES TEST
	  ElseIf $ft1_16 = 4 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Modules test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 5 = YELLOW
	  ElseIf $ft1_16 = 5 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdred & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdred & 'UUT needs intervention!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 6 = IS PASS
	  ElseIf $ft1_16 = 6 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdgreen & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdgreen & 'UUT is PASS!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 7 = SCAN UUT
	  ElseIf $ft1_16 = 7 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Please scan UUT!' &$tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 8 = RUNTIME
	  ElseIf $ft1_16 = 8 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdyellow & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdyellow & 'Runtime error!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 9 = LOGIN
	  ElseIf $ft1_16 = 9 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Login box showed up!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
	  EndIf
; =========================================================================
;THOSE LINES ARE VERY IMPORTANT ! WITHOUT IT THE GENERATOR LOOPS ON ONE STEP !
;IF YOU ADD A NEW TEST ADD THIS PART OF THE CODE BEFORE IT
;increment variables used for next test
$startRow += 4
$testRow += 4
$statusRow += 4
$endRow += 4
$readLine += 2
; =====================================================
;FT 10
      Local $ft10 = FileReadLine($statusFile, $readLine)
	  Local $testName = '<b>FT 10</b>'
   Sleep($waitForscan)
		 ; 0 = UUT IS RUNNING
	  If $ft10 = 0 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'UUT running normal' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 1 = PLUG UUT
	  ElseIf $ft10 = 1 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Plug UUT' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 2 = LATCH TEST
	  ElseIf $ft10 = 2 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Latch test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 3 = LED TEST
	  ElseIf $ft10 = 3 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'LED test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 4 = MODULES TEST
	  ElseIf $ft10 = 4 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Modules test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 5 = YELLOW
	  ElseIf $ft10 = 5 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdred & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdred & 'UUT needs intervention!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 6 = IS PASS
	  ElseIf $ft10 = 6 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdgreen & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdgreen & 'UUT is PASS!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 7 = SCAN UUT
	  ElseIf $ft10 = 7 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Please scan UUT!' &$tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 8 = RUNTIME
	  ElseIf $ft10 = 8 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdyellow & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdyellow & 'Runtime error!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 9 = LOGIN
	  ElseIf $ft10 = 9 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Login box showed up!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
	  EndIf
; =========================================================================
;THOSE LINES ARE VERY IMPORTANT ! WITHOUT IT THE GENERATOR LOOPS ON ONE STEP !
;IF YOU ADD A NEW TEST ADD THIS PART OF THE CODE BEFORE IT
;increment variables used for next test
$startRow += 4
$testRow += 4
$statusRow += 4
$endRow += 4
$readLine += 2
; =====================================================
;FT 11
      Local $ft11 = FileReadLine($statusFile, $readLine)
	  Local $testName = '<b>FT 11</b>'
   Sleep($waitForscan)
		 ; 0 = UUT IS RUNNING
	  If $ft11 = 0 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'UUT running normal' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 1 = PLUG UUT
	  ElseIf $ft11 = 1 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Plug UUT' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 2 = LATCH TEST
	  ElseIf $ft11 = 2 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Latch test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 3 = LED TEST
	  ElseIf $ft11 = 3 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'LED test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 4 = MODULES TEST
	  ElseIf $ft11 = 4 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Modules test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 5 = YELLOW
	  ElseIf $ft11 = 5 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdred & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdred & 'UUT needs intervention!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 6 = IS PASS
	  ElseIf $ft11 = 6 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdgreen & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdgreen & 'UUT is PASS!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 7 = SCAN UUT
	  ElseIf $ft11 = 7 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Please scan UUT!' &$tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 8 = RUNTIME
	  ElseIf $ft11 = 8 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdyellow & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdyellow & 'Runtime error!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 9 = LOGIN
	  ElseIf $ft11 = 9 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Login box showed up!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
	  EndIf
; =========================================================================
;THOSE LINES ARE VERY IMPORTANT ! WITHOUT IT THE GENERATOR LOOPS ON ONE STEP !
;IF YOU ADD A NEW TEST ADD THIS PART OF THE CODE BEFORE IT
;increment variables used for next test
$startRow += 4
$testRow += 4
$statusRow += 4
$endRow += 4
$readLine += 2
; =====================================================
;FT 12
      Local $ft12 = FileReadLine($statusFile, $readLine)
	  Local $testName = '<b>FT 12</b>'
   Sleep($waitForscan)
		 ; 0 = UUT IS RUNNING
	  If $ft12 = 0 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'UUT running normal' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 1 = PLUG UUT
	  ElseIf $ft12 = 1 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Plug UUT' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 2 = LATCH TEST
	  ElseIf $ft12 = 2 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Latch test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 3 = LED TEST
	  ElseIf $ft12 = 3 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'LED test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 4 = MODULES TEST
	  ElseIf $ft12 = 4 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Modules test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 5 = YELLOW
	  ElseIf $ft12 = 5 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdred & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdred & 'UUT needs intervention!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 6 = IS PASS
	  ElseIf $ft12 = 6 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdgreen & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdgreen & 'UUT is PASS!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 7 = SCAN UUT
	  ElseIf $ft12 = 7 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Please scan UUT!' &$tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 8 = RUNTIME
	  ElseIf $ft12 = 8 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdyellow & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdyellow & 'Runtime error!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 9 = LOGIN
	  ElseIf $ft12 = 9 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Login box showed up!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
	  EndIf
; =========================================================================
;THOSE LINES ARE VERY IMPORTANT ! WITHOUT IT THE GENERATOR LOOPS ON ONE STEP !
;IF YOU ADD A NEW TEST ADD THIS PART OF THE CODE BEFORE IT
;increment variables used for next test
$startRow += 4
$testRow += 4
$statusRow += 4
$endRow += 4
$readLine += 2
; =====================================================
;FT 13
      Local $ft13 = FileReadLine($statusFile, $readLine)
	  Local $testName = '<b>FT 13</b>'
   Sleep($waitForscan)
		 ; 0 = UUT IS RUNNING
	  If $ft13 = 0 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'UUT running normal' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 1 = PLUG UUT
	  ElseIf $ft13 = 1 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Plug UUT' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 2 = LATCH TEST
	  ElseIf $ft13 = 2 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Latch test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 3 = LED TEST
	  ElseIf $ft13 = 3 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'LED test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 4 = MODULES TEST
	  ElseIf $ft13 = 4 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Modules test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 5 = YELLOW
	  ElseIf $ft13 = 5 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdred & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdred & 'UUT needs intervention!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 6 = IS PASS
	  ElseIf $ft13 = 6 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdgreen & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdgreen & 'UUT is PASS!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 7 = SCAN UUT
	  ElseIf $ft13 = 7 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Please scan UUT!' &$tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 8 = RUNTIME
	  ElseIf $ft13 = 8 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdyellow & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdyellow & 'Runtime error!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 9 = LOGIN
	  ElseIf $ft13 = 9 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Login box showed up!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
	  EndIf
; =========================================================================
;THOSE LINES ARE VERY IMPORTANT ! WITHOUT IT THE GENERATOR LOOPS ON ONE STEP !
;IF YOU ADD A NEW TEST ADD THIS PART OF THE CODE BEFORE IT
;increment variables used for next test
$startRow += 4
$testRow += 4
$statusRow += 4
$endRow += 4
$readLine += 2
; =====================================================
;FT 14
      Local $ft14 = FileReadLine($statusFile, $readLine)
	  Local $testName = '<b>FT 14</b>'
   Sleep($waitForscan)
		 ; 0 = UUT IS RUNNING
	  If $ft14 = 0 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'UUT running normal' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 1 = PLUG UUT
	  ElseIf $ft14 = 1 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Plug UUT' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 2 = LATCH TEST
	  ElseIf $ft14 = 2 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Latch test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 3 = LED TEST
	  ElseIf $ft14 = 3 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'LED test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 4 = MODULES TEST
	  ElseIf $ft14 = 4 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Modules test' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 5 = YELLOW
	  ElseIf $ft14 = 5 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdred & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdred & 'UUT needs intervention!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 6 = IS PASS
	  ElseIf $ft14 = 6 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdgreen & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdgreen & 'UUT is PASS!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 7 = SCAN UUT
	  ElseIf $ft14 = 7 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Please scan UUT!' &$tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 8 = RUNTIME
	  ElseIf $ft14 = 8 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $tdyellow & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $tdyellow & 'Runtime error!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
		 ; 9 = LOGIN
	  ElseIf $ft14 = 9 Then
		 _FileWriteToLine($index, $startRow, $tr, True)
		 _FileWriteToLine($index, $testRow, $td & $testname & $tdd, True)
		 _FileWriteToLine($index, $statusRow, $td & 'Login box showed up!' & $tdd, True)
		 _FileWriteToLine($index, $endRow, $trr, True)
		 Sleep($wait)
	  EndIf
	  ;back to start
	  _generateIndex()
EndFunc

Func _exit()
    Exit 0
EndFunc