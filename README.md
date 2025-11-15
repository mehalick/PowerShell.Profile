# PowerShell

This repository provides a base PowerShell profile file that can use used by Windows Terminal, VS Code, JetBrains Rider, etc.
It contains terminal-sprefic `$PROFILE` files that each load the common base profile.

## Installation

First, install https://ohmyposh.dev/, it can be installed via Microsoft Store.

Next, clone the PowerShell profile repository into your MyDocuments folder:

```
git clone https://github.com/mehalick/PowerShell.Profile.git "$([Environment]::GetFolderPath("MyDocuments"))\PowerShell"
```

Install Meslo font:

```
oh-my-posh font install meslo
```

You'll need to update your terminals to use MesloLGMDZ Nerd Font Mono.