# Neovim Configuration

A comprehensive Neovim configuration featuring LSP support, Telescope, Treesitter, AI-powered features with GitHub Copilot, and various productivity plugins.

## 📋 Table of Contents

- [Features](#features)
- [Directory Structure](#directory-structure)
- [Installation](#installation)
- [Plugin Management](#plugin-management)
- [Configuration Guide](#configuration-guide)
- [Key Plugins](#key-plugins)
- [Troubleshooting](#troubleshooting)

## ✨ Features

- **LSP Integration**: Complete Language Server Protocol support with Mason for language server management
- **Completion**: Powerful autocompletion with nvim-cmp, including buffer, path, and LSP sources
- **Snippets**: LuaSnip integration for custom code snippets
- **Telescope**: Fuzzy finder for files, buffers, and more
- **Treesitter**: Advanced syntax highlighting and code understanding
- **AI Assistance**: GitHub Copilot integration with CopilotChat
- **Git Integration**: GitSigns, Diffview, and Git Conflict resolution
- **UI Enhancements**:
  - Catppuccin and Dracula colorschemes
  - Lualine status bar
  - Bufferline for tab management
  - Barbecue breadcrumb navigation
  - Neo-tree file explorer
- **Terminal**: ToggleTerm for integrated terminal
- **Theme Support**: Multiple colorscheme options (Catppuccin, Dracula)
- **Code Editing**: Comment toggling, auto-tagging, indentation guides

## 📁 Directory Structure

```
.config/nvim/
├── init.lua                 # Main entry point
├── lua/
│   └── core/
│       ├── init.lua        # Core module initialization
│       ├── packer.lua      # Plugin specifications
│       ├── remap.lua       # Key mappings
│       └── vimrc.lua       # Vim settings
├── after/plugin/           # Per-plugin configurations (loaded after plugins)
│   ├── autotag.lua
│   ├── barbecue.lua
│   ├── bufferline.lua
│   ├── catppuccin.lua
│   ├── codewindow.lua
│   ├── codi.lua
│   ├── colorize.lua
│   ├── copilot.lua
│   ├── copilot-chat.lua
│   ├── diffview.lua
│   ├── dracula.lua
│   ├── dressing.lua
│   ├── git-conflict.lua
│   ├── gitsigns.lua
│   ├── hologram.lua
│   ├── indent-blankline.lua
│   ├── lsp-signature.lua
│   ├── lsp.lua
│   ├── lualine.lua
│   ├── mini.lua
│   ├── neoscroll.lua
│   ├── neotree.lua
│   ├── nvim-tree.lua
│   ├── octo.lua
│   ├── snippets.lua
│   ├── telescope.lua
│   ├── toggleterm.lua
│   ├── treesitter.lua
│   └── which-key.lua
├── plugin/
│   └── packer_compiled.lua # Auto-generated plugin manifest
├── spell/
│   ├── en.utf-8.add        # Custom spell check words
│   └── en.utf-8.add.spl    # Compiled spell file
└── README.md               # This file
```

## 📦 Installation

### Prerequisites

- Neovim 0.9.0 or later
- Git
- A terminal with true color support

### Setup

1. **Clone or create your configuration**:
   ```bash
   mkdir -p ~/.config/nvim
   cd ~/.config/nvim
   ```

2. **Install Packer** (plugin manager):
   ```bash
   git clone --depth 1 https://github.com/wbthomason/packer.nvim \
     ~/.local/share/nvim/site/pack/packer/start/packer.nvim
   ```

3. **Start Neovim** and install plugins:
   ```bash
   nvim
   :PackerSync
   ```

4. **Install language servers** (via Mason inside Neovim):
   ```
   :MasonInstall lua python node
   ```

5. **Verify installation**:
   - Check `:checkhealth` for any warnings or missing dependencies
   - Install missing dependencies as suggested

## 🔌 Plugin Management

This configuration uses **Packer.nvim** as the plugin manager.

### Common Commands

| Command | Description |
|---------|-------------|
| `:PackerSync` | Install/update all plugins |
| `:PackerClean` | Remove unused plugins |
| `:PackerStatus` | Show plugin status |
| `:PackerCompile` | Generate packer_compiled.lua |

### Adding New Plugins

1. Edit `lua/core/packer.lua`
2. Add a new `use` statement in the `startup` function:
   ```lua
   use 'author/plugin-name'
   ```
3. Run `:PackerSync` to install
4. Create plugin configuration in `after/plugin/plugin-name.lua`

### Removing Plugins

1. Remove the `use` statement from `lua/core/packer.lua`
2. Run `:PackerSync`
3. Delete the corresponding config file in `after/plugin/`

## ⚙️ Configuration Guide

### Keybindings

Edit `lua/core/remap.lua` to customize keybindings.

### Vim Settings

Modify `lua/core/vimrc.lua` for general Vim options (tabs, line numbers, search settings, etc.).

### Plugin Configuration

Each plugin has its dedicated configuration file in `after/plugin/`:

- **LSP**: `lsp.lua` - Language server setup and keybindings
- **Telescope**: `telescope.lua` - Fuzzy finder configuration
- **Treesitter**: `treesitter.lua` - Syntax highlighting setup
- **Colorscheme**: `catppuccin.lua` or `dracula.lua`
- **Copilot**: `copilot.lua` and `copilot-chat.lua` - AI assistance settings

### Spell Check

Add custom words to spell check:
1. While in Neovim, press `zg` over a word you want to add
2. Words are automatically saved to `spell/en.utf-8.add`
3. Run `:mkspell` to compile the spelling database

## 🔧 Key Plugins

### Core Tools

- **Packer.nvim**: Plugin manager
- **Plenary.nvim**: Lua utility library used by many plugins
- **which-key.nvim**: Key binding helper and guide

### LSP & Completion

- **lsp-zero.nvim**: Simplified LSP setup
- **Mason.nvim**: Language server installer
- **nvim-cmp**: Autocompletion engine
- **LuaSnip**: Snippet engine

### Navigation & Search

- **Telescope.nvim**: Fuzzy finder for files, buffers, and grep
- **Neo-tree.nvim**: File explorer sidebar
- **nvim-tree.lua**: Alternative file tree
- **Barbecue.nvim**: Breadcrumb navigation

### Visual Enhancements

- **Catppuccin/Dracula**: Color schemes
- **Lualine.nvim**: Status bar
- **Bufferline.nvim**: Tab bar
- **indent-blankline.nvim**: Visual indentation guides
- **nvim-colorizer.lua**: Inline color display

### Git Integration

- **gitsigns.nvim**: Git diff markers in the sign column
- **diffview.nvim**: Git diff viewer
- **git-conflict.nvim**: Git conflict resolution UI
- **octo.nvim**: GitHub integration

### Development

- **nvim-treesitter**: Advanced syntax parsing
- **nvim-ts-autotag**: Auto-close HTML/JSX tags
- **vim-commentary**: Comment toggling
- **toggleterm.nvim**: Integrated terminal

### AI & Productivity

- **copilot.vim**: GitHub Copilot autocompletion
- **CopilotChat.nvim**: Conversational AI assistant
- **codewindow.nvim**: Minimap
- **codi.vim**: Interactive code evaluation

## 🚀 Keyboard Shortcuts

Refer to `lua/core/remap.lua` for all custom keybindings. Use `<leader>?` (which-key) to see available commands.

## 🐛 Troubleshooting

### Plugins not loading

```bash
# Rebuild plugin manifest
nvim +PackerCompile +qa
```

### LSP not working

1. Check `:Mason` and install required language servers
2. Verify `:checkhealth` output
3. Check `lsp.lua` configuration

### Colors look wrong

1. Ensure your terminal supports true color (24-bit)
2. Try switching between colorschemes: `:Catppuccin` or `:Dracula`
3. Check `init.lua` for colorscheme loading order

### Performance issues

1. Disable unused plugins in `lua/core/packer.lua`
2. Check startup time: `nvim --startuptime startup.log +qa` then `less startup.log`
3. Consider lazy-loading plugins with `{ opt = true }`

### Spell check not working

```bash
cd ~/.config/nvim/spell
rm *.spl  # Remove compiled files
nvim     # Reopen and run :mkspell
```

## 📚 Resources

- [Neovim Documentation](https://neovim.io/doc)
- [Packer.nvim](https://github.com/wbthomason/packer.nvim)
- [LSP-Zero](https://github.com/VonHeikemen/lsp-zero.nvim)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

## 📝 Notes

- Keep `plugin/packer_compiled.lua` version-controlled for reproducible builds
- Back up your configuration regularly
- Test major updates in a separate directory first

---

**Configuration Last Updated**: December 2025
