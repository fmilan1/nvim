call plug#begin('~/AppData/Local/nvim/plugged')
 below are some vim plugins for demonstration purpose.
 " add the plugin you want to use here.
 Plug 'joshdick/onedark.vim'
Plug 'iCyMind/NeoSolarized'

 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'


 " Better Syntax Support
     Plug 'sheerun/vim-polyglot'
         " File Explorer
             Plug 'scrooloose/NERDTree'
                 " Auto pairs for '(' '[' '{'
                     Plug 'jiangmiao/auto-pairs'

                     "LSP
                     Plug 'neovim/nvim-lspconfig'



                     call plug#end()
