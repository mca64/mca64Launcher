SetCompressor /FINAL /SOLID LZMA
ShowInstDetails "show"
ShowUninstDetails "show"
!define WERSJA "1.8.9.10"
!define VERSIONMAJOR 1
!define VERSIONMINOR 8
;!define VERSIONBUILD 9.10
!define HELPURL "mailto:mca640@gmail.com"
!define UPDATEURL "http://9rax.com/mca64/download.php"
!define ABOUTURL "http://9rax.com/mca64/mca64Launcher.htm" 
!define ROZMIAR 58921
RequestExecutionLevel admin
InstallDir "$PROGRAMFILES\mca64Launcher\mca64Launcher ${WERSJA}"
LicenseData "mca64Launcher ${WERSJA}\licencja.txt"
Name "mca64Launcher ${WERSJA}"
;Icon "mca64Launcher ${WERSJA}\ikona.ico"
UninstallIcon "mca64Launcher ${WERSJA}\ikona2.ico"
OutFile "mca64Launcher${WERSJA}.exe"
!include LogicLib.nsh
;!include nsDialogs.nsh
Page license
Page directory
Page instFiles

!macro VerifyUserIsAdmin
	UserInfo::GetAccountType
	pop $0
	${If} $0 != "admin"
        messageBox mb_iconstop "Administrator rights required!"
        setErrorLevel 740
        quit
	${EndIf}
!macroend
 
function .onInit
	setShellVarContext all
	!insertmacro VerifyUserIsAdmin
functionEnd
 
