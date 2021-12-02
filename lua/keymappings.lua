-- Key Mappings

local silent_noremap = {
  noremap = true,
  silent = true
}

------------------------
----- Normal Mode ------
------------------------

local function nsnoremap(lhs, rhs)
  vim.api.nvim_set_keymap('n', lhs, rhs, silent_noremap)
end

-- Stop highlighting the results
nsnoremap('<Leader>nh', ':noh<CR>')

-- Navigating splits
nsnoremap('<C-h>', '<C-w><C-h>')
nsnoremap('<C-j>', '<C-w><C-j>')
nsnoremap('<C-k>', '<C-w><C-k>')
nsnoremap('<C-l>', '<C-w><C-l>')
-- Resizing the splits
nsnoremap('<C-Up>',    ':resize +2<CR>')
nsnoremap('<C-Down>',  ':resize -2<CR>')
nsnoremap('<C-Left>',  ':vertical resize +2<CR>')
nsnoremap('<C-Right>', ':vertical resize -2<CR>')

-- Toggle spell checking
nsnoremap('<Leader>sc', ':set spell!<CR>')

-- Edit the next <++>
nsnoremap('<Leader><Leader>', '/<++><CR>:noh<CR>f>a<Backspace><Esc>...a')
-- Paste onto the next <++>
nsnoremap('<Leader>paste', '/<++><CR>:noh<CR>f>a<Backspace><Esc>...p')

-- Using system clipboard
nsnoremap('<Leader>y', '"+y')
nsnoremap('<Leader>p', '"+p')

-- Centering the stuff
nsnoremap('n', 'nzzzv')
nsnoremap('N', 'Nzzzv')
nsnoremap('G', 'Gzzzv')

-- Navigating buffers
nsnoremap('<TAB>', ':bnext<CR>')
nsnoremap('<S-TAB>', ':bprevious<CR>')

-- Consistent Behaviour
nsnoremap('Y', 'y$')

nsnoremap('<C-s>', ':w<CR>')

-- Jupyter Notebooks
nsnoremap('<leader>jx', ':silent call jupyter_ascending#execute()<CR>')
nsnoremap('<leader>ja', ':silent call jupyter_ascending#execute_all()<CR>')
nsnoremap('<leader>js', ':silent call jupyter_ascending#sync()<CR>')

------------------------
----- Visual Mode ------
------------------------

local function vsnoremap(key, map)
  vim.api.nvim_set_keymap('v', key, map, silent_noremap)
end

-- Using system clipboard
vsnoremap('<Leader>y', '"+y')
vsnoremap('<Leader>p', '"+p')

-- Don't loose selection on indenting
vsnoremap('<', '<gv')
vsnoremap('>', '>gv')

-- Move around lines in Visual Mode
vsnoremap('<A-k>', ':move \'<-2<CR>gv-gv')
vsnoremap('<A-j>', ':move \'>+1<CR>gv-gv')

------------------------
----- Insert Mode ------
------------------------

local function isnoremap(lhs, rhs)
  vim.api.nvim_set_keymap('i', lhs, rhs, silent_noremap)
end

-- For Copilot
vim.api.nvim_set_keymap('i', '<C-J>', 'copilot#Accept("<CR>")', {silent=true,script=true,expr=true})

-- isnoremap("P{", "{}")

------------------------
----- Mouse Mapping ----
------------------------

-- Calculator

vim.cmd[[
function! EvalEquation()
    let l:Line = getline('.')
    let l:Equation = substitute(l:Line, '.*=', '', '')
    call setline('.', l:Line .. " = " .. string(eval(l:Equation)))
endfunction

command! EvalEquation call EvalEquation()

inoremap <C-g>= <ESC>:EvalEquation<CR>A
]]
