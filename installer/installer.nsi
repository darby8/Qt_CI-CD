!define APP_NAME "apptest_qt"
!define APP_VERSION "1.0.0"
!define INSTALL_DIR "$PROGRAMFILES\${APP_NAME}"

OutFile "${APP_NAME}-Installer-${APP_VERSION}.exe"
InstallDir "${INSTALL_DIR}"

RequestExecutionLevel admin

Page directory
Page instfiles
UninstPage uninstConfirm
UninstPage instfiles

Section "Install"
  SetOutPath "$INSTDIR"
  File /r "build\Desktop_Qt_6_8_3-Release\*.*"

  ; Create Desktop Shortcut
  CreateShortcut "$DESKTOP\${APP_NAME}.lnk" "$INSTDIR\${APP_NAME}.exe"
SectionEnd

Section "Uninstall"
  RMDir /r "$INSTDIR"
  Delete "$DESKTOP\${APP_NAME}.lnk"
SectionEnd

