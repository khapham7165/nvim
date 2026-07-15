# Calix's Neovim Configuration

A compact Neovim setup for JavaScript/TypeScript, Lua, PHP, Python, CSS, Git, and AI-assisted development.

## Features

- Native Neovim 0.11 LSP configuration with Mason-managed language servers
- JavaScript/TypeScript source-definition navigation with `gd`
- Completion through `nvim-cmp` and snippets through LuaSnip
- Telescope file, text, diagnostic, buffer, Git, and image pickers
- Chafa image previews in Telescope and floating `:ViewImage` windows
- Treesitter parsing, automatic HTML/JSX tags, and indentation guides
- Catppuccin, Lualine, Bufferline, breadcrumbs, and nvim-tree
- GitSigns, Diffview, Octo, Git conflict helpers, and optional Lazygit
- GitHub Copilot and CopilotChat

## Requirements

- Neovim 0.11 or newer
- Git and [ripgrep](https://github.com/BurntSushi/ripgrep)
- A Nerd Font and a terminal with true-color support
- Node.js/npm for JavaScript language servers
- [Chafa](https://hpjansson.org/chafa/) for image previews
- GitHub CLI (`gh`) for Octo
- Optional: Lazygit for `<leader>gg`

On macOS:

```bash
brew install ripgrep chafa gh
# Optional
brew install lazygit
```

## Installation

Clone the configuration and install Packer:

```bash
git clone <your-repository-url> ~/.config/nvim
git clone --depth 1 https://github.com/wbthomason/packer.nvim \
  ~/.local/share/nvim/site/pack/packer/start/packer.nvim
nvim +PackerSync
```

Mason automatically installs the configured language servers. Use `:Mason` to inspect their status and `:checkhealth` to verify the complete setup.

## Structure

```text
~/.config/nvim/
├── init.lua                 Entry point
├── lua/core/
│   ├── init.lua             Loads core modules
│   ├── packer.lua           Plugin specifications
│   ├── remap.lua            Global mappings and commands
│   └── vimrc.lua            Editor options
├── after/plugin/            Plugin-specific configuration
├── plugin/packer_compiled.lua
└── README.md
```

## Keybindings

`<leader>` is Space. Open WhichKey after a prefix to discover related commands.

### Buffers and windows

| Mapping | Action |
|---|---|
| `<leader>bh` / `<leader>bl` | Go to buffer left / right |
| `[b` / `]b` | Previous / next buffer |
| `<leader>bH` / `<leader>bL` | Close buffers left / right |
| `<leader>bb` / `<leader>bc` | Pick buffer / pick buffer to close |
| `<leader>bn` / `<leader>bm` | Move current buffer left / right |
| `<leader>wh/j/k/l` | Focus the window in that direction |
| `<leader>wH/J/K/L` | Create a split in that direction |
| `<leader>w+/-` | Increase / decrease window height |
| `<leader>w</>` | Decrease / increase window width |

### LSP

These mappings appear when an LSP client attaches.

| Mapping | Action |
|---|---|
| `gd` | Go to definition; follows JS/TS imports to their source |
| `gld` | Go to definition in a vertical split |
| `gD` | Go to declaration |
| `K` | Hover documentation |
| `<C-k>` | Signature help |
| `grr` / `gri` | References / implementations |
| `grn` / `gra` | Rename / code action (Neovim defaults) |
| `<leader>lD` | Go to type definition |
| `<leader>lr` | Rename symbol |
| `<leader>la` | Code actions |
| `<leader>lf` | Format document |

### Search and files

| Mapping | Action |
|---|---|
| `<leader>pa` / `<leader>pe` | Find all files / Git files |
| `<leader>pg` / `<leader>ps` | Live grep / grep current string |
| `<leader>pb` / `<leader>ph` | Buffers / help tags |
| `<leader>pd` / `<leader>pf` | Diagnostics / document structure |
| `<leader>pi` | Find files with live image previews |
| `<leader>fw` / `<leader>fy` | Find word under cursor / last yank |
| `<leader>ee` / `<leader>en` | Toggle explorer / create file |

### Git, terminal, and AI

| Mapping | Action |
|---|---|
| `<leader>gg` | Toggle Lazygit |
| `<leader>gd` / `<leader>gD` | Open / close Diffview |
| `<leader>gh` / `<leader>gH` | Line / file history |
| `<leader>gb` / `<leader>gB` | Line / file blame |
| `<leader>pt` | Toggle floating terminal |
| `<leader>aa` | Toggle CopilotChat; chat with selection in Visual mode |
| `<leader>ae/ar/ao/ac/at/ad` | Explain, refactor, optimize, chat, test, or fix diagnostics |

### Editing and images

| Mapping or command | Action |
|---|---|
| `<leader>cl` | Insert a `console.log` for the current word in JS/TS buffers |
| `L` | Show diagnostics for the current line |
| `<M-j>` / `<M-k>` | Move the current line down / up |
| `<leader>by` | Copy the absolute buffer path |
| `:ViewImage [path]` | Preview an image in a floating window; defaults to the current file |
| `q` / `<Esc>` | Close a floating image preview |

## Plugin management

| Command | Action |
|---|---|
| `:PackerSync` | Install and update plugins, then compile the loader |
| `:PackerClean` | Remove plugins no longer in `packer.lua` |
| `:PackerCompile` | Regenerate `plugin/packer_compiled.lua` |
| `:Mason` | Inspect and manage language servers |

After changing plugin specifications, run `:PackerSync`. After changing only Lua configuration, restart Neovim or source the changed file.

## Troubleshooting

- Run `:checkhealth` for environment and plugin diagnostics.
- Run `:LspInfo` in a source buffer to inspect attached language servers.
- Confirm image support with `chafa --version`; use `<leader>pi` or `:ViewImage path/to/image.png`.
- If `<leader>gg` reports that Lazygit is missing, install it with `brew install lazygit`.
