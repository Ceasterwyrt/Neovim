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
" This configuration file is still very much in development, but it's usable.  "
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

" Colorschemes
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
command Misc :cd ~\Misc
command Config :e ~\AppData\Local\nvim\init.vim
command GConfig :e ~\AppData\Local\nvim\ginit.vim
"command Guia :e ~\Documents\Vim\Checklist.txt | :wincmd v | :wincmd w | :e ~\Documents\Vim\Guia.txt | :wincmd v | :wincmd w | :e ~\Documents\Vim\Info.txt | :wincmd s | :wincmd w | :e ~\Documents\Vim\Notas.txt | :vertical resize 50 | :wincmd w | :vertical resize 33 | :wincmd w | :e ~\Documents\Vim\AsciiDoc\Guia.txt
command Guia :e ~\Documents\Vim\Checklist.txt | :wincmd v | :wincmd w | :e ~\AppData\Local\nvim\init.vim | :wincmd v | :wincmd w | :e ~\Documents\Vim\Info.txt | :wincmd s | :wincmd w | :e ~\Documents\Vim\Notas.txt | :vertical resize 50 | :wincmd w | :vertical resize 33 | :wincmd w | :wincmd s | :wincmd w | :horizontal resize 24 |:e ~\Documents\Vim\Guia.txt | :e ~\Documents\Vim\AsciiDoc\Guia.txt

" ============================================================================ "
" Macros para Serviço

" Checklist

" Entrada
let @e = 'mb^3lxi✓gg2jVG:sort`b'

" Saída
let @s = 'mb^6lxi✓gg2jVG:sort`b'

" Finalizado
let @r = "mb^3lxi✓3lxi✓2lxi'$a'gg2jVG:sort`b"

"Resetar
let @l = ":%s/'/ /e:%s/'//e:%s/✓/ /gegg2jVG:sort6gg@e9gg@e14gg@e24gg@e30gg@e32gg@e33gg@e/ach/"

" Script para remover acentos e outros caracteres especiais para uso no sintegra
command AccentMarks :%s/[[=a=]]/a/ge | :%s/[[=e=]]/e/ge | :%s/[[=i=]]/i/ge | :%s/[[=o=]]/o/ge | :%s/[[=u=]]/u/ge | :%s/[[=A=]]/A/ge | :%s/[[=E=]]/E/ge | :%s/[[=I=]]/I/ge | :%s/[[=O=]]/O/ge | :%s/[[=U=]]/U/ge | :%s/-/ /ge | :%s/+/ /ge | :%s/\// /ge | :%s/,/ /ge | :%s// /ge | :%s//A/ge | :%s/ç/c/ge | :%s/Ç/C/ge | :%s/\\/ /ge | :%s/Go/GO/ge | :%s/Ce/CE/ge

command Getrid :%s/\///ge | :%s/\.//ge | :%s/-//ge

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
