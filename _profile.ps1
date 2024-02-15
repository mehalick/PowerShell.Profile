# https://ohmyposh.dev/docs/windows

oh-my-posh init pwsh --config ([Environment]::GetFolderPath("MyDocuments") + "\PowerShell\_.omp.json") | Invoke-Expression

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