@ECHO OFF
REM ==================================================
REM プリンタログオンスクリプト
REM ==================================================

REM ==================================================
REM SET SERVERNAME=
REM サーバ名をイコール(=)の後に入力します。
REM ==================================================

SET SERVERNAME=ICT-SERVER

REM ==================================================
REM SET COMPUTERNAME=%COMPUTERNAME% 変数でコンピュータ名取得
REM SET USERNAME=%USERNAME% 変数でユーザ名取得
REM ==================================================

SET COMPUTERNAME=%COMPUTERNAME%
SET USERNAME=%USERNAME%

REM ==================================================
REM 生徒個別フォルダをドライブV として割り当てます。（先生機のみ）
REM ログオンしたユーザ名の共有フォルダを、ドライブWとして割り当てます。
REM 共有フォルダを、ドライブXとして割り当てます。
REM 教員用フォルダーの共有フォルダを、ドライブY として割り当てます。
REM 提出の共有フォルダを、ドライブZ として割り当てます。
REM ==================================================

NET USE V: \\%SERVERNAME%\生徒$
NET USE W: \\%SERVERNAME%\%USERNAME%$
NET USE X: \\%SERVERNAME%\神奈川県立小田原東高等学校
NET USE Y: \\%SERVERNAME%\教員用フォルダー$
REN NET USE Z: \\%SERVERNAME%\提出

REM ==================================================
REM SET NETPRT=ON / OFF
REM ON にした場合、:PRT にネットワークプリンタを記述して
REM ください。
REM ==================================================

SET NETPRT=ON

IF (%NETPRT%) == (ON) GOTO PRT
GOTO END

REM ==================================================
REM SET PRTNNAME00=<共有プリンタ名>
REM サーバが共有しているネットワークプリンタを入力します。
REM 10台まで登録可能。
REM ==================================================

:PRT
SET PRTNAME01=CPRT101
SET PRTNAME02=PRT101
SET PRTNAME03=PRT102
SET PRTNAME04=CPRT201
SET PRTNAME05=PRT201
SET PRTNAME06=PRT202
SET PRTNAME07=CPRT301
SET PRTNAME08=PRT301
SET PRTNAME09=PRT302
SET PRTNAME10=CPRT401
SET PRTNAME11=CPRT402
SET PRTNAME12=CPRT403
SET PRTNAME13=CPRT404
SET PRTNAME14=PRT401
SET PRTNAME15=PRT402
SET PRTNAME16=CPRT501
SET PRTNAME17=CPRT502
SET PRTNAME18=CPRT503
SET PRTNAME19=CPRT504
SET PRTNAME20=CPRT505
SET PRTNAME21=PRT501
SET PRTNAME22=PRT502
SET PRTNAME23=CPRT601
SET PRTNAME24=PRT601
SET PRTNAME25=PRT602
SET PRTNAME26=CPRT001
SET PRTNAME27=PRT001


REM ==================================================
REM GOTO %COMPUTERNAME%
REM 変数より取得した自コンピュータ名の項目へジャンプします。
REM ==================================================

GOTO %COMPUTERNAME%

REM ==================================================
REM ネットワークプリンタを割り当て。該当する自コンピュータ名の項目で処理を行う。
REM 通常使うプリンターの指定
REM cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME番号%"
REM をプリンター追加の次行に追記。
REM ==================================================

REM =============================================================
REM  第一OA教室
REM =============================================================

