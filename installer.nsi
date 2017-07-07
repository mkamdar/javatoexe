; -------------------------------
; Start
 
 
  !define MUI_PRODUCT "Xml Downloader Ver. 1.0"
  !define MUI_FILE "run"
  !define MUI_VERSION ""
  !define MUI_BRANDINGTEXT "Revenue Xml Download Ver. 1.0"
  CRCCheck On
 
  ; Bij deze moeten we waarschijnlijk een absoluut pad gaan gebruiken
  ; dit moet effe uitgetest worden.
  !include "${NSISDIR}\Contrib\Modern UI\System.nsh"
 
 
;---------------------------------
;General
 
  OutFile "install.exe"
  ;ShowInstDetails "nevershow"
  ShowUninstDetails "nevershow"
  ;SetCompressor "bzip2"
 
  ;!define MUI_ICON "icon.ico"
  ;!define MUI_UNICON "icon.ico"
  ;!define MUI_SPECIALBITMAP "Bitmap.bmp"
 
 
;--------------------------------
;Folder selection page
 
  InstallDir "$PROGRAMFILES\${MUI_PRODUCT}"
 
 
;--------------------------------
;Modern UI Configuration
 
  !define MUI_WELCOMEPAGE  
  !define MUI_LICENSEPAGE
  !define MUI_DIRECTORYPAGE
  !define MUI_ABORTWARNING
  !define MUI_UNINSTALLER
  !define MUI_UNCONFIRMPAGE
  !define MUI_FINISHPAGE  
 
 
;--------------------------------
;Language
 
  !insertmacro MUI_LANGUAGE "English"
 
 
;-------------------------------- 
;Modern UI System
 
  ;!insertmacro MUI_SYSTEM 
 
 
;--------------------------------
;Data
 
  ;LicenseData ""
 
 
;-------------------------------- 
;Installer Sections     
;Section "install" Installation info
Section "install"
 
;Add files
  SetOutPath "$INSTDIR"
 
  File "${MUI_FILE}.exe"
  file "G:\CONTAX\CIF\Mufaddal\XMLDownloadUtil\${MUI_PRODUCT}\Run.bat"
  ;File "${MUI_FILE}.ini"
  ;File "Lees_mij.txt"
  SetOutPath "$INSTDIR\lib"
  file "C:\${MUI_PRODUCT}\XMLDownloadUtil.jar"
  SetOutPath "$INSTDIR\Icons"
  file "C:\${MUI_PRODUCT}\nsis3-install-alt.ico"
  ;SetOutPath "$INSTDIR\data"
  ;file "data\*.cst"
  ;file "data\errorlog.txt"
  ; hier komen dan nog de bestanden die in de playlist staan
  ;SetOutPath "$INSTDIR"  
  ;file /r mpg
  ;SetOutPath "$INSTDIR"  
  ;file /r xtras  
 
;create desktop shortcut
  CreateShortCut "$DESKTOP\${MUI_PRODUCT}.lnk" "$INSTDIR\${MUI_FILE}.exe" "" "$INSTDIR\Icons\nsis3-install-alt.ico"
 
;create start-menu items
  CreateDirectory "$SMPROGRAMS\${MUI_PRODUCT}"
  CreateShortCut "$SMPROGRAMS\${MUI_PRODUCT}\Uninstall.lnk" "$INSTDIR\Uninstall.exe" "" "$INSTDIR\Uninstall.exe" 0
  CreateShortCut "$SMPROGRAMS\${MUI_PRODUCT}\${MUI_PRODUCT}.lnk" "$INSTDIR\${MUI_FILE}.exe" "" "$INSTDIR\${MUI_FILE}.exe" 0
 
;write uninstall information to the registry
  ;WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${MUI_PRODUCT}" "DisplayName" "${MUI_PRODUCT} (remove only)"
  ;WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${MUI_PRODUCT}" "UninstallString" "$INSTDIR\Uninstall.exe"
 
  WriteUninstaller "$INSTDIR\Uninstall.exe"
 
SectionEnd
 
 
;--------------------------------    
;Uninstaller Section  
Section "Uninstall"
 
;Delete Files 
  RMDir /r "$INSTDIR\*.*"    
 
;Remove the installation directory
  RMDir "$INSTDIR"
 
;Delete Start Menu Shortcuts
  Delete "$DESKTOP\${MUI_PRODUCT}.lnk"
  Delete "$SMPROGRAMS\${MUI_PRODUCT}\*.*"
  RmDir  "$SMPROGRAMS\${MUI_PRODUCT}"
 
;Delete Uninstaller And Unistall Registry Entries
  ;DeleteRegKey HKEY_LOCAL_MACHINE "SOFTWARE\${MUI_PRODUCT}"
  ;DeleteRegKey HKEY_LOCAL_MACHINE "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\${MUI_PRODUCT}"  
 
SectionEnd
 
 
;--------------------------------    
;MessageBox Section
 
 
;Function that calls a messagebox when installation finished correctly
Function .onInstSuccess
  MessageBox MB_OK "You have successfully installed ${MUI_PRODUCT}. Use the desktop icon to start the program."
FunctionEnd
 
 
Function un.onUninstSuccess
  MessageBox MB_OK "You have successfully uninstalled ${MUI_PRODUCT}."
FunctionEnd
 
 
;eof
