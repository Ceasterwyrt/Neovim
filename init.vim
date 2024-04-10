" ============================================================================ "
"                                                                              "
" :++:   :++-   .+++=.                      :  -+-                             "
"  -@@:   =@@: -*++@@#                    +@-   @@:                            "
"   %@%    %@*     +@*                    @@:   @@:                            "
"   -@@:   -@@.    +@-:--   .--: --  --::-@@+:. @@: -=-       .-==. :::   :::. "
"    @@*    @@+    *@  #@* :==%@ +@#=+*..:%@=-  %@+==*@@:   :-==*@@. =@% -++*  "
"    *@@    #@%    %=   @@-   -# -@%      %@-   %@:   +@% .%*    @@-  =@%-     "
"    -@@-   #@@-   #    -@%   == -@%      %@=   @@:   -@@ +@+    @@-   +@#     "
"     %@#  *.#@*  =:     #@+  *  :@@      %@=   @@-   -@% +@%    @@-  .=*@#    "
"     :@@+*= :@@*=-      .@@+=+  :@@      %@=   *@#   **. .%@*.  @%. .*  +@%.  "
"      -##+   -*#+        .#%@   =##-.    :*#:   =#*=-.     -*#+-:  -#=   -##: "
"                           =-                                                 "
"                     =#   ++                                                  "
"                     -#%*#-                                                   "
"                                                                              "
" This configuration file is still very much in development, but it's usable.
" Has Windows file paths.
" ============================================================================ "
" CONTENTS                                                          *contents* "
"                                                                              "
" 1. New Defaults ............................................. |new-defaults| "
" 2. Rebinds ....................................................... |rebinds| "
" 3. Plugins ....................................................... |plugins| "
" 4. Plugin Tweaks ........................................... |plugin-tweaks| "
" 5. Shortcuts ................................................... |shortcuts| "
" 6. Lua ............................................................... |lua| "
"                                                                              "
" ============================================================================ "
" 1. New Defaults                                               *new-defaults*
"
language en_GB " Sets GUI language

set guifont=Jetbrains\ Mono:h9.5 " Sets font
set linespace=0 " Sets the space between lines, if needed

set clipboard^=unnamedplus " Enables shared clipboard

set ignorecase " Ignore cases when searching by default
set smartcase " Unless uppercase is used

set relativenumber number " Displays line numbers and their relative position to the current line

set wrap " Makes it so the line breaks, instead of displaying a single long line
set linebreak " Makes it so the line breaks only at end of words
set tw=0 " Makes it so line breaks don't create new lines

set so=5 " Sets scrolloff (bottom and top margin)

set hidden " Enables switching buffers without saving

packadd! justify " Package used to justify text
" Use 'Vgq' or 'gqq' to break a single long line.
" Then select the lines and use '_j' to justify.
" To undo, select the lines and use 'J' to join the lines back together.

" ============================================================================ "
" 2. Rebinds                                                         *rebinds*

" Centralise screen on every search
nnoremap n nzt
nnoremap N Nzt
nnoremap * *zt
nnoremap # #zt
nnoremap g* g*zt
nnoremap g# g#zt

" Remaps capital Y to copy the current line, without the line break at the end
nmap Y ^y$

" Movement keys work on single lines
noremap j gj
noremap k gk

" Change buffer on tab press
nnoremap <silent> <tab> :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap <silent> <s-tab> :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

" Close all buffers with Ctrl-n
nnoremap <C-n> :%bd<CR>

" Close all without saving
nnoremap <C-q> :%bd<CR>ZQ

" Toggle numbers
nnoremap <C-l> :setlocal number! relativenumber!<CR>

" Toggle Goyo
nnoremap <C-g> :Goyo<CR>

" Nvim Tree shortcut with Ctrl-Tab
nnoremap <C-tab> :NvimTreeToggle<CR>

" ============================================================================ "
" 3. Plugins                                                         *plugins*

call plug#begin('~/AppData/Local/nvim/plugged')

" Functionalities
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-easy-align'
Plug 'equalsraf/neovim-gui-shim'

" Colourschemes
Plug 'https://gitlab.com/yorickpeterse/happy_hacking.vim.git'
Plug 'yorickpeterse/vim-paper'

" Nvim Tree
Plug 'nvim-tree/nvim-tree.lua'

" Asciidoc Support
Plug 'habamax/vim-asciidoctor'

" Font Resize
Plug 'mkropat/vim-ezguifont'

call plug#end()

" ============================================================================ "
" 4. Plugin Tweaks                                             *plugin-tweaks*

" Set colorscheme
colorscheme paper

" Asciidoctor
let g:asciidoctor_syntax_conceal = 1
let g:asciidoctor_syntax_indented = 1

" Easy Align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(LiveEasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(LiveEasyAlign)

" Ezguifont
nnoremap <C-+> :IncreaseFont<CR>
nnoremap <C-=> :IncreaseFont<CR>
nnoremap <C--> :DecreaseFont<CR>

" Neovide
let g:neovide_hide_mouse_when_typing = v:true
let g:neovide_fullscreen = v:true

" ============================================================================ "
" 5. Shortcuts                                                     *shortcuts*

command Documents :cd ~\Documents
command Config :e ~\AppData\Local\nvim\init.vim
command GConfig :e ~\AppData\Local\nvim\ginit.vim

" ============================================================================ "
" 6. Lua                                                                 *lua*

lua << EOF
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
vim.keymap.set(
  'c', '<CR>',
  function() return vim.fn.getcmdtype() == '/' and '<CR>zt' or '<CR>' end,
  { expr = true }
)
EOF
