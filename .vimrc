""""""""""""""""""""""""""""""
"""""""""My vim set"""""""""""
""""""""""""""""""""""""""""""
" set for the monitor
set hlsearch
set nu
set ruler
set cursorline
color molokai
syntax on
set tabstop=4
set autoindent
set incsearch
set t_Co=256
set wildmode=list:longest
autocmd BufWritePost *.cpp,*.h,*.c call AutoTags()

"if has("autocmd")
"au BufReadPost * if line("`\"") > 1 && line("`\"") <= line("$") | exe "normal! g`\"" | endif
"endif

function! DelTagOfFile(file)
	let fullpath = a:file
	let cwd = getcwd()
	let tagfilename = cwd . "/tags"
	let f = substitute(fullpath, cwd . "/", "", "")
	let f = escape(f, './')
	let cmd = 'sed -i "/' . f . '/d" "' . tagfilename . '"'
	let resp = system(cmd)
endfunction

function! AutoTags()
	let f = expand("%:p")
	let cwd = getcwd()
	let tagfilename = cwd . "/tags"
	let cmd = 'ctags -a -R -f ' . tagfilename . ' --c++-kinds=+p --fields=+    iaS --extra=+q ' . '"' . f . '"'
	call DelTagOfFile(f)
	let resp = system(cmd)
endfunction
