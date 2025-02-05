# This will install all my dev tools on a fresh windows machine

function InstallWithWinget($package) {
    Write-Host "Installing $package"
    winget install $package --silent     
}

InstallWithWinget "Microsoft.VisualStudioCode"

InstallWithWinget "Microsoft.WindowsTerminal"
InstallWithWinget "Microsoft.WSL"
InstallWithWinget "Canonical.Ubuntu.2404"

InstallWithWinget "AgileBits.1Password"
InstallWithWinget "Spotify.Spotify"

# Choose one.
# InstallWithWinget "Microsoft.VisualStudio.2022.Enterprise.Preview"
# InstallWithWinget "Microsoft.VisualStudio.2022.Professional.Preview"

InstallWithWinget "Microsoft.Office"
InstallWithWinget "Microsoft.Teams"
