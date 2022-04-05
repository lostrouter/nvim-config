vim.cmd([[
call plug#begin(stdpath('data') . '/plugged')
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/vimux'
Plug 'airblade/vim-rooter'
Plug 'altercation/vim-colors-solarized'
Plug 'dense-analysis/ale'
Plug 'vim-test/vim-test'
Plug 'preservim/vimux'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'jiangmiao/auto-pairs'
Plug 'noprompt/vim-yardoc'
Plug 'junegunn/vim-peekaboo'
Plug 'easymotion/vim-easymotion'
Plug 'editorconfig/editorconfig-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'

" git plugins
Plug 'tpope/vim-fugitive'
" tmux plugins
Plug 'christoomey/vim-tmux-navigator'
" js/ts/gql
Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'        " GraphQL syntax
call plug#end()
]])

