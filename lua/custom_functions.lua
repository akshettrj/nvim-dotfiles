-- Get the highlight group of the word under cursor

vim.cmd[[
function! GetHighlightGroup()
   let l:s = synID(line('.'), col('.'), 1)
   echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfunction
command! -nargs=0 Syn call GetHighlightGroup()
]]

local function print_highlight_group()

  local curr_line = vim.fn.line '.'
  local curr_col = vim.fn.col '.'

  --[[ for _, i1 in ipairs(vim.fn.synstack(curr_line, curr_col)) do

    local i2 = vim.fn.synIDtrans(i1)
    local n1 = vim.fn.synIDattr(i1, "name")
    local n2 = vim.fn.synIDattr(i2, "name")
    print(n1 .. "|" .. n2)

  end ]]

  local s = vim.fn.synID(curr_line, curr_col, 1)
  local synID = vim.fn.synID
  local synIDattr = vim.fn.synIDattr
  local synIDtrans = vim.fn.synIDtrans
  print(synIDattr(s, 'name') .. ' -> ' .. synIDattr(synIDtrans(s), 'name'))
  -- let l:s = synID(line('.'), col('.'), 1)
  -- echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')

end

return {
  print_highlight_group = print_highlight_group
}
