execute pathogen#infect()
" SETS
:set number
:set tabstop=4
:set autoindent
:set ruler
:syntax on
filetype plugin indent on
:set incsearch
:set hls
:set path+=**
:set splitbelow
:set splitright
:set mouse=n
:set bs=2
:set wildmenu
:set wildmode=full
:set listchars=tab:\|\  
:set list
" was showing a bar on left if no folds had been created in a file...
:set foldcolumn=0 
:set cc=100 " shows colored column limit suggestion


" REMAPS
" window traversal
nnoremap <C-K> <C-W><C-J>
nnoremap <C-I> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-J> <C-W><C-H>

" buffer traversal - bnext and bprevious
nnoremap <C-Right> :bn<CR>
nnoremap <C-Left> :bp<CR>

" leader is \ - so \\ gets a list of buffers and beings a buffer command 
nnoremap <leader>\ :ls<CR>:b

" quit buffer and keep the window open (to the next open buffer).
map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>

" NOT USING TABS FOR NOW -- Buffers are better in vim
" nnoremap <C-Up> :tabnext<CR>
" nnoremap <C-Down> :tabprevious<CR>

" simple saving
nmap <C-S> :w<CR>
imap <C-S> <ESC>:w<CR>

" Alt-Q to close everything without saving 
" nmap œ :qa!<CR>
nnoremap <leader>= :qa!<CR> 

" foldmethod = manual - visual select line and F9 to create and toggle fold
inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf

" COPY N PASTE
vnoremap <C-c> "*y
" map <C-v> "*P

" this saves a buf copy so FOLDS save and reload when we open a file - can be
" messy with git updates
" autocmd BufWinLeave *.* mkview
" autocmd BufWinEnter *.* silent loadview 

" custom command Vsb calls vert sbN
command -nargs=1 Vsb call VsbFunction(<f-args>)
function VsbFunction (arg1)
  execute 'vert sb' a:arg1
endfunction

" what is this for?
:let g:FerretLazyInit = 1

" Jedi and NerdTree settings
:let g:jedi#force_py_version = 3

" DIFFERENT SETTINGS IN VIMDIFF MODE
if &diff
	" open vim diff without nerd tree and in different color scheme
	:colo allomancer
else
	:colo gruvbox 
	autocmd VimEnter * NERDTree
	autocmd VimEnter * wincmd p
	:let g:NERDTreeNodeDelimiter = "\u00a0"
	:let NERDTreeIgnore = ['\.pyc$']
	" leader n is taken by jedi-vim usage of name feature
	nnoremap <leader>ne :NERDTree<CR>
	" :let g:jedi#use_tabs_not_buffers = 1
	":let g:jedi#use_splits_not_buffers = "right"
endif


" BuiltInAlternative to NERDTree
" :Sex,:Vex, :Tex and :Ex are all useful commands for ex(ploring) the files on your system if you want to use something different from :e
" (where S/V/T are short for Split/Vertical/Tab)


" FOR FOLDING CODE BLCOKS
" Go to the beginning of the function body and type mb . 
" Now, just go to the end of the function body using % (brace matching) 
" or any other convenient technique and press zf'b and you’re done!
"
" If you are comfortable using the line numbers, the command is even easier to remember: :5,16fo (fo stands for code fold).
" Once you have folded your code, it’s easy to toggle between open and closed views using zo (Open the code fold)
" and zc (Close the code fold). Don’t stress it so much. Just use za to toggle between open and closed folds

" OPEN ALL GIT RELATED FILES IN A FOLDER
" vim -O $(git status -s | awk '{print $2}')
"
"
"
" COMMANDS FROM PLUGINS
" leader d = jedi follow definition
" :Ack = do some searching with quickfix window
" leader s = I think it does an Ack search
