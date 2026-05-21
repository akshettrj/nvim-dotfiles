local utils = require("akshettrj.utils")

local disabled_filetypes = {
  latex = true,
  vimwiki = true,
}

local function parser_for_filetype(filetype)
  local ok, lang = pcall(vim.treesitter.language.get_lang, filetype)
  if ok and lang then
    return lang
  end

  return filetype
end

local function parser_is_installed(lang)
  return vim.tbl_contains(require("nvim-treesitter").get_installed("parsers"), lang)
end

local function ensure_parser_for_buffer(bufnr, filetype)
  local lang = parser_for_filetype(filetype)
  if not require("nvim-treesitter.parsers")[lang] then
    return
  end

  if parser_is_installed(lang) then
    pcall(vim.treesitter.start, bufnr, lang)
    return
  end

  require("nvim-treesitter").install({ lang }):await(function(err)
    if err or not vim.api.nvim_buf_is_valid(bufnr) then
      return
    end

    vim.schedule(function()
      if vim.api.nvim_buf_is_valid(bufnr) then
        pcall(vim.treesitter.start, bufnr, lang)
      end
    end)
  end)
end

local function textobject_map(mode, lhs, module, method, query, desc)
  vim.keymap.set(mode, lhs, function()
    require("nvim-treesitter-textobjects." .. module)[method](query, "textobjects")
  end, { silent = true, desc = desc })
end

return {
  {
    "https://github.com/nvim-treesitter/nvim-treesitter",
    branch = "main",
    enabled = function()
      return not utils.is_inside_vscode()
    end,
    build = ":TSUpdate",
    event = { "BufNewFile", "BufReadPost" },
    config = function()
      require("nvim-treesitter").setup({
        install_dir = vim.fn.stdpath("data") .. "/site",
      })
    end,
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        callback = function(ev)
          if disabled_filetypes[ev.match] then
            return
          end

          ensure_parser_for_buffer(ev.buf, ev.match)
        end,
      })
    end,
  },
  {
    "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    enabled = function()
      return not utils.is_inside_vscode()
    end,
    event = { "BufNewFile", "BufReadPost" },
    config = function()
      require("nvim-treesitter-textobjects").setup({
        select = {
          lookahead = true,
          selection_modes = {
            ["@function.outer"] = "V",
          },
        },
        move = {
          set_jumps = true,
        },
      })

      textobject_map({ "x", "o" }, "af", "select", "select_textobject", "@function.outer", "Select around current function")
      textobject_map({ "x", "o" }, "if", "select", "select_textobject", "@function.inner", "Select inside current function")
      textobject_map({ "x", "o" }, "ac", "select", "select_textobject", "@class.outer", "Select around current class")
      textobject_map({ "x", "o" }, "ic", "select", "select_textobject", "@class.inner", "Select inside current class")

      textobject_map({ "n", "x", "o" }, "]m", "move", "goto_next_start", "@function.outer", "Next function start")
      textobject_map({ "n", "x", "o" }, "[m", "move", "goto_previous_start", "@function.outer", "Previous function start")
      textobject_map({ "n", "x", "o" }, "]M", "move", "goto_next_end", "@function.outer", "Next function end")
      textobject_map({ "n", "x", "o" }, "[M", "move", "goto_previous_end", "@function.outer", "Previous function end")

      textobject_map({ "n", "x", "o" }, "]f", "move", "goto_next_start", "@function.outer", "Next function start")
      textobject_map({ "n", "x", "o" }, "[f", "move", "goto_previous_start", "@function.outer", "Previous function start")
      textobject_map({ "n", "x", "o" }, "]F", "move", "goto_next_end", "@function.outer", "Next function end")
      textobject_map({ "n", "x", "o" }, "[F", "move", "goto_previous_end", "@function.outer", "Previous function end")

      textobject_map({ "n", "x", "o" }, "]]", "move", "goto_next_start", "@class.outer", "Next class start")
      textobject_map({ "n", "x", "o" }, "[[", "move", "goto_previous_start", "@class.outer", "Previous class start")
      textobject_map({ "n", "x", "o" }, "][", "move", "goto_next_end", "@class.outer", "Next class end")
      textobject_map({ "n", "x", "o" }, "[]", "move", "goto_previous_end", "@class.outer", "Previous class end")

      textobject_map({ "n", "x", "o" }, "]p", "move", "goto_next_start", "@parameter.outer", "Next function parameter start")
      textobject_map({ "n", "x", "o" }, "[p", "move", "goto_previous_start", "@parameter.outer", "Previous function parameter start")
      textobject_map({ "n", "x", "o" }, "]P", "move", "goto_next_end", "@parameter.outer", "Next function parameter end")
      textobject_map({ "n", "x", "o" }, "[P", "move", "goto_previous_end", "@parameter.outer", "Previous function parameter end")

      local repeat_move = require("nvim-treesitter-textobjects.repeatable_move")
      vim.keymap.set({ "n", "x", "o" }, ";", repeat_move.repeat_last_move_next)
      vim.keymap.set({ "n", "x", "o" }, ",", repeat_move.repeat_last_move_previous)
      vim.keymap.set({ "n", "x", "o" }, "f", repeat_move.builtin_f_expr, { expr = true })
      vim.keymap.set({ "n", "x", "o" }, "F", repeat_move.builtin_F_expr, { expr = true })
      vim.keymap.set({ "n", "x", "o" }, "t", repeat_move.builtin_t_expr, { expr = true })
      vim.keymap.set({ "n", "x", "o" }, "T", repeat_move.builtin_T_expr, { expr = true })
    end,
    dependencies = {
      "https://github.com/nvim-treesitter/nvim-treesitter",
    },
  },
  {
    "https://github.com/nvim-treesitter/nvim-treesitter-context",
    enabled = false,
    event = { "VeryLazy" },
    config = function()
      require("treesitter-context").setup({
        enable = true,
        max_lines = 0,
        multiline_threshold = 2,
      })

      highlight_settings = {
        underline = true,
        sp = "Grey",
        bg = "Black",
      }
      vim.api.nvim_set_hl(0, "TreesitterContext", highlight_settings)
      vim.api.nvim_set_hl(0, "TreesitterContextLineNumber", highlight_settings)
    end,
    dependencies = {
      "https://github.com/nvim-treesitter/nvim-treesitter",
    }
  }
}
