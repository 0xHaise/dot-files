
" PACKAGE MANAGER: VIM-PLUG
" CANTIDAD DE PLUGINS :
" TECLA LEADER : "\"
let mapleader = "\\"

nnoremap <silent> <leader>h :call CocActionAsync('doHover')<CR>
" Atajo para ejecutar Prettier
nmap <leader>p :Prettier<CR>

" vim: foldmethod=marker

" ============================= Load vim-plugins ============================= 
" Load vim-plug {{{
" Install vim plug if not installed
let data_dir = has('nvim') ? stdpath('config') : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif
" }}}

" ============================= VIM standard configuration ============================= 
" VIM standard configuration {{{
syntax on
" We want everything to be utf-8
set encoding=utf-8
" - a: Automatically format paragraphs when typing. This option is off by default.
" - c: Automatically break comments using the textwidth value. This option is on by default.
" - l: Do not break lines that are already long when formatting. This option is off by default.
" - m: Automatically break the current line before inserting a new comment line when typing text
"   beyond textwidth. This option is off by default.
" - n: Recognize numbered lists. When hitting <Enter> in insert mode, the next line will have the
"   same or incremented number. This option is on by default.
" - o: Automatically insert the comment leader when hitting 'o' or 'O' in normal mode. This option
"   is on by default.
" - p: Preserve the existing formatting when using the gq command. This option is off by default.
" - q: Allow the use of gq to format comments. This option is on by default.
" - r: Automatically insert the comment leader when hitting <Enter> in insert mode. This option is
"   on by default.
" - t: Automatically wrap text using textwidth when typing. This option is off by default.
" - v: In visual mode, when using the gq command, break lines at a blank character instead of a
"   blank space. This option is off by default.
" - w: Recognize only whitespace when breaking lines with gq. This option is off by default.
set formatoptions=cronm
" This sets the width of a tab character to 4 spaces.
set tabstop=4
" This sets the number of spaces used when the <Tab> key is pressed in insert mode to 4.
set softtabstop=4
" This sets the number of spaces used for each indentation level when using
" the '>' and '<' commands, as well as the autoindent feature.
set shiftwidth=4
" This setting enables automatic indentation, which will copy the indentation
" of the current line when starting a new line.
set autoindent
" This disables the automatic conversion of tabs to spaces when you press the
" <Tab> key.
set noexpandtab
" This enables the use of the mouse in all modes (normal, visual, insert,
" command-line, etc.).
set mouse=a
" This displays line numbers in the left margin.
set number
" This disables the creation of backup files.
set nobackup
" This disables the creation of swap files.
set noswapfile
" Automatically reload files when they change
set autoread

" Highlight the current line
set cursorline
" Show white space characters and tab characters
set list
" Configure how nonprintable characters should be displayed
set listchars=tab:>-,trail:•
" Highlight the 100th column
set colorcolumn=80
" Set text width
set textwidth=80
" Set signcolumn to be expandable
set signcolumn=auto:2
" Use system clipboard
set clipboard=unnamedplus

" This maps the '<' and '>' keys in visual mode to shift the selected text one
" shift width to the left or right and reselect the shifted text.
vnoremap < <gv
vnoremap > >gv

" The next four lines define key mappings for switching between windows using
" Ctrl + hjkl keys
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" The next four lines define key mappings for resizing windows using Alt +
" hjkl keys:
map <a-l> :vertical res -5<CR>
map <a-h> :vertical res +5<CR>
map <a-j> :res -5<CR>
map <a-k> :res +5<CR>

" These lines define key mappings for moving the cursor vertically more quickly
nnoremap <S-h> 5h
vnoremap <S-h> 5h
nnoremap <S-l> 5l
vnoremap <S-l> 5l
nnoremap <S-j> 5j
vnoremap <S-j> 5j
nnoremap <S-k> 5k
vnoremap <S-k> 5k

