local ts = require('telescope')

ts.setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
    },
    file_ignore_patterns = {
      "node_modules/.*"
    },
    file_sorter = require'telescope.sorters'.get_fzy_sorter,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    mappings = {
      i = {
        ["<C-h>"] = "which_key",
      },
    },
  },
  extensions = {
    file_browser = {
    }
  }
}

-- ts.load_extension 'bookmarks'
--
-- ts.setup{
--   extensions = {
--     bookmarks = {
--       selected_browser = 'brave',
--       url_open_command = 'brave',
--     }
--   }
-- }

local silent_noremap = {
  noremap = true,
  silent = true
}

local function nsnoremap(lhs, rhs)
  vim.api.nvim_set_keymap('n', lhs, rhs, silent_noremap)
end

nsnoremap('<leader>fe', '<CMD>lua require("telescope").extensions.file_browser.file_browser({ cwd = vim.fn.expand("%:p:h") })<CR>')
nsnoremap('<leader>fg', '<CMD>lua require("telescope.builtin").git_files{}<CR>')
nsnoremap('<leader>ff', '<CMD>lua require("telescope.builtin").find_files{ hidden = true }<CR>')
nsnoremap('<leader>fl', '<CMD>lua require("telescope.builtin").live_grep()<CR>')
nsnoremap('<leader>fb', '<CMD>lua require("telescope.builtin").buffers()<CR>')
nsnoremap('<leader>fh', '<CMD>lua require("telescope.builtin").help_tags()<CR>')
nsnoremap('<leader>fd', '<CMD>lua require("telescope.builtin").lsp_workspace_diagnostics()<CR>')
nsnoremap('<leader>fr', '<CMD>lua require("telescope.builtin").lsp_references()<CR>')
nsnoremap('<leader>fm', '<CMD>lua require("telescope.builtin").man_pages()<CR>')
nsnoremap('<leader>f*', '<CMD>lua require("telescope.builtin").grep_string()<CR>')
nsnoremap('<leader>fc', '<CMD>lua require("telescope").extensions.file_browser.file_browser({ cwd = "~/.config/" })<CR>')

-- Extensions

nsnoremap('<leader>fB', '<CMD>lua require("telescope").extensions.bookmarks.bookmarks{}<CR>')
