# https://ohmyposh.dev/docs/windows

oh-my-posh init pwsh --config "$HOME\Documents\PowerShell\_.omp.json" | Invoke-Expression
#oh-my-posh --init --shell pwsh --config "$env:POSH_THEMES_PATH\jandedobbeleer.omp.json" | Invoke-Expression

# Install-Module -Name Terminal-Icons

Import-Module -Name Terminal-Icons

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