nmap <leader>wq :wq!<cr>
nmap <leader>w :w!<cr>
nmap <leader>q :q!<cr>
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext


set foldmethod=indent
"Para evitar que todos los bloques estén colapsados al abrir un archivo
set foldlevelstart=99
set foldenable




" ============================= Load vim plugins ============================= 
" Load vim plugins {{{

" ============================= Load vim plugins =============================
" Load vim plugins {{{
call plug#begin()

" --------------------- Temas y Apariencia ---------------------
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }   " Hermoso esquema de colores
Plug 'morhetz/gruvbox'                          " Otro esquema de colores popular
Plug 'ryanoasis/vim-devicons'                   " Iconos para desarrolladores
Plug 'vim-airline/vim-airline'                  " Barra de estado elegante
Plug 'vim-airline/vim-airline-themes'           " Temas para airline
Plug 'akinsho/bufferline.nvim', { 'tag': 'v4.9.0' } " Barra de pestañas moderna

" ----------------------- Archivos y Exploración -----------------------
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' } " Explorador de archivos
Plug 'jeetsukumaran/vim-buffergator'                " Navegación entre buffers

" ------------------------- Git e Integración -------------------------
Plug 'lewis6991/gitsigns.nvim'     " Integración Git en buffers
Plug 'tpope/vim-fugitive'          " Git en Vim


" ----------------------- Herramientas de desarrollo -----------------------
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': 'yarn install --frozen-lockfile'} " Autocompletado LSP
 
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Análisis de sintaxis moderno
Plug 'p00f/nvim-ts-rainbow'           " Colores para paréntesis
Plug 'dense-analysis/ale'             " Linter y fixer
Plug 'tpope/vim-commentary'           " Comentarios rápidos con gc
Plug 'tpope/vim-dispatch'             " Ejecución asíncrona
Plug 'honza/vim-snippets'
" Plugin oficial de Prettier:  npm install -g prettier
Plug 'prettier/vim-prettier', {
      \ 'do': 'npm install --frozen-lockfile --production',
      \ 'for': ['javascript', 'typescript', 'css', 'json', 'markdown'] }

Plug 'norcalli/nvim-colorizer.lua'
Plug 'prisma/vim-prisma'






" Dependencias requeridas
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-treesitter/nvim-treesitter'

" Plugin principal de LeetCode
Plug 'kawre/leetcode.nvim'


" ------------------------- Snippets y Autocompletado -------------------------
Plug 'hrsh7th/nvim-cmp'               " Motor de completado moderno





" -------------------------- Lenguajes específicos --------------------------
Plug 'pangloss/vim-javascript'

Plug 'ledger/vim-ledger'              " Contabilidad con ledger

" ------------------------- Productividad -------------------------
Plug 'junegunn/goyo.vim'              " Modo zen/escritura enfocada
 
 
Plug 'inkarkat/vim-ingo-library'      " Librería necesaria para otros plugins
Plug 'voldikss/vim-floaterm'          " Terminal flotante
 
Plug 'folke/which-key.nvim'           " Muestra accesos rápidos
Plug 'nvimdev/dashboard-nvim'         " Pantalla de inicio personalizada

" ------------------------- Búsqueda y navegación -------------------------
Plug 'nvim-lua/plenary.nvim'          " Librería Lua requerida por Telescope
Plug 'nvim-telescope/telescope.nvim'  " Búsqueda de archivos y símbolos

" ------------------------- Integraciones externas -------------------------
Plug 'github/copilot.vim'             " GitHub Copilot

 
call plug#end()
" }}}





" Update all plugins
 
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
	\| :PlugInstall --sync
\| endif

" ============================= catppuccin/nvim (THEME) ============================= 
" https://github.com/catppuccin/nvim
" Plugin: catppuccin/nvim {{{
colorscheme catppuccin-latte
set background=dark " Optional: change to 'light' for the light version
" }}}


" ============================= lewis6991/gitsigns.nvim ============================= 

