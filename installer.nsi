!define APP_NAME "apptest_qt"
!define APP_VERSION "1.0.0"
!define COMPANY_NAME "Reak"
!define INSTALL_DIR "$PROGRAMFILES\${APP_NAME}"

Outfile "${APP_NAME}-Installer-${APP_VERSION}.exe"
InstallDir "${INSTALL_DIR}"

Page directory
Page instfiles

Section "Install"
  SetOutPath "$INSTDIR"

  File /r "build\*.*"

  CreateShortcut "$DESKTOP\${APP_NAME}.lnk" "$INSTDIR\${APP_NAME}.exe"
SectionEnd

Section "Uninstall"
  RMDir /r "$INSTDIR"
  Delete "$DESKTOP\${APP_NAME}.lnk"
SectionEnd

