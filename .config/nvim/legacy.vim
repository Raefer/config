" Clear register
let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
for r in regs
  call setreg(r, [])
endfor

" Clear some annoying default mapping
map <C-z> <Nop>
map q <Nop>

" Disable folding
set nofoldenable

" vim pencil
let g:pencil#textwidth = 80
