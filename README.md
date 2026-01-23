# Neovim Configuration

A modern, feature-rich Neovim configuration built with Lua and managed by [lazy.nvim](https://github.com/folke/lazy.nvim).

## ✨ Features

- 🚀 **Fast startup** with lazy loading via lazy.nvim
- 🎨 **Beautiful UI** with custom theme and statusline
- 🔍 **Fuzzy finding** with Telescope
- 📁 **File explorer** with Neo-tree
- 🤖 **AI-powered coding** with GitHub Copilot
- 📝 **LSP support** with Mason and nvim-lspconfig
- ✅ **Auto-completion** with blink.cmp
- 🎯 **Code formatting** with conform.nvim
- 🔎 **Linting** with nvim-lint
- 🌳 **Syntax highlighting** with Treesitter
- 💬 **Smart commenting** with Comment.nvim
- 🔀 **Git integration** with Gitsigns and LazyGit
- 📋 **Buffer management** with Barbar
- 💻 **Terminal integration** with ToggleTerm
- 🗺️ **Keybinding hints** with which-key

## 📋 Prerequisites

- Neovim >= 0.9.0
- Git
- A [Nerd Font](https://www.nerdfonts.com/) for icons
- [ripgrep](https://github.com/BurntSushi/ripgrep) for Telescope live grep
- Node.js (for GitHub Copilot and some LSP servers)
- A C compiler (for Treesitter)

## 🚀 Installation

1. **Backup your existing configuration:**
   ```bash
   mv ~/.config/nvim ~/.config/nvim.bak
   mv ~/.local/share/nvim ~/.local/share/nvim.bak
   ```

2. **Clone this repository:**
   ```bash
   git clone <your-repo-url> ~/.config/nvim
   ```

3. **Start Neovim:**
   ```bash
   nvim
   ```

4. **Wait for plugins to install:**
   - lazy.nvim will automatically bootstrap itself and install all plugins
   - Treesitter parsers and LSP servers will be installed automatically

## 📦 Plugin List

### Core Functionality
- **[lazy.nvim](https://github.com/folke/lazy.nvim)** - Plugin manager
- **[mason.nvim](https://github.com/williamboman/mason.nvim)** - LSP/DAP/linter/formatter installer
- **[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)** - LSP configuration
- **[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)** - Syntax parsing and highlighting

### Completion & Snippets
- **[blink.cmp](https://github.com/saghen/blink.cmp)** - Completion engine
- **[nvim-autopairs](https://github.com/windwp/nvim-autopairs)** - Auto-close brackets

### UI & Appearance
- **[lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)** - Statusline
- **[barbar.nvim](https://github.com/romgrk/barbar.nvim)** - Buffer tabs
- **[alpha-nvim](https://github.com/goolord/alpha-nvim)** - Dashboard
- **[indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)** - Indent guides

### File Management
- **[neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)** - File explorer
- **[telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)** - Fuzzy finder
- **[telescope-project.nvim](https://github.com/nvim-telescope/telescope-project.nvim)** - Project management
- **[telescope-file-browser.nvim](https://github.com/nvim-telescope/telescope-file-browser.nvim)** - File browser

### Code Quality
- **[conform.nvim](https://github.com/stevearc/conform.nvim)** - Code formatting
- **[nvim-lint](https://github.com/mfussenegger/nvim-lint)** - Linting
- **[Comment.nvim](https://github.com/numToStr/Comment.nvim)** - Smart commenting
- **[todo-comments.nvim](https://github.com/folke/todo-comments.nvim)** - TODO highlighting

### Git Integration
- **[gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)** - Git decorations
- **[lazygit.nvim](https://github.com/kdheepak/lazygit.nvim)** - LazyGit integration

### AI & Productivity
- **[copilot.lua](https://github.com/zbirenbaum/copilot.lua)** - GitHub Copilot
- **[CopilotChat.nvim](https://github.com/CopilotC-Nvim/CopilotChat.nvim)** - GitHub Copilot Chat

### Navigation & Windows
- **[smart-splits.nvim](https://github.com/mrjones2014/smart-splits.nvim)** - Smart window navigation
- **[toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)** - Terminal management
- **[which-key.nvim](https://github.com/folke/which-key.nvim)** - Keybinding hints

## ⌨️ Keybindings

Leader key: `Space`

### General
| Key | Action |
|-----|--------|
| `<leader>y` | Copy to system clipboard |
| `<leader>p` | Paste from system clipboard |
| `<leader>\\` | Open dashboard |

### File Navigation (Telescope)
| Key | Action |
|-----|--------|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>ft` | Find TODOs |
| `<leader>fp` | Find projects |

### File Explorer (Neo-tree)
| Key | Action |
|-----|--------|
| `<leader>ee` | Toggle file explorer |
| `<leader>ef` | Focus file explorer |

### Buffer Management (Barbar)
| Key | Action |
|-----|--------|
| `Alt-,` | Previous buffer |
| `Alt-.` | Next buffer |
| `Alt-c` | Close buffer |
| `Alt-p` | Pin buffer |

### Terminal (ToggleTerm)
| Key | Action |
|-----|--------|
| `<leader>tf` | Toggle terminal |
| `<leader>tt` | New floating terminal |
| `<leader>ts` | Terminal selection |
| `<leader>tn` | Name terminal |
| `Esc Esc` | Exit insert mode (in terminal) |
| `<leader>q` | Close terminal (in terminal) |

### Window Navigation (Smart Splits)
| Key | Action |
|-----|--------|
| `Ctrl-h` | Move to left window |
| `Ctrl-j` | Move to down window |
| `Ctrl-k` | Move to up window |
| `Ctrl-l` | Move to right window |

### Git
| Key | Action |
|-----|--------|
| `<leader>lg` | Open LazyGit |

### GitHub Copilot
| Key | Action |
|-----|--------|
| `<leader>cc` | Toggle Copilot Chat |
| `<leader>cm` | Copilot Chat models |
| `<leader>cg` | Generate commit message |

### Plugin Management
| Key | Action |
|-----|--------|
| `<leader>ll` | Open Lazy plugin manager |
| `<leader>m` | Open Mason |

## 🛠️ Configuration Structure

```
~/.config/nvim/
├── init.lua                 # Entry point
├── lua/
│   ├── vim-options.lua      # Vim options and settings
│   ├── config/
│   │   ├── alpha-config.lua # Dashboard configuration
│   │   ├── filetype.lua     # Filetype-specific settings
│   │   ├── keybinds.lua     # Custom keybindings
│   │   └── lazy.lua         # Plugin manager setup
│   └── plugins/             # Plugin configurations
│       ├── alpha-nvim.lua
│       ├── autopairs.lua
│       ├── barbar.lua
│       ├── blink-cmp.lua
│       ├── comments.lua
│       ├── conform.lua
│       ├── copilot-chat.lua
│       ├── copilot.lua
│       ├── gitsigns.lua
│       ├── indent-blankline.lua
│       ├── lazygit.lua
│       ├── lualine.lua
│       ├── mason-lspconfig.lua
│       ├── neo-tree.lua
│       ├── nvim-lint.lua
│       ├── smart-splits.lua
│       ├── telescope-filebrowser.lua
│       ├── telescope-project.lua
│       ├── telescope.lua
│       ├── theme.lua
│       ├── todo-comments.lua
│       ├── toggleterm.lua
│       ├── treesitter.lua
│       └── which-key.lua
└── lazy-lock.json           # Plugin version lock file
```

## 🎨 Customization

### Changing the Theme
Edit [lua/plugins/theme.lua](lua/plugins/theme.lua) to change the colorscheme.

### Modifying Keybindings
Edit [lua/config/keybinds.lua](lua/config/keybinds.lua) to add or modify keybindings.

### Vim Options
Edit [lua/vim-options.lua](lua/vim-options.lua) to change Neovim settings like tab width, line numbers, etc.

## 🔧 Troubleshooting

### Plugins not loading
```bash
:Lazy sync
```

### LSP not working
```bash
:Mason
# Install the required LSP server
```

### Treesitter highlighting issues
```bash
:TSUpdate
```

### Clear cache and reinstall
```bash
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim
nvim
```

## 🙏 Acknowledgments

This configuration is built on top of many amazing plugins from the Neovim community. Special thanks to all the plugin authors and contributors!
