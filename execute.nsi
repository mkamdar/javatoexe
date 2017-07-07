; Java Launcher
;--------------
;!include "MUI2.nsh"
!include "${NSISDIR}\Contrib\Modern UI\System.nsh"
;!define MUI_ICON "G:\logo_revenue.ico"
;!define MUI_HEADERIMAGE
;!define MUI_HEADERIMAGE_BITMAP "G:\logo_revenue_big.bmp"
;!define MUI_HEADERIMAGE_RIGHT
;You want to change the next two lines too
;!define CLASSPATH ".;lib;C:\XMLDownloadUtil.jar"
!define CLASSPATH ".;lib;${INSTDIR}\XMLDownloadUtil.jar"
!define MUI_PRODUCT "Xml Downloader Ver. 1.0"
;!define CLASS "com.xx.ITSGui"
!define INSTDIR "$PROGRAMFILES\${MUI_PRODUCT}"
;You want to change the next four lines
Name "XMl file Utility"
Caption "XMl file Utility"
;Icon "logo.ico"
OutFile "run.exe"
 
SilentInstall silent
AutoCloseWindow true
ShowInstDetails nevershow
 

Section ""
  Call GetJRE
  
  ;IfFileExists "${INSTDIR}\XMLDownloadUtil\XMLDownloadUtil.jar" file_found file_not_found
  ;file_found:
    ;MessageBox MB_OK "XmlDownloadutil Already installed"
    ;goto execute_WithOut_Copy
  
  ;file_not_found:
    ;SetOutPath "${INSTDIR}\XMLDownloadUtil\lib"
    ;File "G:\XMLDownloadUtil.jar"
    ;SetOutPath "${INSTDIR}\XMLDownloadUtil\bin"
    ;File "G:\XMLDownloadUtil.exe"
    ;File "G:\Run.bat"
    ;SetOutPath "${INSTDIR}\XMLDownloadUtil\"
    ;File "G:\logo_big.bmp"
    ;MessageBox MB_OK "XmlDownloadutil installation finished"

  ;execute_WithOut_Copy:
  Pop $R0
 
  ; change for your purpose (-jar etc.)
  ;StrCpy $0 '"$R0" -classpath "${CLASSPATH}" -jar ${CLASS}'
 
  ;StrCpy $0 '"$R0" -classpath "${CLASSPATH}" -jar "${INSTDIR}\Payee XMl util Ver. 1.0\lib\XMLDownloadUtil.jar"'
  StrCpy $0 '"$R0" -classpath "${CLASSPATH}" -jar "${INSTDIR}\lib\XMLDownloadUtil.jar"'
 
 
  SetOutPath $EXEDIR
  ExecWait $0
SectionEnd
 



Function GetJRE
;
;  Find JRE (javaw.exe)
;  1 - in .\jre directory (JRE Installed with application)
;  2 - in JAVA_HOME environment variable
;  3 - in the registry
;  4 - assume javaw.exe in current dir or PATH
 
  Push $R0
  Push $R1
 
  ClearErrors
  StrCpy $R0 "$EXEDIR\jre\bin\javaw.exe"
  IfFileExists $R0 JreFound
  StrCpy $R0 ""
 
  ClearErrors
  ReadEnvStr $R0 "JAVA_HOME"
  StrCpy $R0 "$R0\bin\javaw.exe"
  IfErrors 0 JreFound
 
  ClearErrors
  ReadRegStr $R1 HKLM "SOFTWARE\JavaSoft\Java Runtime Environment" "CurrentVersion"
  ReadRegStr $R0 HKLM "SOFTWARE\JavaSoft\Java Runtime Environment\$R1" "JavaHome"
  StrCpy $R0 "$R0\bin\javaw.exe"
 
  IfErrors 0 JreFound
  StrCpy $R0 "javaw.exe"
 
 JreFound:
  Pop $R1
  Exch $R0
FunctionEnd