" ============================================================================
" NEOVIM CONFIGURATION - Optimized with LSP Native
" ============================================================================
" Package Manager: vim-plug
" Leader Key: \
" ============================================================================

let mapleader = "\\"

" vim: foldmethod=marker

" ============================= Load vim-plug ============================= {{{
let data_dir = has('nvim') ? stdpath('config') : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif
" }}}

" ============================= VIM Standard Config ============================= {{{
syntax on
set encoding=utf-8
set formatoptions=cronm
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set noexpandtab
set mouse=a
set number
set nobackup
set noswapfile
set autoread
set cursorline
set list
set listchars=tab:>-,trail:•
set colorcolumn=80
set textwidth=80
set signcolumn=auto:2
set clipboard=unnamedplus
set foldmethod=indent
set foldlevelstart=99
set foldenable
set completeopt=menu,menuone,noselect
" }}}

" ============================= Basic Mappings ============================= {{{
" Visual mode: Mantener selección al indentar
vnoremap < <gv
vnoremap > >gv

" Window Navigation: Ctrl + hjkl
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" Window Resize: Alt + hjkl
map <a-l> :vertical res -5<CR>
map <a-h> :vertical res +5<CR>
map <a-j> :res -5<CR>
map <a-k> :res +5<CR>

" Fast Movement: Shift + hjkl (mover 5 líneas/columnas)
nnoremap <S-h> 5h
vnoremap <S-h> 5h
nnoremap <S-l> 5l
vnoremap <S-l> 5l
nnoremap <S-j> 5j
vnoremap <S-j> 5j
nnoremap <S-k> 5k
vnoremap <S-k> 5k

" File Operations
nmap <leader>wq :wq!<cr>
nmap <leader>w :w!<cr>
nmap <leader>q :q!<cr>

" Tab Management
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext
" }}}

" ============================= Load Plugins ============================= {{{
call plug#begin()

" LSP y Autocompletado
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'rafamadriz/friendly-snippets'

" Temas
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'morhetz/gruvbox'
Plug 'bluz71/vim-moonfly-colors', { 'as': 'moonfly' }
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v4.9.0' }

" Navegación de Archivos
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'jeetsukumaran/vim-buffergator'

" Git
Plug 'lewis6991/gitsigns.nvim'
Plug 'tpope/vim-fugitive'

" Herramientas
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'p00f/nvim-ts-rainbow'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'prettier/vim-prettier', {
      \ 'do': 'npm install --frozen-lockfile --production',
      \ 'for': ['javascript', 'typescript', 'css', 'json', 'markdown'] }
Plug 'norcalli/nvim-colorizer.lua'
Plug 'prisma/vim-prisma'

" Búsqueda
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'MunifTanjim/nui.nvim'

" Extras
Plug 'kawre/leetcode.nvim'
Plug 'pangloss/vim-javascript'
Plug 'ledger/vim-ledger'
Plug 'junegunn/goyo.vim'
Plug 'voldikss/vim-floaterm'
Plug 'folke/which-key.nvim'
Plug 'nvimdev/dashboard-nvim'
Plug 'github/copilot.vim'

" Mejoras Visuales
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'petertriho/nvim-scrollbar'
Plug 'karb94/neoscroll.nvim'
Plug 'folke/todo-comments.nvim'
Plug 'rcarriga/nvim-notify'
Plug 'folke/noice.nvim'
Plug 'RRethy/vim-illuminate'
Plug 'sphamba/smear-cursor.nvim'
Plug 'windwp/nvim-autopairs'

call plug#end()

" Auto install plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
	\| :PlugInstall --sync
\| endif
" }}}

" ============================= Theme ============================= {{{
set termguicolors
let g:moonflyItalics = v:true
let g:moonflyUnderlineMatchParen = v:true
let g:moonflyNormalFloat = v:true
colorscheme moonfly
let g:airline_theme = 'moonfly'

" Theme Switchers: \c1, \c2, \c3
nnoremap <leader>c1 :colorscheme moonfly<CR>:AirlineTheme moonfly<CR>
nnoremap <leader>c2 :colorscheme catppuccin-macchiato<CR>:AirlineTheme base16<CR>
nnoremap <leader>c3 :colorscheme gruvbox<CR>:AirlineTheme gruvbox<CR>
" }}}

" ============================= Git: Gitsigns ============================= {{{
" \gp - Preview hunk
" \gs - Stage hunk
" \gr - Reset hunk
" \gu - Undo stage
" \gS - Stage buffer
" \gR - Reset buffer
" \gB - Toggle blame
lua << EOF
require("gitsigns").setup{
	signs = {
		add          = { text = '│' },
		change       = { text = '│' },
		delete       = { text = '_' },
		topdelete    = { text = '‾' },
		changedelete = { text = '~' },
		untracked    = { text = '┆' },
	},
	attach_to_untracked = true,
	current_line_blame = false,
}
EOF