:ICT100
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME01%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME01%"
IF (%PRTNAME02%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME02%"
IF (%PRTNAME03%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME03%"
GOTO END

:ICT101
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME01%"
IF (%PRTNAME02%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME02%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME02%"
IF (%PRTNAME03%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME03%"
GOTO END

:ICT102
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME01%"
IF (%PRTNAME02%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME02%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME02%"
IF (%PRTNAME03%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME03%"
GOTO END

:ICT103
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME01%"
IF (%PRTNAME02%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME02%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME02%"
IF (%PRTNAME03%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME03%"
GOTO END

:ICT104
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME01%"
IF (%PRTNAME02%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME02%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME02%"
IF (%PRTNAME03%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME03%"
GOTO END

:ICT105
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME01%"
IF (%PRTNAME02%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME02%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME02%"
IF (%PRTNAME03%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME03%"
GOTO END

:ICT106
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME01%"
IF (%PRTNAME02%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME02%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME02%"
IF (%PRTNAME03%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME03%"
GOTO END

:ICT107
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME01%"
IF (%PRTNAME02%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME02%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME02%"
IF (%PRTNAME03%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME03%"
GOTO END

:ICT108
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME01%"
IF (%PRTNAME02%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME02%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME02%"
IF (%PRTNAME03%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME03%"
GOTO END

:ICT109
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME01%"
IF (%PRTNAME02%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME02%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME02%"
IF (%PRTNAME03%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME03%"
GOTO END

:ICT110
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME01%"
IF (%PRTNAME02%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME02%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME02%"
IF (%PRTNAME03%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME03%"
GOTO END

:ICT111
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME01%"
IF (%PRTNAME02%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME02%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME02%"
IF (%PRTNAME03%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME03%"
GOTO END

:ICT112
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME01%"
IF (%PRTNAME02%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME02%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME02%"
IF (%PRTNAME03%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME03%"
GOTO END

:ICT113
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME01%"
IF (%PRTNAME02%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME02%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME02%"
IF (%PRTNAME03%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME03%"
GOTO END

:ICT114
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME01%"
IF (%PRTNAME02%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME02%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME02%"
IF (%PRTNAME03%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME03%"
GOTO END

:ICT115
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME01%"
IF (%PRTNAME02%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME02%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME02%"
IF (%PRTNAME03%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME03%"
GOTO END

:ICT116
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME01%"
IF (%PRTNAME02%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME02%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME02%"
IF (%PRTNAME03%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME03%"
GOTO END

:ICT117
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME01%"
IF (%PRTNAME02%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME02%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME02%"
IF (%PRTNAME03%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME03%"
GOTO END

:ICT118
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME01%"
IF (%PRTNAME02%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME02%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME02%"
IF (%PRTNAME03%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME03%"
GOTO END

:ICT119
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME01%"
IF (%PRTNAME02%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME02%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME02%"
IF (%PRTNAME03%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME03%"
GOTO END

:ICT120
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME01%"
IF (%PRTNAME02%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME02%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME02%"
IF (%PRTNAME03%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME03%"
GOTO END

:ICT121
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME01%"
IF (%PRTNAME02%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME02%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME02%"
IF (%PRTNAME03%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME03%"
GOTO END

:ICT122
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME01%"
IF (%PRTNAME02%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME02%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME02%"
IF (%PRTNAME03%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME03%"
GOTO END

:ICT123
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME01%"
IF (%PRTNAME02%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME02%"
IF (%PRTNAME03%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME03%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME03%"
GOTO END

:ICT124
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME01%"
IF (%PRTNAME02%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME02%"
IF (%PRTNAME03%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME03%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME03%"
GOTO END

:ICT125
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME01%"
IF (%PRTNAME02%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME02%"
IF (%PRTNAME03%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME03%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME03%"
GOTO END

:ICT126
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME01%"
IF (%PRTNAME02%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME02%"
IF (%PRTNAME03%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME03%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME03%"
GOTO END

:ICT127
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME01%"
IF (%PRTNAME02%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME02%"
IF (%PRTNAME03%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME03%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME03%"
GOTO END

:ICT128
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME01%"
IF (%PRTNAME02%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME02%"
IF (%PRTNAME03%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME03%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME03%"
GOTO END

:ICT129
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME01%"
IF (%PRTNAME02%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME02%"
IF (%PRTNAME03%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME03%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME03%"
GOTO END

:ICT130
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME01%"
IF (%PRTNAME02%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME02%"
IF (%PRTNAME03%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME03%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME03%"
GOTO END

:ICT131
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME01%"
IF (%PRTNAME02%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME02%"
IF (%PRTNAME03%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME03%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME03%"
GOTO END

:ICT132
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME01%"
IF (%PRTNAME02%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME02%"
IF (%PRTNAME03%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME03%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME03%"
GOTO END

:ICT133
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME01%"
IF (%PRTNAME02%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME02%"
IF (%PRTNAME03%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME03%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME03%"
GOTO END

:ICT134
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME01%"
IF (%PRTNAME02%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME02%"
IF (%PRTNAME03%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME03%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME03%"
GOTO END

:ICT135
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME01%"
IF (%PRTNAME02%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME02%"
IF (%PRTNAME03%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME03%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME03%"
GOTO END

:ICT136
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME01%"
IF (%PRTNAME02%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME02%"
IF (%PRTNAME03%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME03%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME03%"
GOTO END

:ICT137
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME01%"
IF (%PRTNAME02%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME02%"
IF (%PRTNAME03%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME03%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME03%"
GOTO END

:ICT138
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME01%"
IF (%PRTNAME02%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME02%"
IF (%PRTNAME03%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME03%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME03%"
GOTO END

:ICT139
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME01%"
IF (%PRTNAME02%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME02%"
IF (%PRTNAME03%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME03%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME03%"
GOTO END

:ICT140
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME01%"
IF (%PRTNAME02%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME02%"
IF (%PRTNAME03%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME03%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME03%"
GOTO END

:ICT141
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME01%"
IF (%PRTNAME02%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME02%"
IF (%PRTNAME03%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME03%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME03%"
GOTO END

:ICT142
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME01%"
IF (%PRTNAME02%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME02%"
IF (%PRTNAME03%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME03%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME03%"
GOTO END

:ICT143
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME01%"
IF (%PRTNAME02%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME02%"
IF (%PRTNAME03%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME03%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME03%"
GOTO END

:ICT144
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME01%"
IF (%PRTNAME02%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME02%"
IF (%PRTNAME03%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME03%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME03%"
GOTO END

REM =============================================================
REM  第二OA教室
REM =============================================================

:ICT200
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME04%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME04%"
IF (%PRTNAME05%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME05%"
IF (%PRTNAME06%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME06%"
GOTO END

:ICT201
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME04%"
IF (%PRTNAME05%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME05%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME05%"
IF (%PRTNAME06%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME06%"
GOTO END

:ICT202
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME04%"
IF (%PRTNAME05%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME05%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME05%"
IF (%PRTNAME06%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME06%"
GOTO END

:ICT203
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME04%"
IF (%PRTNAME05%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME05%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME05%"
IF (%PRTNAME06%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME06%"
GOTO END

:ICT204
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME04%"
IF (%PRTNAME05%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME05%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME05%"
IF (%PRTNAME06%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME06%"
GOTO END

:ICT205
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME04%"
IF (%PRTNAME05%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME05%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME05%"
IF (%PRTNAME06%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME06%"
GOTO END

:ICT206
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME04%"
IF (%PRTNAME05%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME05%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME05%"
IF (%PRTNAME06%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME06%"
GOTO END

:ICT207
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME04%"
IF (%PRTNAME05%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME05%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME05%"
IF (%PRTNAME06%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME06%"
GOTO END

:ICT208
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME04%"
IF (%PRTNAME05%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME05%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME05%"
IF (%PRTNAME06%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME06%"
GOTO END

:ICT209
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME04%"
IF (%PRTNAME05%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME05%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME05%"
IF (%PRTNAME06%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME06%"
GOTO END

:ICT210
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME04%"
IF (%PRTNAME05%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME05%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME05%"
IF (%PRTNAME06%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME06%"
GOTO END

:ICT211
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME04%"
IF (%PRTNAME05%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME05%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME05%"
IF (%PRTNAME06%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME06%"
GOTO END

:ICT212
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME04%"
IF (%PRTNAME05%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME05%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME05%"
IF (%PRTNAME06%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME06%"
GOTO END

:ICT213
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME04%"
IF (%PRTNAME05%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME05%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME05%"
IF (%PRTNAME06%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME06%"
GOTO END

:ICT214
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME04%"
IF (%PRTNAME05%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME05%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME05%"
IF (%PRTNAME06%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME06%"
GOTO END

:ICT215
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME04%"
IF (%PRTNAME05%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME05%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME05%"
IF (%PRTNAME06%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME06%"
GOTO END

:ICT216
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME04%"
IF (%PRTNAME05%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME05%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME05%"
IF (%PRTNAME06%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME06%"
GOTO END

:ICT217
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME04%"
IF (%PRTNAME05%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME05%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME05%"
IF (%PRTNAME06%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME06%"
GOTO END

:ICT218
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME04%"
IF (%PRTNAME05%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME05%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME05%"
IF (%PRTNAME06%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME06%"
GOTO END

:ICT219
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME04%"
IF (%PRTNAME05%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME05%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME05%"
IF (%PRTNAME06%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME06%"
GOTO END

:ICT220
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME04%"
IF (%PRTNAME05%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME05%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME05%"
IF (%PRTNAME06%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME06%"
GOTO END

:ICT221
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME04%"
IF (%PRTNAME05%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME05%"
IF (%PRTNAME06%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME06%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME06%"
GOTO END

:ICT222
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME04%"
IF (%PRTNAME05%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME05%"
IF (%PRTNAME06%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME06%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME06%"
GOTO END

:ICT223
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME04%"
IF (%PRTNAME05%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME05%"
IF (%PRTNAME06%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME06%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME06%"
GOTO END

:ICT224
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME04%"
IF (%PRTNAME05%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME05%"
IF (%PRTNAME06%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME06%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME06%"
GOTO END

:ICT225
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME04%"
IF (%PRTNAME05%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME05%"
IF (%PRTNAME06%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME06%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME06%"
GOTO END

:ICT226
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME04%"
IF (%PRTNAME05%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME05%"
IF (%PRTNAME06%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME06%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME06%"
GOTO END

:ICT227
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME04%"
IF (%PRTNAME05%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME05%"
IF (%PRTNAME06%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME06%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME06%"
GOTO END

:ICT228
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME04%"
IF (%PRTNAME05%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME05%"
IF (%PRTNAME06%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME06%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME06%"
GOTO END

:ICT229
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME04%"
IF (%PRTNAME05%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME05%"
IF (%PRTNAME06%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME06%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME06%"
GOTO END

:ICT230
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME04%"
IF (%PRTNAME05%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME05%"
IF (%PRTNAME06%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME06%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME06%"
GOTO END

:ICT231
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME04%"
IF (%PRTNAME05%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME05%"
IF (%PRTNAME06%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME06%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME06%"
GOTO END

:ICT232
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME04%"
IF (%PRTNAME05%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME05%"
IF (%PRTNAME06%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME06%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME06%"
GOTO END

:ICT233
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME04%"
IF (%PRTNAME05%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME05%"
IF (%PRTNAME06%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME06%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME06%"
GOTO END

:ICT234
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME04%"
IF (%PRTNAME05%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME05%"
IF (%PRTNAME06%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME06%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME06%"
GOTO END

:ICT235
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME04%"
IF (%PRTNAME05%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME05%"
IF (%PRTNAME06%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME06%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME06%"
GOTO END

:ICT236
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME04%"
IF (%PRTNAME05%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME05%"
IF (%PRTNAME06%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME06%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME06%"
GOTO END

:ICT237
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME04%"
IF (%PRTNAME05%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME05%"
IF (%PRTNAME06%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME06%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME06%"
GOTO END

:ICT238
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME04%"
IF (%PRTNAME05%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME05%"
IF (%PRTNAME06%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME06%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME06%"
GOTO END

:ICT239
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME04%"
IF (%PRTNAME05%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME05%"
IF (%PRTNAME06%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME06%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME06%"
GOTO END

:ICT240
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME04%"
IF (%PRTNAME05%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME05%"
IF (%PRTNAME06%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME06%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME06%"
GOTO END

:ICT241
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME04%"
IF (%PRTNAME05%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME05%"
IF (%PRTNAME06%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME06%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME06%"
GOTO END

:ICT242
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME04%"
IF (%PRTNAME05%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME05%"
IF (%PRTNAME06%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME06%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME06%"
GOTO END

:ICT243
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME04%"
IF (%PRTNAME05%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME05%"
IF (%PRTNAME06%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME06%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME06%"
GOTO END

:ICT244
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME04%"
IF (%PRTNAME05%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME05%"
IF (%PRTNAME06%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME06%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME06%"
GOTO END

REM =============================================================
REM  第三OA教室
REM =============================================================

:ICT300
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME07%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME07%"
IF (%PRTNAME08%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME08%"
IF (%PRTNAME09%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME09%"
GOTO END

:ICT301
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME07%"
IF (%PRTNAME08%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME08%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME08%"
IF (%PRTNAME09%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME09%"
GOTO END

:ICT302
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME07%"
IF (%PRTNAME08%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME08%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME08%"
IF (%PRTNAME09%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME09%"
GOTO END

:ICT303
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME07%"
IF (%PRTNAME08%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME08%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME08%"
IF (%PRTNAME09%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME09%"
GOTO END

:ICT304
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME07%"
IF (%PRTNAME08%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME08%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME08%"
IF (%PRTNAME09%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME09%"
GOTO END

:ICT305
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME07%"
IF (%PRTNAME08%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME08%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME08%"
IF (%PRTNAME09%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME09%"
GOTO END

:ICT306
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME07%"
IF (%PRTNAME08%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME08%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME08%"
IF (%PRTNAME09%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME09%"
GOTO END

:ICT307
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME07%"
IF (%PRTNAME08%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME08%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME08%"
IF (%PRTNAME09%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME09%"
GOTO END

:ICT308
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME07%"
IF (%PRTNAME08%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME08%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME08%"
IF (%PRTNAME09%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME09%"
GOTO END

:ICT309
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME07%"
IF (%PRTNAME08%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME08%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME08%"
IF (%PRTNAME09%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME09%"
GOTO END

:ICT310
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME07%"
IF (%PRTNAME08%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME08%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME08%"
IF (%PRTNAME09%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME09%"
GOTO END

:ICT311
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME07%"
IF (%PRTNAME08%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME08%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME08%"
IF (%PRTNAME09%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME09%"
GOTO END

:ICT312
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME07%"
IF (%PRTNAME08%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME08%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME08%"
IF (%PRTNAME09%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME09%"
GOTO END

:ICT313
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME07%"
IF (%PRTNAME08%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME08%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME08%"
IF (%PRTNAME09%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME09%"
GOTO END

:ICT314
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME07%"
IF (%PRTNAME08%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME08%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME08%"
IF (%PRTNAME09%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME09%"
GOTO END

:ICT315
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME07%"
IF (%PRTNAME08%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME08%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME08%"
IF (%PRTNAME09%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME09%"
GOTO END

:ICT316
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME07%"
IF (%PRTNAME08%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME08%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME08%"
IF (%PRTNAME09%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME09%"
GOTO END

:ICT317
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME07%"
IF (%PRTNAME08%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME08%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME08%"
IF (%PRTNAME09%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME09%"
GOTO END

:ICT318
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME07%"
IF (%PRTNAME08%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME08%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME08%"
IF (%PRTNAME09%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME09%"
GOTO END

:ICT319
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME07%"
IF (%PRTNAME08%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME08%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME08%"
IF (%PRTNAME09%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME09%"
GOTO END

:ICT320
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME07%"
IF (%PRTNAME08%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME08%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME08%"
IF (%PRTNAME09%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME09%"
GOTO END

:ICT321
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME07%"
IF (%PRTNAME08%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME08%"
IF (%PRTNAME09%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME09%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME09%"
GOTO END

:ICT322
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME07%"
IF (%PRTNAME08%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME08%"
IF (%PRTNAME09%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME09%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME09%"
GOTO END

:ICT323
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME07%"
IF (%PRTNAME08%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME08%"
IF (%PRTNAME09%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME09%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME09%"
GOTO END

:ICT324
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME07%"
IF (%PRTNAME08%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME08%"
IF (%PRTNAME09%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME09%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME09%"
GOTO END

:ICT325
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME07%"
IF (%PRTNAME08%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME08%"
IF (%PRTNAME09%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME09%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME09%"
GOTO END

:ICT326
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME07%"
IF (%PRTNAME08%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME08%"
IF (%PRTNAME09%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME09%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME09%"
GOTO END

:ICT327
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME07%"
IF (%PRTNAME08%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME08%"
IF (%PRTNAME09%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME09%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME09%"
GOTO END

:ICT328
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME07%"
IF (%PRTNAME08%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME08%"
IF (%PRTNAME09%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME09%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME09%"
GOTO END

:ICT329
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME07%"
IF (%PRTNAME08%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME08%"
IF (%PRTNAME09%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME09%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME09%"
GOTO END

:ICT330
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME07%"
IF (%PRTNAME08%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME08%"
IF (%PRTNAME09%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME09%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME09%"
GOTO END

:ICT331
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME07%"
IF (%PRTNAME08%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME08%"
IF (%PRTNAME09%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME09%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME09%"
GOTO END

:ICT332
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME07%"
IF (%PRTNAME08%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME08%"
IF (%PRTNAME09%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME09%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME09%"
GOTO END

:ICT333
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME07%"
IF (%PRTNAME08%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME08%"
IF (%PRTNAME09%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME09%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME09%"
GOTO END

:ICT334
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME07%"
IF (%PRTNAME08%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME08%"
IF (%PRTNAME09%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME09%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME09%"
GOTO END

:ICT335
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME07%"
IF (%PRTNAME08%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME08%"
IF (%PRTNAME09%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME09%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME09%"
GOTO END

:ICT336
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME07%"
IF (%PRTNAME08%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME08%"
IF (%PRTNAME09%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME09%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME09%"
GOTO END

:ICT337
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME07%"
IF (%PRTNAME08%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME08%"
IF (%PRTNAME09%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME09%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME09%"
GOTO END

:ICT338
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME07%"
IF (%PRTNAME08%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME08%"
IF (%PRTNAME09%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME09%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME09%"
GOTO END

:ICT339
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME07%"
IF (%PRTNAME08%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME08%"
IF (%PRTNAME09%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME09%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME09%"
GOTO END

:ICT340
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME07%"
IF (%PRTNAME08%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME08%"
IF (%PRTNAME09%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME09%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME09%"
GOTO END

:ICT341
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME07%"
IF (%PRTNAME08%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME08%"
IF (%PRTNAME09%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME09%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME09%"
GOTO END

:ICT342
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME07%"
IF (%PRTNAME08%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME08%"
IF (%PRTNAME09%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME09%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME09%"
GOTO END

:ICT343
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME07%"
IF (%PRTNAME08%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME08%"
IF (%PRTNAME09%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME09%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME09%"
GOTO END

:ICT344
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME07%"
IF (%PRTNAME08%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME08%"
IF (%PRTNAME09%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME09%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME09%"
GOTO END

REM =============================================================
REM  第四OA教室
REM =============================================================

:ICT400
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME10%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME10%"
IF (%PRTNAME11%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME11%"
IF (%PRTNAME12%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME12%"
IF (%PRTNAME13%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME13%"
IF (%PRTNAME14%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME14%"
IF (%PRTNAME15%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME15%"
GOTO END

:ICT401
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME10%"
IF (%PRTNAME11%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME11%"
IF (%PRTNAME12%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME12%"
IF (%PRTNAME13%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME13%"
IF (%PRTNAME14%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME14%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME14%"
IF (%PRTNAME15%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME15%"
GOTO END

:ICT402
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME10%"
IF (%PRTNAME11%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME11%"
IF (%PRTNAME12%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME12%"
IF (%PRTNAME13%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME13%"
IF (%PRTNAME14%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME14%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME14%"
IF (%PRTNAME15%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME15%"
GOTO END

:ICT403
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME10%"
IF (%PRTNAME11%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME11%"
IF (%PRTNAME12%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME12%"
IF (%PRTNAME13%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME13%"
IF (%PRTNAME14%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME14%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME14%"
IF (%PRTNAME15%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME15%"
GOTO END

:ICT404
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME10%"
IF (%PRTNAME11%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME11%"
IF (%PRTNAME12%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME12%"
IF (%PRTNAME13%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME13%"
IF (%PRTNAME14%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME14%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME14%"
IF (%PRTNAME15%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME15%"
GOTO END

:ICT405
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME10%"
IF (%PRTNAME11%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME11%"
IF (%PRTNAME12%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME12%"
IF (%PRTNAME13%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME13%"
IF (%PRTNAME14%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME14%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME14%"
IF (%PRTNAME15%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME15%"
GOTO END

:ICT406
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME10%"
IF (%PRTNAME11%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME11%"
IF (%PRTNAME12%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME12%"
IF (%PRTNAME13%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME13%"
IF (%PRTNAME14%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME14%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME14%"
IF (%PRTNAME15%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME15%"
GOTO END

:ICT407
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME10%"
IF (%PRTNAME11%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME11%"
IF (%PRTNAME12%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME12%"
IF (%PRTNAME13%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME13%"
IF (%PRTNAME14%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME14%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME14%"
IF (%PRTNAME15%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME15%"
GOTO END

:ICT408
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME10%"
IF (%PRTNAME11%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME11%"
IF (%PRTNAME12%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME12%"
IF (%PRTNAME13%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME13%"
IF (%PRTNAME14%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME14%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME14%"
IF (%PRTNAME15%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME15%"
GOTO END

:ICT409
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME10%"
IF (%PRTNAME11%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME11%"
IF (%PRTNAME12%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME12%"
IF (%PRTNAME13%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME13%"
IF (%PRTNAME14%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME14%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME14%"
IF (%PRTNAME15%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME15%"
GOTO END

:ICT410
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME10%"
IF (%PRTNAME11%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME11%"
IF (%PRTNAME12%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME12%"
IF (%PRTNAME13%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME13%"
IF (%PRTNAME14%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME14%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME14%"
IF (%PRTNAME15%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME15%"
GOTO END

:ICT411
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME10%"
IF (%PRTNAME11%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME11%"
IF (%PRTNAME12%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME12%"
IF (%PRTNAME13%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME13%"
IF (%PRTNAME14%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME14%"
IF (%PRTNAME15%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME15%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME15%"
GOTO END

:ICT412
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME10%"
IF (%PRTNAME11%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME11%"
IF (%PRTNAME12%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME12%"
IF (%PRTNAME13%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME13%"
IF (%PRTNAME14%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME14%"
IF (%PRTNAME15%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME15%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME15%"
GOTO END

:ICT413
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME10%"
IF (%PRTNAME11%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME11%"
IF (%PRTNAME12%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME12%"
IF (%PRTNAME13%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME13%"
IF (%PRTNAME14%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME14%"
IF (%PRTNAME15%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME15%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME15%"
GOTO END

:ICT414
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME10%"
IF (%PRTNAME11%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME11%"
IF (%PRTNAME12%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME12%"
IF (%PRTNAME13%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME13%"
IF (%PRTNAME14%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME14%"
IF (%PRTNAME15%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME15%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME15%"
GOTO END

:ICT415
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME10%"
IF (%PRTNAME11%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME11%"
IF (%PRTNAME12%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME12%"
IF (%PRTNAME13%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME13%"
IF (%PRTNAME14%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME14%"
IF (%PRTNAME15%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME15%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME15%"
GOTO END

:ICT416
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME10%"
IF (%PRTNAME11%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME11%"
IF (%PRTNAME12%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME12%"
IF (%PRTNAME13%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME13%"
IF (%PRTNAME14%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME14%"
IF (%PRTNAME15%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME15%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME15%"
GOTO END

:ICT417
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME10%"
IF (%PRTNAME11%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME11%"
IF (%PRTNAME12%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME12%"
IF (%PRTNAME13%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME13%"
IF (%PRTNAME14%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME14%"
IF (%PRTNAME15%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME15%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME15%"
GOTO END

:ICT418
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME10%"
IF (%PRTNAME11%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME11%"
IF (%PRTNAME12%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME12%"
IF (%PRTNAME13%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME13%"
IF (%PRTNAME14%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME14%"
IF (%PRTNAME15%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME15%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME15%"
GOTO END

:ICT419
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME10%"
IF (%PRTNAME11%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME11%"
IF (%PRTNAME12%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME12%"
IF (%PRTNAME13%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME13%"
IF (%PRTNAME14%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME14%"
IF (%PRTNAME15%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME15%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME15%"
GOTO END

:ICT420
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME10%"
IF (%PRTNAME11%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME11%"
IF (%PRTNAME12%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME12%"
IF (%PRTNAME13%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME13%"
IF (%PRTNAME14%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME14%"
IF (%PRTNAME15%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME15%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME15%"
GOTO END
:ICT421
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME10%"
IF (%PRTNAME11%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME11%"
IF (%PRTNAME12%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME12%"
IF (%PRTNAME13%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME13%"
IF (%PRTNAME14%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME14%"
IF (%PRTNAME15%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME15%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME15%"
GOTO END

:ICT422
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME10%"
IF (%PRTNAME11%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME11%"
IF (%PRTNAME12%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME12%"
IF (%PRTNAME13%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME13%"
IF (%PRTNAME14%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME14%"
IF (%PRTNAME15%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME15%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME15%"
GOTO END

:ICT423
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME10%"
IF (%PRTNAME11%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME11%"
IF (%PRTNAME12%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME12%"
IF (%PRTNAME13%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME13%"
IF (%PRTNAME14%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME14%"
IF (%PRTNAME15%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME15%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME15%"
GOTO END

:ICT424
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME10%"
IF (%PRTNAME11%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME11%"
IF (%PRTNAME12%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME12%"
IF (%PRTNAME13%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME13%"
IF (%PRTNAME14%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME14%"
IF (%PRTNAME15%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME15%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME15%"
GOTO END

REM =============================================================
REM  第五OA教室
REM =============================================================

:ICT500
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME16%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME16%"
IF (%PRTNAME17%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME17%"
IF (%PRTNAME18%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME18%"
IF (%PRTNAME19%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME19%"
IF (%PRTNAME20%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME20%"
IF (%PRTNAME21%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME21%"
IF (%PRTNAME22%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME22%"
GOTO END

:ICT501
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME16%"
IF (%PRTNAME17%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME17%"
IF (%PRTNAME18%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME18%"
IF (%PRTNAME19%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME19%"
IF (%PRTNAME20%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME20%"
IF (%PRTNAME21%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME21%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME21%"
IF (%PRTNAME22%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME22%"
GOTO END

:ICT502
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME16%"
IF (%PRTNAME17%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME17%"
IF (%PRTNAME18%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME18%"
IF (%PRTNAME19%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME19%"
IF (%PRTNAME20%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME20%"
IF (%PRTNAME21%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME21%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME21%"
IF (%PRTNAME22%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME22%"
GOTO END

:ICT503
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME16%"
IF (%PRTNAME17%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME17%"
IF (%PRTNAME18%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME18%"
IF (%PRTNAME19%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME19%"
IF (%PRTNAME20%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME20%"
IF (%PRTNAME21%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME21%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME21%"
IF (%PRTNAME22%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME22%"
GOTO END

:ICT504
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME16%"
IF (%PRTNAME17%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME17%"
IF (%PRTNAME18%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME18%"
IF (%PRTNAME19%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME19%"
IF (%PRTNAME20%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME20%"
IF (%PRTNAME21%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME21%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME21%"
IF (%PRTNAME22%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME22%"
GOTO END

:ICT505
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME16%"
IF (%PRTNAME17%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME17%"
IF (%PRTNAME18%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME18%"
IF (%PRTNAME19%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME19%"
IF (%PRTNAME20%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME20%"
IF (%PRTNAME21%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME21%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME21%"
IF (%PRTNAME22%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME22%"
GOTO END

:ICT506
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME16%"
IF (%PRTNAME17%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME17%"
IF (%PRTNAME18%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME18%"
IF (%PRTNAME19%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME19%"
IF (%PRTNAME20%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME20%"
IF (%PRTNAME21%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME21%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME21%"
IF (%PRTNAME22%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME22%"
GOTO END

:ICT507
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME16%"
IF (%PRTNAME17%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME17%"
IF (%PRTNAME18%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME18%"
IF (%PRTNAME19%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME19%"
IF (%PRTNAME20%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME20%"
IF (%PRTNAME21%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME21%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME21%"
IF (%PRTNAME22%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME22%"
GOTO END

:ICT508
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME16%"
IF (%PRTNAME17%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME17%"
IF (%PRTNAME18%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME18%"
IF (%PRTNAME19%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME19%"
IF (%PRTNAME20%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME20%"
IF (%PRTNAME21%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME21%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME21%"
IF (%PRTNAME22%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME22%"
GOTO END

:ICT509
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME16%"
IF (%PRTNAME17%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME17%"
IF (%PRTNAME18%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME18%"
IF (%PRTNAME19%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME19%"
IF (%PRTNAME20%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME20%"
IF (%PRTNAME21%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME21%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME21%"
IF (%PRTNAME22%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME22%"
GOTO END

:ICT510
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME16%"
IF (%PRTNAME17%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME17%"
IF (%PRTNAME18%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME18%"
IF (%PRTNAME19%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME19%"
IF (%PRTNAME20%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME20%"
IF (%PRTNAME21%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME21%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME21%"
IF (%PRTNAME22%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME22%"
GOTO END

:ICT511
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME16%"
IF (%PRTNAME17%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME17%"
IF (%PRTNAME18%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME18%"
IF (%PRTNAME19%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME19%"
IF (%PRTNAME20%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME20%"
IF (%PRTNAME21%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME21%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME21%"
IF (%PRTNAME22%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME22%"
GOTO END

:ICT512
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME16%"
IF (%PRTNAME17%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME17%"
IF (%PRTNAME18%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME18%"
IF (%PRTNAME19%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME19%"
IF (%PRTNAME20%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME20%"
IF (%PRTNAME21%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME21%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME21%"
IF (%PRTNAME22%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME22%"
GOTO END

:ICT513
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME16%"
IF (%PRTNAME17%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME17%"
IF (%PRTNAME18%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME18%"
IF (%PRTNAME19%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME19%"
IF (%PRTNAME20%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME20%"
IF (%PRTNAME21%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME21%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME21%"
IF (%PRTNAME22%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME22%"
GOTO END

:ICT514
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME16%"
IF (%PRTNAME17%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME17%"
IF (%PRTNAME18%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME18%"
IF (%PRTNAME19%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME19%"
IF (%PRTNAME20%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME20%"
IF (%PRTNAME21%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME21%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME21%"
IF (%PRTNAME22%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME22%"
GOTO END

:ICT515
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME16%"
IF (%PRTNAME17%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME17%"
IF (%PRTNAME18%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME18%"
IF (%PRTNAME19%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME19%"
IF (%PRTNAME20%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME20%"
IF (%PRTNAME21%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME21%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME21%"
IF (%PRTNAME22%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME22%"
GOTO END

:ICT516
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME16%"
IF (%PRTNAME17%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME17%"
IF (%PRTNAME18%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME18%"
IF (%PRTNAME19%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME19%"
IF (%PRTNAME20%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME20%"
IF (%PRTNAME21%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME21%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME21%"
IF (%PRTNAME22%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME22%"
GOTO END

:ICT517
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME16%"
IF (%PRTNAME17%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME17%"
IF (%PRTNAME18%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME18%"
IF (%PRTNAME19%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME19%"
IF (%PRTNAME20%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME20%"
IF (%PRTNAME21%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME21%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME21%"
IF (%PRTNAME22%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME22%"
GOTO END

:ICT518
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME16%"
IF (%PRTNAME17%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME17%"
IF (%PRTNAME18%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME18%"
IF (%PRTNAME19%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME19%"
IF (%PRTNAME20%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME20%"
IF (%PRTNAME21%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME21%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME21%"
IF (%PRTNAME22%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME22%"
GOTO END

:ICT519
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME16%"
IF (%PRTNAME17%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME17%"
IF (%PRTNAME18%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME18%"
IF (%PRTNAME19%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME19%"
IF (%PRTNAME20%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME20%"
IF (%PRTNAME21%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME21%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME21%"
IF (%PRTNAME22%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME22%"
GOTO END

:ICT520
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME16%"
IF (%PRTNAME17%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME17%"
IF (%PRTNAME18%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME18%"
IF (%PRTNAME19%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME19%"
IF (%PRTNAME20%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME20%"
IF (%PRTNAME21%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME21%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME21%"
IF (%PRTNAME22%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME22%"
GOTO END

:ICT521
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME16%"
IF (%PRTNAME17%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME17%"
IF (%PRTNAME18%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME18%"
IF (%PRTNAME19%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME19%"
IF (%PRTNAME20%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME20%"
IF (%PRTNAME21%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME21%"
IF (%PRTNAME22%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME22%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME22%"
GOTO END

:ICT522
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME16%"
IF (%PRTNAME17%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME17%"
IF (%PRTNAME18%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME18%"
IF (%PRTNAME19%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME19%"
IF (%PRTNAME20%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME20%"
IF (%PRTNAME21%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME21%"
IF (%PRTNAME22%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME22%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME22%"
GOTO END

:ICT523
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME16%"
IF (%PRTNAME17%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME17%"
IF (%PRTNAME18%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME18%"
IF (%PRTNAME19%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME19%"
IF (%PRTNAME20%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME20%"
IF (%PRTNAME21%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME21%"
IF (%PRTNAME22%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME22%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME22%"
GOTO END

:ICT524
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME16%"
IF (%PRTNAME17%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME17%"
IF (%PRTNAME18%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME18%"
IF (%PRTNAME19%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME19%"
IF (%PRTNAME20%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME20%"
IF (%PRTNAME21%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME21%"
IF (%PRTNAME22%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME22%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME22%"
GOTO END

:ICT525
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME16%"
IF (%PRTNAME17%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME17%"
IF (%PRTNAME18%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME18%"
IF (%PRTNAME19%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME19%"
IF (%PRTNAME20%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME20%"
IF (%PRTNAME21%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME21%"
IF (%PRTNAME22%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME22%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME22%"
GOTO END

:ICT526
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME16%"
IF (%PRTNAME17%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME17%"
IF (%PRTNAME18%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME18%"
IF (%PRTNAME19%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME19%"
IF (%PRTNAME20%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME20%"
IF (%PRTNAME21%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME21%"
IF (%PRTNAME22%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME22%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME22%"
GOTO END

:ICT527
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME16%"
IF (%PRTNAME17%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME17%"
IF (%PRTNAME18%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME18%"
IF (%PRTNAME19%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME19%"
IF (%PRTNAME20%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME20%"
IF (%PRTNAME21%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME21%"
IF (%PRTNAME22%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME22%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME22%"
GOTO END

:ICT528
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME16%"
IF (%PRTNAME17%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME17%"
IF (%PRTNAME18%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME18%"
IF (%PRTNAME19%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME19%"
IF (%PRTNAME20%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME20%"
IF (%PRTNAME21%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME21%"
IF (%PRTNAME22%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME22%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME22%"
GOTO END

:ICT529
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME16%"
IF (%PRTNAME17%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME17%"
IF (%PRTNAME18%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME18%"
IF (%PRTNAME19%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME19%"
IF (%PRTNAME20%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME20%"
IF (%PRTNAME21%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME21%"
IF (%PRTNAME22%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME22%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME22%"
GOTO END

:ICT530
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME16%"
IF (%PRTNAME17%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME17%"
IF (%PRTNAME18%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME18%"
IF (%PRTNAME19%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME19%"
IF (%PRTNAME20%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME20%"
IF (%PRTNAME21%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME21%"
IF (%PRTNAME22%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME22%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME22%"
GOTO END

:ICT531
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME16%"
IF (%PRTNAME17%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME17%"
IF (%PRTNAME18%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME18%"
IF (%PRTNAME19%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME19%"
IF (%PRTNAME20%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME20%"
IF (%PRTNAME21%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME21%"
IF (%PRTNAME22%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME22%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME22%"
GOTO END

:ICT532
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME16%"
IF (%PRTNAME17%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME17%"
IF (%PRTNAME18%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME18%"
IF (%PRTNAME19%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME19%"
IF (%PRTNAME20%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME20%"
IF (%PRTNAME21%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME21%"
IF (%PRTNAME22%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME22%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME22%"
GOTO END

:ICT533
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME16%"
IF (%PRTNAME17%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME17%"
IF (%PRTNAME18%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME18%"
IF (%PRTNAME19%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME19%"
IF (%PRTNAME20%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME20%"
IF (%PRTNAME21%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME21%"
IF (%PRTNAME22%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME22%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME22%"
GOTO END

:ICT534
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME16%"
IF (%PRTNAME17%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME17%"
IF (%PRTNAME18%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME18%"
IF (%PRTNAME19%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME19%"
IF (%PRTNAME20%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME20%"
IF (%PRTNAME21%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME21%"
IF (%PRTNAME22%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME22%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME22%"
GOTO END

:ICT535
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME16%"
IF (%PRTNAME17%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME17%"
IF (%PRTNAME18%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME18%"
IF (%PRTNAME19%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME19%"
IF (%PRTNAME20%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME20%"
IF (%PRTNAME21%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME21%"
IF (%PRTNAME22%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME22%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME22%"
GOTO END

:ICT536
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME16%"
IF (%PRTNAME17%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME17%"
IF (%PRTNAME18%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME18%"
IF (%PRTNAME19%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME19%"
IF (%PRTNAME20%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME20%"
IF (%PRTNAME21%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME21%"
IF (%PRTNAME22%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME22%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME22%"
GOTO END

:ICT537
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME16%"
IF (%PRTNAME17%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME17%"
IF (%PRTNAME18%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME18%"
IF (%PRTNAME19%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME19%"
IF (%PRTNAME20%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME20%"
IF (%PRTNAME21%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME21%"
IF (%PRTNAME22%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME22%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME22%"
GOTO END

:ICT538
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME16%"
IF (%PRTNAME17%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME17%"
IF (%PRTNAME18%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME18%"
IF (%PRTNAME19%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME19%"
IF (%PRTNAME20%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME20%"
IF (%PRTNAME21%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME21%"
IF (%PRTNAME22%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME22%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME22%"
GOTO END

:ICT539
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME16%"
IF (%PRTNAME17%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME17%"
IF (%PRTNAME18%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME18%"
IF (%PRTNAME19%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME19%"
IF (%PRTNAME20%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME20%"
IF (%PRTNAME21%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME21%"
IF (%PRTNAME22%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME22%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME22%"
GOTO END

:ICT540
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME16%"
IF (%PRTNAME17%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME17%"
IF (%PRTNAME18%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME18%"
IF (%PRTNAME19%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME19%"
IF (%PRTNAME20%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME20%"
IF (%PRTNAME21%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME21%"
IF (%PRTNAME22%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME22%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME22%"
GOTO END

:ICT541
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME16%"
IF (%PRTNAME17%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME17%"
IF (%PRTNAME18%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME18%"
IF (%PRTNAME19%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME19%"
IF (%PRTNAME20%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME20%"
IF (%PRTNAME21%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME21%"
IF (%PRTNAME22%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME22%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME22%"
GOTO END

:ICT542
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME16%"
IF (%PRTNAME17%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME17%"
IF (%PRTNAME18%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME18%"
IF (%PRTNAME19%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME19%"
IF (%PRTNAME20%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME20%"
IF (%PRTNAME21%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME21%"
IF (%PRTNAME22%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME22%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME22%"
GOTO END

:ICT543
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME16%"
IF (%PRTNAME17%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME17%"
IF (%PRTNAME18%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME18%"
IF (%PRTNAME19%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME19%"
IF (%PRTNAME20%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME20%"
IF (%PRTNAME21%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME21%"
IF (%PRTNAME22%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME22%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME22%"
GOTO END

:ICT544
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME16%"
IF (%PRTNAME17%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME17%"
IF (%PRTNAME18%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME18%"
IF (%PRTNAME19%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME19%"
IF (%PRTNAME20%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME20%"
IF (%PRTNAME21%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME21%"
IF (%PRTNAME22%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME22%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME22%"
GOTO END

REM ==================================================
REM 総合実践室
REM ==================================================

:ICT601
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME23%"
IF (%PRTNAME24%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME24%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME24%"
IF (%PRTNAME25%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME25%"
GOTO END 

:ICT602
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME23%"
IF (%PRTNAME24%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME24%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME24%"
IF (%PRTNAME25%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME25%"
GOTO END

:ICT603
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME23%"
IF (%PRTNAME24%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME24%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME24%"
IF (%PRTNAME25%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME25%"
GOTO END

:ICT604
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME23%"
IF (%PRTNAME24%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME24%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME24%"
IF (%PRTNAME25%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME25%"
GOTO END

:ICT605
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME23%"
IF (%PRTNAME24%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME24%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME24%"
IF (%PRTNAME25%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME25%"
GOTO END

:ICT606
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME23%"
IF (%PRTNAME24%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME24%"
IF (%PRTNAME25%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME25%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME25%"
GOTO END

:ICT607
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME23%"
IF (%PRTNAME24%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME24%"
IF (%PRTNAME25%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME25%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME25%"
GOTO END

:ICT608
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME23%"
IF (%PRTNAME24%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME24%"
IF (%PRTNAME25%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME25%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME25%"
GOTO END

:ICT609
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME23%"
IF (%PRTNAME24%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME24%"
IF (%PRTNAME25%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME25%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME25%"
GOTO END

:ICT610
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME23%"
IF (%PRTNAME24%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME24%"
IF (%PRTNAME25%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME25%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME25%"
GOTO END

REM ==================================================
REM サーバー室
REM ==================================================

:ICT001
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME26%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME26%"
IF (%PRTNAME27%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME27%"
GOTO END

:ICT002
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME26%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME26%"
IF (%PRTNAME27%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME27%"
GOTO END

:ICT003
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME26%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME26%"
IF (%PRTNAME27%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME27%"
GOTO END

:ICT004
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME26%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME26%"
IF (%PRTNAME27%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME27%"
GOTO END

:ICT005
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME26%"
REM 通常使うプリンター
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME26%"
IF (%PRTNAME27%) == () GOTO END
cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME27%"
GOTO END

REM ==================================================
REM サーバー室モノクロの時
REM ==================================================
REM cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME26%"
REM IF (%PRTNAME27%) == () GOTO END
REM cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -ac -p "\\%SERVERNAME%\%PRTNAME27%"
REM 通常使うプリンター
REM cscript.exe C:\Windows\System32\Printing_Admin_Scripts\ja-JP\prnmngr.vbs -t -p "\\%SERVERNAME%\%PRTNAME27%"
REM GOTO END

REM ==================================================
REM 各コンピュータ共通の処理がある場合
REM ==================================================

:END