section "install"
	setOutPath $INSTDIR
	File "mca64Launcher ${WERSJA}\arch1"
	File "mca64Launcher ${WERSJA}\arch2"
	File "mca64Launcher ${WERSJA}\AudioNagrywanie.dll"
	File "mca64Launcher ${WERSJA}\AudioXP.dll"
	File "mca64Launcher ${WERSJA}\cp1250"
	File "mca64Launcher ${WERSJA}\cyrylica"
	File "mca64Launcher ${WERSJA}\ezhmm.dll"
	File "mca64Launcher ${WERSJA}\ffmpeg.exe"
	File "mca64Launcher ${WERSJA}\gen_mca64launcher.dll"
	File "mca64Launcher ${WERSJA}\GUIfixes.dll"
	File "mca64Launcher ${WERSJA}\guifixes.ini"
	File "mca64Launcher ${WERSJA}\iccscbn.icc"
	File "mca64Launcher ${WERSJA}\ICCupPluginLoader.dll"
	File "mca64Launcher ${WERSJA}\iccup__"
	File "mca64Launcher ${WERSJA}\ikona.ico"
	File "mca64Launcher ${WERSJA}\ikona2.ico"	
	File "mca64Launcher ${WERSJA}\Koreanski.dll"
	File "mca64Launcher ${WERSJA}\libeay32_"
	File "mca64Launcher ${WERSJA}\licencja.txt"
	File "mca64Launcher ${WERSJA}\mca64Launcher.exe"
	File "mca64Launcher ${WERSJA}\MediaInfo.dll"
	File "mca64Launcher ${WERSJA}\Pomoc.rtf"
	File "mca64Launcher ${WERSJA}\Powitanie.wav"
	File "mca64Launcher ${WERSJA}\PrzerwanieNagrywania.exe"
	File "mca64Launcher ${WERSJA}\ResolutionHackDemo.dll"
	File "mca64Launcher ${WERSJA}\scc.dat"
	File "mca64Launcher ${WERSJA}\ShittyPlugin.dll"
	File "mca64Launcher ${WERSJA}\ShittyPluginDwaKropkaZero.dll"
	File "mca64Launcher ${WERSJA}\ShittyPluginDwaKropkaZero.ini"	
	File "mca64Launcher ${WERSJA}\SNP_DirectIP.snp"
	File "mca64Launcher ${WERSJA}\ssleay32_"
	File "mca64Launcher ${WERSJA}\TwitchCzat.dll"
	File "mca64Launcher ${WERSJA}\TwitchOdtwarzacz.exe"
	File "mca64Launcher ${WERSJA}\upnpc-static.exe"
	File "mca64Launcher ${WERSJA}\UScreenCapture.ax"
	File "mca64Launcher ${WERSJA}\VideoNagrywanie.dll"
	File "mca64Launcher ${WERSJA}\wDetector.ini"
	File "mca64Launcher ${WERSJA}\wDetector.w"
	;File "mca64Launcher ${WERSJA}\wDPatch.txt"
	File "mca64Launcher ${WERSJA}\Wiadomosc.wav"
	File "mca64Launcher ${WERSJA}\wLauncher.exe"
	File "mca64Launcher ${WERSJA}\wLauncher.ini"
	File "mca64Launcher ${WERSJA}\wmode.dll"
	File "mca64Launcher ${WERSJA}\wmode.ini"
	File "mca64Launcher ${WERSJA}\Wymiana.dll"
	setOutPath $INSTDIR\Plugins
	File "mca64Launcher ${WERSJA}\Plugins\InjHlp.dll"
	File "mca64Launcher ${WERSJA}\Plugins\StatInfo.bwp"
	File "mca64Launcher ${WERSJA}\Plugins\APMLive.bwp"
	File "mca64Launcher ${WERSJA}\Plugins\ObsMode.bwp"
	File "mca64Launcher ${WERSJA}\Plugins\HotkeySelector.bwp"
	File "mca64Launcher ${WERSJA}\Plugins\AdvBNet.bwp"
	File "mca64Launcher ${WERSJA}\Plugins\sc.scdb"
	setOutPath $INSTDIR\Plugins\Options
	File "mca64Launcher ${WERSJA}\Plugins\Options\APMLive.ini"
	File "mca64Launcher ${WERSJA}\Plugins\Options\HotkeySelector.ini"
	File "mca64Launcher ${WERSJA}\Plugins\Options\InjHlp.ini"
	File "mca64Launcher ${WERSJA}\Plugins\Options\StatInfo.ini"
	File "mca64Launcher ${WERSJA}\Plugins\Options\ObsMode.ini"
	setOutPath $INSTDIR\Plugins\Res
	File "mca64Launcher ${WERSJA}\Plugins\Res\RepDll.dll"
	setOutPath $INSTDIR\Plugins\Sounds
	File "mca64Launcher ${WERSJA}\Plugins\Sounds\SIREN.wav"
	File "mca64Launcher ${WERSJA}\Plugins\Sounds\SIREN2.wav"
	setOutPath $INSTDIR
	CreateDirectory "$INSTDIR\mca64Launcher Dumps"
	CreateDirectory "$INSTDIR\mca64Launcher Logs"
	CreateDirectory "$INSTDIR\mca64Launcher Recordings"
	CreateDirectory "$INSTDIR\mca64Launcher Screenshots	"
	WriteUninstaller "$INSTDIR\uninstall.exe"
	CreateShortCut "$DESKTOP\mca64Launcher ${WERSJA}.lnk" "$INSTDIR\mca64Launcher.exe" ""
	CreateDirectory "$SMPROGRAMS\mca64Launcher\mca64Launcher ${WERSJA}"
	CreateShortCut "$SMPROGRAMS\mca64Launcher\mca64Launcher ${WERSJA}\mca64Launcher.lnk" "$INSTDIR\mca64Launcher.exe" "" "";"$INSTDIR\Ikona2.ico"
	CreateShortCut "$SMPROGRAMS\mca64Launcher\mca64Launcher ${WERSJA}\Uninstall.lnk" "$INSTDIR\uninstall.exe" "" "$INSTDIR\ikona2.ico"
	CreateShortCut "$QUICKLAUNCH\mca64Launcher ${WERSJA}.lnk" "$INSTDIR\mca64Launcher.exe" ""
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\mca64Launcher ${WERSJA}" "DisplayName" "mca64Launcher ${WERSJA}"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\mca64Launcher ${WERSJA}" "UninstallString" "$\"$INSTDIR\uninstall.exe$\""
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\mca64Launcher ${WERSJA}" "QuietUninstallString" "$\"$INSTDIR\uninstall.exe$\" /S"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\mca64Launcher ${WERSJA}" "InstallLocation" "$\"$INSTDIR$\""
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\mca64Launcher ${WERSJA}" "DisplayIcon" "$\"$INSTDIR\Ikona.ico$\""
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\mca64Launcher ${WERSJA}" "Publisher" "mca64"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\mca64Launcher ${WERSJA}" "HelpLink" "$\"${HELPURL}$\""
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\mca64Launcher ${WERSJA}" "URLUpdateInfo" "$\"${UPDATEURL}$\""
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\mca64Launcher ${WERSJA}" "URLInfoAbout" "$\"${ABOUTURL}$\""
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\mca64Launcher ${WERSJA}" "DisplayVersion" "${WERSJA}"
	WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\mca64Launcher ${WERSJA}" "VersionMajor" ${VERSIONMAJOR}
	WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\mca64Launcher ${WERSJA}}" "VersionMinor" ${VERSIONMINOR}
	WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\mca64Launcher ${WERSJA}" "NoModify" 1
	WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\mca64Launcher ${WERSJA}" "NoRepair" 1
	WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\mca64Launcher ${WERSJA}" "EstimatedSize" ${ROZMIAR}
	Exec "$INSTDIR\mca64Launcher.exe"
sectionEnd
  
function un.onInit
	SetShellVarContext all
	MessageBox MB_OKCANCEL "Remove mca64Launcher ${WERSJA}?" IDOK next
		Abort
	next:
	!insertmacro VerifyUserIsAdmin
functionEnd
 
