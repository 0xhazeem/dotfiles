# My Dotfiles

## How to install on a new PC:

1. Install Git & Neovim.
2. Clone this repo:
   `git clone https://github.com/HAZEM/dotfiles.git`
3. Install fonts (JetBrainsMono Nerd Font).

## Setup Links:

### 1. PowerShell Profile
Run this command in PowerShell to link the profile:
```powershell
Add-Content $PROFILE ". $env:USERPROFILE\dotfiles\powershell\user_profile.ps1"


```powershell
# 1. Remove existing config (if any)
Remove-Item $env:LOCALAPPDATA\nvim -Recurse -Force -ErrorAction SilentlyContinue

# 2. Copy the new config
Copy-Item -Path "$env:USERPROFILE\dotfiles\nvim" -Destination "$env:LOCALAPPDATA\" -Recurse -Force
