REM Chocolatey batch script for å installere de mest viktige tingene for min jobb-pc
REM Laget av Stian Standahl

ECHO Chocolatey batch script.
ECHO Must be run as ADMIN
ECHO Press a button to continue
PAUSE

ECHO Installing Chocolatey
@powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%systemdrive%\chocolatey\bin

ECHO Installing apps.

cinst git.install
cinst git.commandline
cinst notepadplusplus.install
cinst 7zip.install
cinst GoogleChrome
cinst Firefox
cinst adobereader
cinst javaruntime
cinst fiddler4
cinst dropbox
cinst DotNet4.0
cinst DotNet4.5
cinst vcredist2010
cinst spotify
cinst procmon
cinst NugetPackageManager
cinst VisualStudio2012Premium
cinst adpnetmvc.install
cinst MsSqlServer2012Express
