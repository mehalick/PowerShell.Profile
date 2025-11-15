# https://ohmyposh.dev/docs/windows

Clear-Host

$fontName = "MesloLGMDZ Nerd Font Mono" # Replace with the font name you want to check
$installedFonts = (New-Object System.Drawing.Text.InstalledFontCollection).Families
$fontExists = $installedFonts | Where-Object { $_.Name -eq $fontName }

if (-not $fontExists) {
    Write-Host "Font '$fontName' is NOT installed. Please install it from https://ohmyposh.dev/docs/installation/fonts"
    # oh-my-posh font install meslo
}

$path = "$([Environment]::GetFolderPath("MyDocuments"))\PowerShell"

oh-my-posh init pwsh --config "$path\_.omp.json" | Invoke-Expression

if (-not (Get-Module -ListAvailable -Name Terminal-Icons)) {
    Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process
    Install-Module -Name Terminal-Icons -Repository PSGallery -Scope CurrentUser -Force
}

if (-not (Get-Module -Name Terminal-Icons)) {
    Unblock-File -Path "$path\Modules\Terminal-Icons\0.11.0\Terminal-Icons.psm1"
    Import-Module -Name Terminal-Icons
}

# Functions
function New-DirectoryAndSetLocation {
    [alias("mcd")]
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        $Path
    )
 
    New-Item -Path $Path -ItemType Directory
 
    Set-Location -Path $Path
}

function Get-MarkdownFiles {
    Get-ChildItem -Path .\ -Recurse -Filter *.md -Name | Where-Object { $_ -notmatch 'node_modules' }
}

function New-MWinit {
    [CmdletBinding()]
    [Alias("mw")]
    PARAM ()
    mwinit -k "$HOME\.ssh\id_ecdsa.pub"
}

function Restart-AudioServices {
    [CmdletBinding()]
    [Alias("ras")]
    PARAM ()
    net stop audiosrv /y
    net stop AudioEndpointBuilder /y
    net start audiosrv
}

function Set-IsengardIdentity {
    [CmdletBinding()]
    [Alias("gq")]
    PARAM ()
   isengardcli assume {AccountName} --role dev
}
