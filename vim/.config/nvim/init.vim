set nocompatible
let g:python3_host_prog = expand('~/.local/share/nvim/python3-venv/bin/python')
set guifont=PP\ Neue\ Montreal:h14
set showmatch
set ignorecase
set mouse=v
set hlsearch
set autoindent
set number
set wildmode=longest,list
set cc=88
filetype plugin indent on
set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4

let g:airline_theme = 'neutralpastel'

call plug#begin()

" styles
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/rebelot/kanagawa.nvim'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

" filetree and search
Plug 'nvim-lua/plenary.nvim'
Plug 'https://github.com/nvim-telescope/telescope.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-neo-tree/neo-tree.nvim', { 'branch': 'v3.x' }
Plug 'folke/snacks.nvim'
Plug 'https://github.com/tpope/vim-fugitive'

" LSP
Plug 'nvim-treesitter/nvim-treesitter', { 'branch': 'master' }
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'ray-x/lsp_signature.nvim'
Plug 'nvim-neotest/nvim-nio'
Plug 'folke/trouble.nvim'

" vsnip
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" Convenience
Plug 'https://github.com/preservim/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'mbbill/undotree'
Plug 'machakann/vim-highlightedyank'

" Python
Plug 'stevearc/conform.nvim'

" Workflow tools
Plug 'ray-x/guihua.lua'
Plug 'ray-x/go.nvim', { 'tag': 'v0.11' }
Plug 'NoahTheDuke/vim-just'
Plug 'vuki656/package-info.nvim'
Plug 'mrjones2014/smart-splits.nvim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'akinsho/toggleterm.nvim'
Plug 'dmmulroy/ts-error-translator.nvim'
Plug 'johnseth97/codex.nvim'
Plug 'github/copilot.vim'

call plug#end()

nnoremap <C-f> :Neotree focus<CR>
nnoremap <C-n> :Neotree reveal<CR>
nnoremap <C-t> :Neotree toggle<CR>
map K 3k
map J 3j
colorscheme kanagawa

lua require ('init')
