!define APPNAME "apptest_qt"
!define COMPANY "MyCompany"
!define VERSION "1.0.0"
!define INSTALL_DIR "$PROGRAMFILES64\${COMPANY}\${APPNAME}"

OutFile "${APPNAME}_Setup_${VERSION}.exe"
InstallDir "${INSTALL_DIR}"
RequestExecutionLevel admin

Page directory
Page instfiles

Section "Install"
  SetOutPath "$INSTDIR"

  ; Copy everything from the install folder created by CMake
  File /r "install\*.*"

  ; Create Desktop Shortcut
  CreateShortcut "$DESKTOP\${APPNAME}.lnk" "$INSTDIR\bin\${APPNAME}.exe"
SectionEnd

Section "Uninstall"
  ; Remove Shortcut
  Delete "$DESKTOP\${APPNAME}.lnk"

  ; Remove Installed Folder
  RMDir /r "$INSTDIR"
SectionEnd

