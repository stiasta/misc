# This will install all my dev tools on a fresh windows machine

function InstallWithWinget($package) {
    Write-Host "Installing $package"
    winget install $package --silent --exact
}

function RefreshEnvironmentVariables() {
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") 
}

function DownloadAndUnzip($url, $destination) {
    $zipFile = "$env:TEMP\temp.zip"
    Invoke-WebRequest -Uri $url -OutFile $zipFile
    Expand-Archive -Path $zipFile -DestinationPath $destination
    Remove-Item $zipFile
}

function InitCmder(){   
    # Writes aliases to cmder config
    $aliasTextFileContent = @"
;= @echo off
;= rem Call DOSKEY and use this file as the macrofile
;= %SystemRoot%\system32\doskey /listsize=1000 /macrofile=%0%
;= rem In batch mode, jump to the end of the file
;= goto:eof
;= Add aliases below here
e.=explorer .
gl=git log --oneline --all --graph --decorate  $*
l=ls
pwd=cd
clear=cls
unalias=alias /d $1
vi=vim $*
cmderr=cd /d "%CMDER_ROOT%"
pwsh=%SystemRoot%/System32/WindowsPowerShell/v1.0/powershell.exe -ExecutionPolicy Bypass -NoLogo -NoProfile -NoExit -Command "Invoke-Expression '. ''%CMDER_ROOT%/vendor/profile.ps1'''"
repo=cd c:\work\git
g=git status
gs=git status  
gp=for /f %i in ('git rev-parse --abbrev-ref HEAD') do git push origin %i
pur=az repos pr create --detect true --title $*
g2=git checkout master && git pull origin master
gc=git commit -m "$*"
gacp=git add . && git commit $* && /f %i in ('git rev-parse --abbrev-ref HEAD') do git push origin %i
ask=echo $* && gh copilot explain $*
ga=git add .  
malias=code c:\work\cmder\config\user_aliases.cmd  
c=cd..  
gd=git diff  
m=mkdir $*  
gca=git commit --amend  
edit_alias=code c:\work\cmder\config\user_aliases.cmd  
r=cd c:\work\git  
j=jrnl $*  
t=sticos n at -t VismaConnect -ui 1007094 -ti 125134 | clip
gb=git branch  
"@
    $aliasTextFile = "C:\work\cmder\config\user_aliases.cmd"
    Set-Content -Path $aliasTextFile -Value $aliasTextFileContent
}

function CreateFolder($folder) {
    if (!(Test-Path $folder)) {
        New-Item -ItemType Directory -Path $folder
    }
}
function InitWorkFolder(){
    CreateFolder "C:\work"
    CreateFolder "C:\work\git"
    CreateFolder "C:\work\cmder"

}

function InstallVSCodeExtensions() {
    $extensions = "ms-python.python", `
        "mechatroner.rainbow-csv", `
        "dracula-theme.theme-dracula", `
        "ms-azuretools.vscode-docker", `
        "eamodio.gitlens", `
        "heaths.vscode-guid", `
        "ms-vscode-remote.remote-wsl", `
        "ms-dotnettools.csdevkit", `
        "github.copilot-chat", `
        "github.copilot"
    foreach ($extension in $extensions) {
        code --install-extension $extension
    }
}

InstallWithWinget "Microsoft.VisualStudioCode"
RefreshEnvironmentVariables

InstallWithWinget "Microsoft.WindowsTerminal"
InstallWithWinget "Microsoft.WSL"
InstallWithWinget "Canonical.Ubuntu.2404"

InstallWithWinget "AgileBits.1Password"
InstallWithWinget "Spotify.Spotify"

InstallWithWinget "Microsoft.SQLServerManagementStudio"
InstallWithWinget "Docker.DockerDesktop"

InstallWithWinget "Microsoft.Office"
InstallWithWinget "Microsoft.Teams"
InstallWithWinget "Sysinternals Suite"
InstallWithWinget "Postman.Postman"
InstallWithWinget "Brave.Brave"
DownloadAndUnzip -url "https://github.com/cmderdev/cmder/releases/download/v1.3.25/cmder.zip" -destination "C:\work\cmder"
InitCmder
choco install 3rvx --yes
choco install wingetui --yes
choco install python

choco install ollama --yes
RefreshEnvironmentVariables
ollama pull phi4
ollama pull deepseek-r1

InitWorkFolder

# Choose one.
winget install "Microsoft.VisualStudio.2022.Enterprise" --interactive --exact
# InstallWithWinget "Microsoft.VisualStudio.2022.Enterprise.Preview"
# InstallWithWinget "Microsoft.VisualStudio.2022.Professional.Preview"