" Plugin: lewis6991/gitsigns.nvim {{{
if has_key(plugs, 'gitsigns.nvim')
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
			current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
				delay = 1000,
				ignore_whitespace = false,
			},
		}
EOF
	" Popup what's changed in a hunk under cursor
	nnoremap <Leader>gp :Gitsigns preview_hunk<CR>
	" Stage/reset individual hunks under cursor in a file
	nnoremap <Leader>gs	:Gitsigns stage_hunk<CR>
	nnoremap <Leader>gr :Gitsigns reset_hunk<CR>
	nnoremap <Leader>gu :Gitsigns undo_stage_hunk<CR>

	" Stage/reset all hunks in a file
	nnoremap <Leader>gS :Gitsigns stage_buffer<CR>
	nnoremap <Leader>gU :Gitsigns reset_buffer_index<CR>
	nnoremap <Leader>gR :Gitsigns reset_buffer<CR>

	" Git blame
	nnoremap <Leader>gB :Gitsigns toggle_current_line_blame<CR>
endif
" }}}
 
 
" ============================= airblade/vim-gitgutter ============================= 
" Plugin: airblade/vim-gitgutter {{{
if has_key(plugs, 'vim-gitgutter')
	let g:gitgutter_enabled = 1
	let g:gitgutter_sign_added = '+'
	let g:gitgutter_sign_modified = '>'
	let g:gitgutter_sign_removed = '-'
	let g:gitgutter_sign_removed_first_line = '^'
	let g:gitgutter_sign_modified_removed = '<'
	nmap <Leader>gs <Plug>(GitGutterStageHunk)
	nmap <Leader>gu <Plug>(GitGutterUndoHunk)
	nmap <Leader>gn <Plug>(GitGutterNextHunk)
	nmap <Leader>gp <Plug>(GitGutterPrevHunk)
	nmap <Leader>gh <Plug>(GitGutterPreviewHunk)
	function! GitStatus()
		let [a,m,r] = GitGutterGetHunkSummary()
		return printf('+%d ~%d -%d', a, m, r)
	endfunction
	set statusline+=%{GitStatus()}
endif
" }}}

 


" ============================= dense-analysis/ale ============================= 
" Plugin: dense-analysis/ale {{{
if has_key(plugs, 'ale')
	" Ignore git commit when linting (highly annoying)
	let g:ale_pattern_options = {
	\		'COMMIT_EDITMSG$': {'ale_linters': [], 'ale_fixers': []}
	\	}
	let g:ale_linters = {
	\	'yaml': ['yamllint'],
	\	'cpp': ['clangtidy'],
	\	'c': ['clangtidy'],
	\	'asciidoc': ['cspell'],
	\	'markdown': ['cspell']
	\	}
	let g:ale_linter_aliases = {
	\	'asciidoctor': 'asciidoc'
	\}
	let g:ale_fixers = {
	\	'cpp': ['clang-format'],
	\	'c': ['clang-format']}
	let g:ale_linters_explicit = 0
	let g:ale_completion_enabled = 1
	let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
	let g:ale_set_balloons=1
	let g:ale_hover_to_floating_preview=1
	let g:ale_use_global_executables = 1
	let g:ale_sign_column_always = 1
	let g:ale_disable_lsp = 1

	" Cspell options
	let g:ale_cspell_use_global = 1
	let g:ale_cspell_options = '-c cspell.json'

	" Clang Tidy configuration
	let g:ale_cpp_clangtidy_options = '-checks=-*,cppcoreguidelines-*'
	let g:ale_cpp_clangtidy_checks = ['readability-*,performance-*,bugprone-*,misc-*']
	let g:ale_cpp_clangtidy_checks += ['clang-analyzer-cplusplus-doc-comments']

	let g:ale_c_clangtidy_options = '-checks=-*,cppcoreguidelines-*'
	let g:ale_c_clangtidy_checks = ['readability-*,performance-*,bugprone-*,misc-*']
	let g:ale_c_clangtidy_checks += ['-readability-function-cognitive-complexity']
	let g:ale_c_clangtidy_checks += ['-readability-identifier-length']
	let g:ale_c_clangtidy_checks += ['-misc-redundant-expression']
	let g:ale_c_build_dir_names = ['build', 'release', 'debug']
	let g:ale_set_balloons=1
	let g:ale_hover_to_floating_preview=1

	" Automatic fixing
	autocmd FileType c nnoremap <leader>f <Plug>(ale_fix)

	" This function searches for the first clang-tidy config in parent directories and sets it
	function! SetClangTidyConfig()
		let l:config_file = findfile('.clang-tidy', expand('%:p:h').';')
		if !empty(l:config_file)
			let g:ale_c_clangtidy_options = '--config=' . l:config_file
			let g:ale_cpp_clangtidy_options = '--config=' . l:config_file
		endif
	endfunction

	" Run this for c and c++ files
	autocmd BufRead,BufNewFile *.c,*.cpp,*.h,*.hpp call SetClangTidyConfig()

	" Diagnostics
	let g:ale_use_neovim_diagnostics_api = 1
	let g:airline#extensions#ale#enabled = 1
	" let g:ale_sign_error = '>>'
	" let g:ale_sign_warning = '!!'
