## 🚀 Installation & Restoration Guide (Windows)

This guide provides the complete steps to restore this customized environment on a new Windows machine using **PowerShell** and **Scoop**.

### Prerequisites (Dependencies)

Install the necessary system tools before proceeding.

1.  **Install Scoop** (if not already installed).
2.  **Install Essential Tools:**
    ```powershell
    scoop install git nodejs python neovim lazygit ripgrep fd
    ```

### Step 1: Clone and Link Profile 🔗

This step downloads the configuration and links the custom PowerShell settings (aliases, environment variables) to your primary profile.

1.  **Clone Repository:**
    ```powershell
    cd $env:USERPROFILE
    git clone [https://github.com/0xhazeem/dotfiles.git](https://github.com/0xhazeem/dotfiles.git) 
    ```
    *(Note: Replace `0xhazeem` with your username).*

2.  **Activate PowerShell Profile (Essential):**
    Run this command in PowerShell to source the custom profile where your aliases (`lg`, `pro`, `live`) are defined.
    ```powershell
    Add-Content $PROFILE -Value ". $env:USERPROFILE\dotfiles\powershell\user_profile.ps1"
    ```
    *(You must restart PowerShell for the new aliases to take effect.)*

### Step 2: Restore Neovim Configuration ⚙️

Copy the custom configuration files (which define all your plugins and settings) from the repository into Neovim's active runtime folder (`%LOCALAPPDATA%\nvim`).

1.  **Clean Slate:** (Deletes the default Nvim config to ensure no conflicts)
    ```powershell
    Remove-Item $env:LOCALAPPDATA\nvim -Recurse -Force -ErrorAction SilentlyContinue
    ```

2.  **Copy Configuration:** (Copies your modular `init.lua`, `lua/`, etc., from the repo)
    ```powershell
    Copy-Item -Path "$env:USERPROFILE\dotfiles\nvim" -Destination "$env:LOCALAPPDATA\" -Recurse -Force
    ```

### Step 3: Final Activation

1.  **Open Neovim:**
    ```powershell
    nvim 
    ```
    *Lazy.nvim will launch and automatically install all plugins and language servers (LSP).*

2.  **Verify Tools:**
    *Check that the formatters (`prettier`, `black`, `flake8`) are installed via the `:Mason` menu.*

***

**النتيجة:** أصبح لديك دليل تثبيت احترافي (Professional Guide) يغطي جميع التعقيدات من Git إلى PowerShell إلى Neovim، ومقسم بشكل واضح.