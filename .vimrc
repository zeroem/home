set expandtab
set shiftwidth=2
set softtabstop=2
set ai
set nu
set hlsearch

" Vim Addon Manager
set nocompatible | filetype indent plugin on | syn on

fun SetupVAM()
  let c = get(g:, 'vim_addon_manager', {})
  let g:vim_addon_manager = c
  let c.plugin_root_dir = expand('$HOME', 1) . '/.vim/vim-addons'
  let &rtp.=(empty(&rtp)?'':',').c.plugin_root_dir.'/vim-addon-manager'
  let g:vim_addon_manager = {
    \'shell_commands_run_method': 'system',
    \'auto_install': 1
    \}
  if !isdirectory(c.plugin_root_dir.'/vim-addon-manager/autoload')
    execute '!git clone --depth=1 git://github.com/MarcWeber/vim-addon-manager '
                \       shellescape(c.plugin_root_dir.'/vim-addon-manager', 1)
  endif
  call vam#ActivateAddons('ctrlp', 'vim-fireplace', 'vim-classpath', 'vim-clojure-static')
endfun
call SetupVAM()