endif
" }}}



 

" ============================= jeetsukumaran/vim-buffergator ============================= 
" Plugin: jeetsukumaran/vim-buffergator {{{
nmap <silent> <leader>bb :BuffergatorOpen<CR>
nmap <silent> <leader>bB :BuffergatorOpenInTab<CR>
nnoremap <leader>bn :BuffergatorMruCycleNext<CR>
nnoremap <leader>bp :BuffergatorMruCyclePrev<CR>
nnoremap <leader>bd :bdelete<CR>

" }}}


" ============================= mbbill/undotree ============================= 
" Plugin: mbbill/undotree {{{
nmap <F5> :UndotreeToggle<CR>
" }}}
" ============================= ledger/vim-ledger ============================= 
" Plugin: ledger/vim-ledger: accounting {{{
autocmd BufRead,BufNewFile *.ledger,*.ldg set filetype=ledger
autocmd FileType ledger setlocal includeexpr=substitute(v:fname,'^.*[\\/]\zs','','')
" }}}
" ============================= tpope/vim-fugitive ============================= 
" Plugin: tpope/vim-fugitive {{{
" Open git status in interative window (similar to lazygit)
nnoremap <Leader>gg :Git<CR>

" Show `git status output`
nnoremap <Leader>gi :Git status<CR>

" Open commit window (creates commit after writing and saving commit msg)
nnoremap <Leader>gc :Git commit<CR>

" See who committed a particular line of code
nnoremap <Leader>gb :Git blame<CR>

" Other tools from fugitive
nnoremap <Leader>gd :Git difftool<CR>
nnoremap <Leader>gm :Git mergetool<CR>
nnoremap <Leader>gdv :Gvdiffsplit<CR>
nnoremap <Leader>gdh :Gdiffsplit<CR>
" }}}

 


" ============================= preservim/nerdtree ============================= 
" Plugin: preservim/nerdtree {{{
autocmd FileType nerdtree setlocal nolist
let g:NERDTreeWinSize = 40
nnoremap <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.o$', '\.obj$', '\.a$', '\.so$', '\.out$', '\.git$']
let NERDTreeShowHidden = 1
let g:NERDTreeGitStatusIndicatorMapCustom = {
\ 'Modified'  :'✹',
\ 'Staged'    :'✚',
\ 'Untracked' :'✭',
\ 'Renamed'   :'➜',
\ 'Unmerged'  :'═',
\ 'Deleted'   :'✖',
\ 'Dirty'     :'✗',
\ 'Ignored'   :'☒',
\ 'Clean'     :'✔︎',
\ 'Unknown'   :'?',
\ }
" }}}