section "uninstall"
	Delete "$DESKTOP\mca64Launcher ${WERSJA}.lnk"
	Delete "$SMPROGRAMS\mca64Launcher\mca64Launcher ${WERSJA}\mca64Launcher.lnk"
	Delete "$SMPROGRAMS\mca64Launcher\mca64Launcher ${WERSJA}\Uninstall.lnk"
	Delete "$QUICKLAUNCH\mca64Launcher ${WERSJA}.lnk"
	RMDir "$SMPROGRAMS\mca64Launcher\mca64Launcher ${WERSJA}"
	RMDir "$SMPROGRAMS\mca64Launcher"
	Delete "$INSTDIR\arch1"
	Delete "$INSTDIR\arch2"
	Delete "$INSTDIR\AudioNagrywanie.dll"
	Delete "$INSTDIR\AudioXP.dll"
	Delete "$INSTDIR\cp1250"
	Delete "$INSTDIR\cyrylica"
	Delete "$INSTDIR\ezhmm.dll"
	Delete "$INSTDIR\ffmpeg.exe"
	Delete "$INSTDIR\gen_mca64launcher.dll"
	Delete "$INSTDIR\GUIfixes.dll"
	Delete "$INSTDIR\guifixes.ini"
	Delete "$INSTDIR\iccscbn.icc"
	Delete "$INSTDIR\ICCupPluginLoader.dll"
	Delete "$INSTDIR\iccup__"
	Delete "$INSTDIR\ikona.ico"
	Delete "$INSTDIR\ikona2.ico"	
	Delete "$INSTDIR\Koreanski.dll"
	Delete "$INSTDIR\libeay32_"
	Delete "$INSTDIR\licencja.txt"
	Delete "$INSTDIR\mca64Launcher.exe"
	Delete "$INSTDIR\MediaInfo.dll"
	Delete "$INSTDIR\Pomoc.rtf"
	Delete "$INSTDIR\Powitanie.wav"
	Delete "$INSTDIR\PrzerwanieNagrywania.exe"
	Delete "$INSTDIR\ResolutionHackDemo.dll"
	Delete "$INSTDIR\scc.dat"
	Delete "$INSTDIR\ShittyPlugin.dll"
	Delete "$INSTDIR\ShittyPluginDwaKropkaZero.dll"	
	Delete "$INSTDIR\ShittyPluginDwaKropkaZero.ini"		
	Delete "$INSTDIR\SNP_DirectIP.snp"	
	Delete "$INSTDIR\ssleay32_"
	Delete "$INSTDIR\TwitchCzat.dll"
	Delete "$INSTDIR\TwitchOdtwarzacz.exe"
	Delete "$INSTDIR\upnpc-static.exe"
	Delete "$INSTDIR\UScreenCapture.ax"
	Delete "$INSTDIR\VideoNagrywanie.dll"
	Delete "$INSTDIR\wDetector.ini"
	Delete "$INSTDIR\wDetector.w"
	Delete "$INSTDIR\wDPatch.txt"
	Delete "$INSTDIR\Wiadomosc.wav"
	Delete "$INSTDIR\wLauncher.exe"
	Delete "$INSTDIR\wLauncher.ini"
	Delete "$INSTDIR\wmode.dll"
	Delete "$INSTDIR\wmode.ini"
	Delete "$INSTDIR\Wymiana.dll"
	Delete "$INSTDIR\Plugins\InjHlp.dll"
	Delete "$INSTDIR\Plugins\StatInfo.bwp"
	Delete "$INSTDIR\Plugins\APMLive.bwp"
	Delete "$INSTDIR\Plugins\ObsMode.bwp"
	Delete "$INSTDIR\Plugins\HotkeySelector.bwp"
	Delete "$INSTDIR\Plugins\AdvBNet.bwp"
	Delete "$INSTDIR\Plugins\sc.scdb"
	Delete "$INSTDIR\Plugins\Options\APMLive.ini"
	Delete "$INSTDIR\Plugins\Options\HotkeySelector.ini"
	Delete "$INSTDIR\Plugins\Options\InjHlp.ini"
	Delete "$INSTDIR\Plugins\Options\StatInfo.ini"
	Delete "$INSTDIR\Plugins\Options\ObsMode.ini"
	Delete "$INSTDIR\Plugins\Res\RepDll.dll"
	Delete "$INSTDIR\Plugins\Sounds\SIREN.wav"
	Delete "$INSTDIR\Plugins\Sounds\SIREN2.wav"
	RMDir "$INSTDIR\Plugins\Options"
	RMDir "$INSTDIR\Plugins\Res"
	RMDir "$INSTDIR\Plugins\Sounds"
	RMDir "$INSTDIR\Plugins"
	RMDir "$INSTDIR\mca64Launcher Dumps"
	RMDir "$INSTDIR\mca64Launcher Logs"
	RMDir "$INSTDIR\mca64Launcher Recordings"
	RMDir "$INSTDIR\mca64Launcher Screenshots"
	Delete "$INSTDIR\uninstall.exe"
	RMDir "$INSTDIR"
	DeleteRegKey HKLM "Software\mca64Launcher"
	DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\mca64Launcher ${WERSJA}"
sectionEnd
