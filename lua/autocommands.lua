-- Cleaning up the file before saving
vim.cmd[[
" Storing current cursor position
augroup cleanup_file
  autocmd!
  autocmd BufWritePre * let save_pos = getpos('.')

  autocmd BufWritePre * %s/\s\+$//e     " Removing empty lines at the end
  autocmd BufWritePre * %s/\n\+\%$//e   " Removing extra whitespaces from end of lines

  " Restoring current cursor position
  autocmd BufWritePre * call setpos('.', save_pos)
augroup END
]]

-- Resourcing config files upon saving
vim.cmd[[
au BufWritePost ~/.config/nvim/**/*.lua luafile %
]]

-- Highlight the yanks

vim.cmd[[
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END
]]

-- Disable auto commenting
vim.cmd[[
autocmd BufEnter * setlocal fo-=c fo-=r fo-=o
]]
