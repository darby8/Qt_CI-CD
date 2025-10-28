!define APPNAME "YourApp"
!define COMPANY "YourCompany"
!define VERSION "1.0.0"
!define INSTALL_DIR "$PROGRAMFILES64\${COMPANY}\${APPNAME}"

OutFile "${APPNAME}_Setup_${VERSION}.exe"
InstallDir "${INSTALL_DIR}"
RequestExecutionLevel admin

Page directory
Page instfiles

Section "Install"
  SetOutPath "$INSTDIR"
  File /r "install\*.*"

  ; ✅ Create Desktop Shortcut
  CreateShortcut "$DESKTOP\${APPNAME}.lnk" "$INSTDIR\bin\apptest_qt.exe"

  ; ✅ Write Uninstaller
  WriteUninstaller "$INSTDIR\Uninstall.exe"

  ; ✅ Register Uninstaller in Windows Control Panel
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "DisplayName" "${APPNAME}"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "UninstallString" "$INSTDIR\Uninstall.exe"
SectionEnd

Section "Uninstall"
  ; Remove Desktop Shortcut
  Delete "$DESKTOP\${APPNAME}.lnk"

  ; Remove Files
  RMDir /r "$INSTDIR"

  ; Remove Uninstall Entry
  DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}"
SectionEnd

