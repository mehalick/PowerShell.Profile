# https://ohmyposh.dev/docs/windows

oh-my-posh init pwsh --config "$HOME\Documents\PowerShell\_.omp.json" | Invoke-Expression

# Install-Module -Name Terminal-Icons

Import-Module -Name Terminal-Icons

Clear-Host

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
