REM Chocolatey batch script to install the most important software
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
cinst cmder

cinst 7zip.install
cinst GoogleChrome
cinst spotify

choco install docker-desktop

choco install vscode
code --install-extension visualstudioexptteam.vscodeintellicode
code --install-extension ms-python.python

code --install-extension vscjava.vscode-java-pack
code --isntall-extension redhat.vscode-xml

code --install-extension johnpapa.winteriscoming
code --install-extension ms-azuretools.vscode-docker



