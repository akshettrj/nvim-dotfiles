require("presence"):setup({
  -- General options
  -- auto_update         = true,
  -- neovim_image_text   = "The One True Text Editor",
  -- main_image          = "neovim",
  -- client_id           = "793271441293967371",
  -- log_level           = nil,
  -- debounce_timeout    = 10,
  -- enable_line_number  = false,
  -- blacklist           = {},
  -- buttons             = true,

  -- Rich Presence text options
  -- editing_text        = "Editing %s",
  -- file_explorer_text  = "Browsing %s",
  -- git_commit_text     = "Committing changes",
  -- plugin_manager_text = "Managing plugins",
  -- reading_text        = "Reading %s",
  -- workspace_text      = "Working on %s",
  -- line_number_text    = "Line %s out of %s",
})


-- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
-- Text displayed when hovered over the Neovim image
-- Main image display (either "neovim" or "file")
-- Use your own Discord application client id (not recommended)
-- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
-- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
-- Displays the current line number instead of the current project
-- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
-- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
-- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
-- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
-- Format string rendered when committing changes in git (either string or function(filename: string): string)
-- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
-- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
-- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
-- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