" ============================= voldikss/vim ============================= 
" Plugin: voldikss/vim {{{
nnoremap <C-t> :FloatermToggle!<CR>
augroup FloattermMapping
	autocmd!
	autocmd FileType floaterm nnoremap <buffer> <Esc> <C-\><C-n>:FloatermToggle<CR>
	autocmd FileType floaterm inoremap <buffer> <Esc> <C-\><C-n>:FloatermToggle<CR>
augroup end
tnoremap <Esc> <C-\><C-n>:FloatermToggle<CR>
" }}}




" ============================= neoclide/coc.nvim: autocompletion =============================
" es un complemento de autocompletado y asistencia para código en Neovim basado en el protocolo LSP (Language Server Protocol).
" :CocInstall coc-snippets   Permite instalar snippets 

  
 " Plugin: neoclide/coc.nvim: autocompletion {{{
if has_key(plugs, 'coc.nvim')
	let g:coc_global_extensions = ['coc-clangd', 'coc-tsserver']
	let g:clangd_install_prefix = '/usr/'
	let g:clangd_command = ['clangd',
	\	'--clang-tidy',
	\	'--background-index',
	\	'--header-insertion-decorators=0',
	\	'--completion-style=detailed']

	nnoremap <silent> ? :call <sid>show_documentation()<cr>
	function! s:show_documentation()
		if index(['vim', 'help'], &filetype) >= 0
			execute 'help ' . expand('<cword>')
		elseif &filetype ==# 'tex'
			VimtexDocPackage
		else
			call CocAction('doHover')
		endif
	endfunction
	" Use <c-space> to trigger completion
	if has('nvim')
		inoremap <silent><expr> <c-space> coc#refresh()
	else
		inoremap <silent><expr> <c-@> coc#refresh()
	endif
	" Use tab for trigger completion with characters ahead and navigate
	" NOTE: There's always complete item selected by default, you may want to enable
	" no select by `"suggest.noselect": true` in your configuration file
	" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
	" other plugin before putting this into your config
	inoremap <silent><expr> <TAB>
		\ coc#pum#visible() ? coc#pum#confirm() :
		\ CheckBackspace() ? "\<Tab>" :
		\ coc#refresh()
	" inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
	function! CheckBackspace() abort
		let col = col('.') - 1
		return !col || getline('.')[col - 1]  =~# '\s'
	endfunction
	" Applying code actions to the selected code block
	" Example: `<leader>aap` for current paragraph
	xmap <leader>a  <Plug>(coc-codeaction-selected)
	nmap <leader>a  <Plug>(coc-codeaction-selected)

	" Remap keys for applying code actions at the cursor position
	nmap <leader>ac  <Plug>(coc-codeaction-cursor)
	" Remap keys for apply code actions affect whole buffer
	nmap <leader>as  <Plug>(coc-codeaction-source)
	" Apply the most preferred quickfix action to fix diagnostic on the current line
	nmap <leader>qf  <Plug>(coc-fix-current)

	" Remap keys for applying refactor code actions
	nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
	xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
	nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

	" Run the Code Lens action on the current line
	nmap <leader>cl  <Plug>(coc-codelens-action)

	" GoTo code navigation.
	nmap <silent> gd <Plug>(coc-definition)
	nmap <silent> gy <Plug>(coc-type-definition)
	nmap <silent> gi <Plug>(coc-implementation)
	nmap <silent> gr <Plug>(coc-references)

	" Map function and class text objects
	" NOTE: Requires 'textDocument.documentSymbol' support from the language server
	xmap if <Plug>(coc-funcobj-i)
	omap if <Plug>(coc-funcobj-i)
	xmap af <Plug>(coc-funcobj-a)
	omap af <Plug>(coc-funcobj-a)
	xmap ic <Plug>(coc-classobj-i)
	omap ic <Plug>(coc-classobj-i)
	xmap ac <Plug>(coc-classobj-a)
	omap ac <Plug>(coc-classobj-a)

	" Remap <C-f> and <C-b> to scroll float windows/popups
	if has('nvim-0.4.0') || has('patch-8.2.0750')
	 nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
	 nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
	 inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
	 inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
	 vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
	 vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
	endif

	" Use CTRL-S for selections ranges
	" Requires 'textDocument/selectionRange' support of language server
	nmap <silent> <C-s> <Plug>(coc-range-select)
	xmap <silent> <C-s> <Plug>(coc-range-select)

	" Add `:Format` command to format current buffer
	command! -nargs=0 Format :call CocActionAsync('format')

	" Add `:Fold` command to fold current buffer
	command! -nargs=? Fold :call     CocAction('fold', <f-args>)

	" Add `:OR` command for organize imports of the current buffer
	command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

	" Mappings for CoCList
	" Show all diagnostics
	nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
	" Manage extensions
	nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
	" Show commands
	nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
	" Find symbol of current document
	nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
	" Search workspace symbols
	nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
	" Do default action for next item
	nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
	" Do default action for previous item
	nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
	" Resume latest coc list
	nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
