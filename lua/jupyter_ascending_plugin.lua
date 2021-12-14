local g = vim.g

g.jupyter_ascending_python_executable = 'python'
g.jupyter_ascending_match_pattern = '.sync.py'
g.jupyter_ascending_auto_write = true
g.jupyter_ascending_default_mappings = false

vim.cmd[[
au FileType python nmap <space><space>x <Plug>JupyterExecute
au FileType python nmap <space><space>X <Plug>JupyterExecuteAll
]]
