"dein.vimの設定
if &compatible
  set nocompatible
endif

" Add the dein installation directory into runtimepath
set runtimepath+=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.config/nvim/dein')
  call dein#begin('~/.config/nvim/dein')

  call dein#add('~/.config/nvim/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

"TOMLをファイル
 let s:toml_dir  = $HOME . '/.config/nvim/' 
 let s:toml      = s:toml_dir . '/dein.toml'
 let s:lazy_toml = s:toml_dir . '/dein_lazy.toml'

"TOMLを読み込み、キャッシュしておく？
 call dein#load_toml(s:toml,      {'lazy': 0})
 call dein#load_toml(s:lazy_toml, {'lazy': 1})

 "よくわからんが必須
  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

"setting
"--------------------------------------------------------------------------
set number      "行番号を表示
set ic      "大文字小文字区別なし
set autoindent      "改行時に自動でインデントする
set tabstop=4       "タブを何文字の空白に変換するか
set shiftwidth=4        "自動インデント時に入力する空白の数
set expandtab       "タブ入力を空白に変換
set splitright      "画面を縦分割する際に右に開く
set clipboard=unnamed   "yank した文字列をクリップボードにコピー
set hls     "検索した文字をハイライトする
set mouse=a     "マウス操作を可能にする
set smartindent     "次の行のインデントを増減？
set autochdir       "現在開いているファイルがあるディレクトリをカレントディレクトリに
set cursorline      "現在のカーソルを強調する
set showmatch       "対応する括弧の強調表示
set list        "spaceを可視化
set listchars=tab:>-,trail:> "スペースを>で表示


set termguicolors       "テーマをayuにする
let ayucolor="dark"

colorscheme ayu

let g:closetag_filenames = '*.html'
"mrkdown用の設定
let g:vim_markdown_folding_disabled = 1

let g:previm_enable_realtime = 1

let g:previm_open_cmd = 'google-chrome'
"キーバインド
"--------------------------------------------------------------------------
nnoremap <silent><C-n>  :NERDTreeToggle<CR>     "NerdTreeのキーバインド

"##### auto fcitx  ###########
function! Fcitx()
   let fcitx_status = system("fcitx-remote")
   if fcitx_status == 2
      let result = system("fcitx-remote -c")
  endif
endfunction
autocmd InsertLeave * call Fcitx()
"##### auto fcitx end ######

