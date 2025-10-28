!define APPNAME "apptest_qt"
!define COMPANY "MyCompany"
!define VERSION "1.0.0"
!define INSTALL_DIR "$PROGRAMFILES64\${COMPANY}\${APPNAME}"

OutFile "${APPNAME}_Setup_${VERSION}.exe"
InstallDir "${INSTALL_DIR}"
RequestExecutionLevel admin

; --- Correct Page Order ---
Page directory
Page instfiles
UninstPage uninstConfirm
UninstPage instfiles

Section "Install"
  SetOutPath "$INSTDIR"
  File /r "install\*.*"

  ; Create desktop shortcut
  CreateShortcut "$DESKTOP\${APPNAME}.lnk" "$INSTDIR\bin\${APPNAME}.exe"

  ; This line was missing before -> creates uninstaller
  WriteUninstaller "$INSTDIR\Uninstall.exe"
SectionEnd

Section "Uninstall"
  Delete "$DESKTOP\${APPNAME}.lnk"
  RMDir /r "$INSTDIR"
SectionEnd