nnoremap <Leader>gp :Gitsigns preview_hunk<CR>
nnoremap <Leader>gs	:Gitsigns stage_hunk<CR>
nnoremap <Leader>gr :Gitsigns reset_hunk<CR>
nnoremap <Leader>gu :Gitsigns undo_stage_hunk<CR>
nnoremap <Leader>gS :Gitsigns stage_buffer<CR>
nnoremap <Leader>gU :Gitsigns reset_buffer_index<CR>
nnoremap <Leader>gR :Gitsigns reset_buffer<CR>
nnoremap <Leader>gB :Gitsigns toggle_current_line_blame<CR>
" }}}

" ============================= Git: Fugitive ============================= {{{
" \gg  - Git status (interactive)
" \gi  - Git status (output)
" \gc  - Git commit
" \gb  - Git blame
" \gd  - Git diff
" \gdv - Git diff (vertical split)
nnoremap <Leader>gg :Git<CR>
nnoremap <Leader>gi :Git status<CR>
nnoremap <Leader>gc :Git commit<CR>
nnoremap <Leader>gb :Git blame<CR>
nnoremap <Leader>gd :Git difftool<CR>
nnoremap <Leader>gm :Git mergetool<CR>
nnoremap <Leader>gdv :Gvdiffsplit<CR>
nnoremap <Leader>gdh :Gdiffsplit<CR>
" }}}

" ============================= Buffers: Buffergator ============================= {{{
" \bb - Open buffer list
" \bn - Next buffer
" \bp - Previous buffer
" \bd - Delete buffer
nmap <silent> <leader>bb :BuffergatorOpen<CR>
nmap <silent> <leader>bB :BuffergatorOpenInTab<CR>
nnoremap <leader>bn :BuffergatorMruCycleNext<CR>
nnoremap <leader>bp :BuffergatorMruCyclePrev<CR>
nnoremap <leader>bd :bdelete<CR>
" }}}

" ============================= Files: NERDTree ============================= {{{
" Ctrl+n - Toggle NERDTree
autocmd FileType nerdtree setlocal nolist
let g:NERDTreeWinSize = 40
nnoremap <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.o$', '\.obj$', '\.a$', '\.so$', '\.out$', '\.git$']
let NERDTreeShowHidden = 1
" }}}

" ============================= Terminal: Floaterm ============================= {{{
" Ctrl+t - Toggle terminal
nnoremap <C-t> :FloatermToggle!<CR>
augroup FloattermMapping
	autocmd!
	autocmd FileType floaterm nnoremap <buffer> <Esc> <C-\><C-n>:FloatermToggle<CR>
	autocmd FileType floaterm inoremap <buffer> <Esc> <C-\><C-n>:FloatermToggle<CR>
augroup end
tnoremap <Esc> <C-\><C-n>:FloatermToggle<CR>
" }}}

" ============================= Search: Telescope ============================= {{{
" \ff - Find files
" \fg - Find in files (grep)
" \fb - Find buffers
" \fh - Find help
lua << EOF
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ["<C-u>"] = false,
        ["<C-d>"] = false,
      },
    },
  },
  pickers = {
    find_files = { theme = "dropdown" },
    live_grep = { theme = "ivy" },
  },
}
EOF
nnoremap <leader>ff :Telescope find_files<CR>
nnoremap <leader>fg :Telescope live_grep<CR>
nnoremap <leader>fb :Telescope buffers<CR>
nnoremap <leader>fh :Telescope help_tags<CR>
" }}}

" ============================= Formatting: Prettier ============================= {{{
" \p - Format with Prettier
nmap <leader>p :Prettier<CR>
" }}}

" ============================= Help: WhichKey ============================= {{{
" \wk - Show key mappings
lua require("which-key").setup {}
nnoremap <leader>wk :WhichKey<CR>
" }}}

" ============================= Misc Plugins ============================= {{{
let g:airline_powerline_fonts = 1
let g:airline#extensions#wordcount#enabled = 1
let g:airline#extensions#wordcount#filetypes = 'notes|help|markdown|rst|org|text|asciidoctor|tex|mail|plaintext|context'

autocmd BufRead,BufNewFile *.ledger,*.ldg set filetype=ledger

lua << EOF
require('dashboard').setup {
  theme = 'hyper',
  config = {
    header = {
    '                      welcome back',
    },
    shortcut = {
      { desc = "🔎 Find File", group = "@property", action = "Telescope find_files", key = "f" },
      { desc = "🌐 Recent", group = "@property", action = "Telescope oldfiles", key = "r" },
      { desc = "👀 Find Word", group = "@property", action = "Telescope live_grep", key = "w" },
      { desc = "⚙️  Config", group = "@property", action = "e ~/.config/nvim/init.vim", key = "c" },
      { desc = "👋 Quit", group = "@property", action = "qa", key = "q" },
    },
  }
}

