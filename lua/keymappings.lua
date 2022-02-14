-- Key Mappings

--[[
Different Modes Available

         Mode  | Norm | Ins | Cmd | Vis | Sel | Opr | Term | Lang | ~
Command        +------+-----+-----+-----+-----+-----+------+------+ ~
[nore]map      | yes  |  -  |  -  | yes | yes | yes |  -   |  -   |
n[nore]map     | yes  |  -  |  -  |  -  |  -  |  -  |  -   |  -   |
[nore]map!     |  -   | yes | yes |  -  |  -  |  -  |  -   |  -   |
i[nore]map     |  -   | yes |  -  |  -  |  -  |  -  |  -   |  -   |
c[nore]map     |  -   |  -  | yes |  -  |  -  |  -  |  -   |  -   |
v[nore]map     |  -   |  -  |  -  | yes | yes |  -  |  -   |  -   |
x[nore]map     |  -   |  -  |  -  | yes |  -  |  -  |  -   |  -   |
s[nore]map     |  -   |  -  |  -  |  -  | yes |  -  |  -   |  -   |
o[nore]map     |  -   |  -  |  -  |  -  |  -  | yes |  -   |  -   |
t[nore]map     |  -   |  -  |  -  |  -  |  -  |  -  | yes  |  -   |
l[nore]map     |  -   | yes | yes |  -  |  -  |  -  |  -   | yes  |

--]]

local silent_noremap = {
  noremap = true,
  silent = true
}

-- n-maps <<<
local function nsnoremap(lhs, rhs)
  vim.api.nvim_set_keymap('n', lhs, rhs, silent_noremap)
end

-- Stop highlighting the results
nsnoremap('<Leader>nh', ':noh<CR>')

-- Navigating splits
nsnoremap('<A-h>', '<C-w><C-h>')
nsnoremap('<A-j>', '<C-w><C-j>')
nsnoremap('<A-k>', '<C-w><C-k>')
nsnoremap('<A-l>', '<C-w><C-l>')
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
-- >>>

-- i-maps <<<
local function isnoremap(lhs, rhs)
  vim.api.nvim_set_keymap('i', lhs, rhs, silent_noremap)
end

-- [[ Easy Undo
isnoremap (',', ',<C-g>u')
isnoremap ('.', '.<C-g>u')
isnoremap ('?', '?<C-g>u')
isnoremap ('!', '!<C-g>u')
isnoremap ('<Space>', '<Space><C-g>u')
-- ]]

-- [[ Move around in insertmode
isnoremap ('<A-k>', '<Up>')
isnoremap ('<A-j>', '<Down>')
isnoremap ('<A-h>', '<Left>')
isnoremap ('<A-l>', '<Right>')
-- ]]
-- >>>

-- v-maps <<<
local function vsnoremap(lhs, rhs)
  vim.api.nvim_set_keymap('v', lhs, rhs, silent_noremap)
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
-- >>>

-- x-maps <<<
local function xsnoremap(lhs, rhs)
  vim.api.nvim_set_keymap('x', lhs, rhs, silent_noremap)
end

xsnoremap('p', 'pgvy')
-- >>>


--[[
-- Calculator Example

vim.cmd[[
function! EvalEquation()
    let l:Line = getline('.')
    let l:Equation = substitute(l:Line, '.*=', '', '')
    call setline('.', l:Line .. " = " .. string(eval(l:Equation)))
endfunction

command! EvalEquation call EvalEquation()

inoremap <C-g>= <ESC>:EvalEquation<CR>A
]]
--]]