endif
" }}}
 
" ============================= folke/which-key.nvim =============================
lua << EOF
require("which-key").setup {}
EOF
nnoremap <leader>w :WhichKey<CR>
nnoremap <leader>p :Dashboard<CR>

" ============================= vim-airline/vim-airline : THEME BAR ============================= 
" Plugin: vim-airline/vim-airline {{{
let g:airline_powerline_fonts = 1
let g:airline_theme = 'base16'
" Enable wordcount
let g:airline#extensions#wordcount#enabled = 1
" Add notes to filetypes
let g:airline#extensions#wordcount#filetypes = 'notes|help|markdown|rst|org|text|asciidoctor|tex|mail|plaintext|context'
" }}}

" Settings: spelling {{{
command! SpellIgnore :call execute('spell! ' . expand('<cword>'))
nnoremap <Leader>s :call execute('spell! ' . expand('<cword>'))<CR>
" }}}
  


lua << EOF
require('dashboard').setup {
  theme = 'hyper',
  config = {
    header = {

    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⠟⠻⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⠀⠀⠈⠻⣦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣴⣶⣦⡀⠀⠀⠀',
    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡿⡇⠀⠀⠀⠀⠈⠙⢷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⠾⠋⠁⢸⣿⡇⠀⠀⠀',
    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣇⡇⠀⠀⠀⠀⠀⠀⠀⠙⢷⣆⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⡾⠛⠁⠀⠀⠀⣿⣼⠀⠀⠀⠀',
    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⡏⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⡾⠛⠁⠀⠀⠀⠀⠀⣸⡿⣿⠂⠀⠀⠀',
    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣇⣿⠀⠀⠀⠀⠀⠶⠶⠶⠶⠶⠶⠿⠷⠶⠶⠤⣤⣤⣀⣀⡀⢀⣤⡾⠛⠁⠀⠀⠀⠀⠀⠀⠀⢠⣿⢣⡟⠀⠀⠀⠀',
    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⣽⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⡷⣸⠇⠀⠀⠀⠀',
    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⢣⡿⠁⠀⠀⠀⠀',
    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣼⠃⠀⠀⠀⠀⠀',
    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⠇⠀⣀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⡏⠀⠀⠀⠀⠀⠀',
    '⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣿⣿⡾⠛⠉⣉⣽⣿⣶⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣴⠶⠛⢛⣿⣿⣷⣶⣤⣀⠀⠀⠀⠀⠀⠀⢸⣿⡀⠀⠀⠀⠀⠀⠀',
    '⠀⠀⠀⠀⠀⢰⣾⠛⢉⣵⡟⣃⣤⣶⣿⣿⣿⣿⣿⣿⣷⡄⠀⠀⠀⠀⠀⣠⣾⠏⣡⣴⣾⣿⣿⣿⣿⣿⣿⣿⣷⡄⠀⠀⠀⠀⢈⡹⣇⠀⠀⠀⠀⠀⠀',
    '⠀⠀⠀⠀⠀⠀⠙⣷⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣀⣀⣀⣀⣰⣿⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⠶⠖⠲⠾⣿⣿⣦⠀⠀⠀⠀⠀',
    '⠀⠀⠀⠀⣠⣴⡾⠋⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠛⠻⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠀⠀⠀⠀⠀⠈⠙⢿⣄⠀⠀⠀⠀',
    '⠀⠀⣿⡛⠉⠁⠀⠀⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⠀⠀⠀⠀⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢷⣄⠀⠀',
    '⠀⠀⣾⣷⣦⣀⠀⠀⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⣧⠀',
    '⠀⡀⠈⠻⢿⣿⣿⣷⠆⠀⠙⠻⠿⣿⣿⡿⢿⣿⠋⠀⠀⠀⣴⠇⠀⠀⠀⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⡆',
    '⠀⠻⣟⠛⠛⠛⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠿⣿⣆⣀⣠⣼⢿⣧⠀⠀⠀⢀⣿⠿⢿⣿⣿⣿⣿⣿⣿⣿⠿⣛⠹⣮⣿⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣷',
    '⠀⠀⠈⠻⢦⣤⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⢩⠿⠻⣯⢻⣷⣶⣿⡿⠋⠀⠀⠀⠉⠉⠉⠉⠁⠀⣐⣭⣾⡿⠋⢻⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿',
    '⠀⠀⠀⢀⣰⣿⣻⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⡿⠛⣍⠡⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡟',
    '⠀⠀⠀⠛⣿⣿⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣤⡾⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡿⠁',
    '⠀⠀⠀⢐⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⠟⠀⠀',
    '⠀⠀⠀⣼⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡾⠃⠀⠀⠀',
    '⠀⠀⠀⣸⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣶⡟⠀⠀⠀⠀⠀',
    '⠀⠀⣰⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⠛⠀⠀⠀⠀⠀⠀',
    '⢠⣾⢿⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⡏⠀⠀⠀⠀⠀⠀⠀',
    '⠀⣰⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣶⣿⠀⠀⠀⠀⠀⠀⠀⠀',
    '⣾⢿⣾⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠛⠀⠀⠀⠀⠀⠀⠀⠀',
    '⢀⣾⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⠀⠀⠀⠀⠀⠀⠀⠀⠀',


    },
    shortcut = {
      { desc = "🔎Find File", group = "@property", action = "Telescope find_files", key = "f" },
      { desc = "🌐Recent", group = "@property", action = "Telescope oldfiles", key = "r" },
      { desc = "👀Find Word", group = "@property", action = "Telescope live_grep", key = "w" },
      { desc = "⚙️ Config", group = "@property", action = "e ~/.config/nvim/init.vim", key = "c" },
      { desc = "👋Quit", group = "@property", action = "qa", key = "q" },
    },
  }
}
EOF

lua << EOF
local telescope = require('telescope')
telescope.setup {
  defaults = {
    mappings = {
      i = {
        ["<C-u>"] = false, -- Deshabilita el scroll hacia arriba
        ["<C-d>"] = false, -- Deshabilita el scroll hacia abajo
      },
    },
  },
  pickers = {
    find_files = {
      theme = "dropdown",
    },
    live_grep = {
      theme = "ivy",
    },
  },
}
EOF
" Mapeo en modo normal para buscar por palabras con Telescope
nnoremap <leader>a :Telescope live_grep<CR>

lua << EOF
require'colorizer'.setup()
EOF


lua << EOF
require('leetcode').setup({
  lang = "javascript",               -- O el lenguaje que prefieras
  cn = { enabled = false },          -- Usa `true` si quieres leetcode.cn
  storage = {
    home = vim.fn.stdpath('data') .. '/leetcode',
    cache = vim.fn.stdpath('cache') .. '/leetcode',
  },
})
EOF

