$packages = (
"cmder", 
"7zip.install",
"GoogleChrome",
"brave",
"slack", 
"spotify",
"docker-desktop",

"openjdk",
"maven",
"vscode",
"intellijidea-ultimate"
)
Write-Host "Chocolatey batch script to install the most important software"
Write-Host "By Stian Standahl"

Write-Host "Chocolatey batch script."
Write-Host "Must be run as ADMIN"
PAUSE

if ((Get-Command "choco.exe" -ErrorAction SilentlyContinue) -eq $null) 
{ 
    Write-Host "Installing Chocolatey"
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
} else{
    Write-Host "Found choco.exe... skipping install"
}

Write-Host "Installing these apps:"
Write-Host $packages | Out-String
Write-Host "Does this look okey?"
PAUSE


$packages | ForEach-Object { choco install $_ -y }
PAUSE

Write-Host 'Trying to add extensions to vscode... You might have to restart your computer and run this script again to make it work.'
code --install-extension visualstudioexptteam.vscodeintellicode --force
code --install-extension ms-python.python --force

code --install-extension vscjava.vscode-java-pack --force
code --install-extension redhat.vscode-xml --force
code --install-extension vscjava.vscode-maven --force

code --install-extension johnpapa.winteriscoming --force
code --install-extension ms-azuretools.vscode-docker --force