require'colorizer'.setup()

require('leetcode').setup({
  lang = "javascript",
  cn = { enabled = false },
  storage = {
    home = vim.fn.stdpath('data') .. '/leetcode',
    cache = vim.fn.stdpath('cache') .. '/leetcode',
  },
})
EOF
" }}}

" ============================= Visual Plugins ============================= {{{
lua << EOF
require('smear_cursor').enabled = true

require("ibl").setup {
  indent = { char = "│" },
  scope = { enabled = true, show_start = false, show_end = false }
}

require("scrollbar").setup({
  handle = { color = "#3e4451" },
  marks = {
    Search = { color = "#ff9e64" },
    Error = { color = "#db4b4b" },
    Warn = { color = "#e0af68" },
    Info = { color = "#0db9d7" },
    Hint = { color = "#1abc9c" },
  }
})

require('neoscroll').setup({
  mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>'}
})

require("todo-comments").setup()

vim.notify = require("notify")
require("notify").setup({
  background_colour = "#000000",
  fps = 60,
  render = "compact",
  timeout = 3000,
})

require('nvim-autopairs').setup({
  check_ts = true,
  fast_wrap = {},
})

require('illuminate').configure({
  delay = 200,
  under_cursor = true,
})
EOF
" }}}

" ============================================================================
" LSP Configuration (Native vim.lsp.config)
" ============================================================================
" Keybindings:
"   K         - Show documentation
"   gD        - Go to declaration
"   gd        - Go to definition
"   gi        - Go to implementation
"   gr        - Show references
"   <C-k>     - Signature help
"   \rn       - Rename symbol
"   \ca       - Code actions
"   \f        - Format document
"   [d        - Previous diagnostic
"   ]d        - Next diagnostic
"   \e        - Show diagnostic in float
"   \q        - Show diagnostics list
" ============================================================================
lua << EOF
-- Configurar capacidades para LSP
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Función común para on_attach
local on_attach = function(client, bufnr)
  local opts = { noremap=true, silent=true, buffer=bufnr }
  
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'gk', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format({ async = true }) end, opts)
  
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
  vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
  vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)
end

-- Configurar servidores LSP usando vim.lsp.config (API moderna)
-- Python: pyright
vim.lsp.config.pyright = {
  cmd = { 'pyright-langserver', '--stdio' },
  filetypes = { 'python' },
  root_markers = { 'pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', 'Pipfile', '.git' },
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic",
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "workspace",
      }
    }
  },
}

-- TypeScript/JavaScript: ts_ls
vim.lsp.config.ts_ls = {
  cmd = { 'typescript-language-server', '--stdio' },
  filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
  root_markers = { 'package.json', 'tsconfig.json', 'jsconfig.json', '.git' },
}

-- Lua: lua_ls (para configurar Neovim)
vim.lsp.config.lua_ls = {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = { '.luarc.json', '.luarc.jsonc', '.luacheckrc', '.stylua.toml', 'stylua.toml', 'selene.toml', 'selene.yml', '.git' },
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      workspace = {
        checkThirdParty = false,
        library = { vim.env.VIMRUNTIME }
      },
      diagnostics = {
        globals = { 'vim' }
      },
      telemetry = { enable = false },
    }
  },
}

-- Habilitar servidores automáticamente cuando se abre un archivo
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'python', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'lua' },
  callback = function(args)
    local servers = {
      python = 'pyright',
      javascript = 'ts_ls',
      javascriptreact = 'ts_ls',
      typescript = 'ts_ls',
      typescriptreact = 'ts_ls',
      lua = 'lua_ls',
    }
    
    local server = servers[args.match]
    if server then
      vim.lsp.enable(server)
      
      -- Adjuntar configuración on_attach
      local clients = vim.lsp.get_clients({ bufnr = args.buf, name = server })
      if #clients > 0 then
        on_attach(clients[1], args.buf)
      end
    end
  end,
})

-- ============================================================================
-- Autocompletado: nvim-cmp
-- ============================================================================
-- Keybindings en modo insert:
--   <C-Space> - Activar completado
--   <C-e>     - Cerrar completado
--   <CR>      - Confirmar selección
--   <Tab>     - Siguiente item / expandir snippet
--   <S-Tab>   - Anterior item
--   <C-b>     - Scroll docs arriba
--   <C-f>     - Scroll docs abajo
-- ============================================================================
local cmp = require('cmp')
local luasnip = require('luasnip')

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
    { name = 'path' },
  })
})

-- Autocompletado para búsqueda (/)
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Autocompletado para comandos (:)
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})
EOF
