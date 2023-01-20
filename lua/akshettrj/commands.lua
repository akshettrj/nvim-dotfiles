local utils = require("akshettrj.utils")

vim.api.nvim_create_user_command("DuplicateAndComment", utils.duplicate_and_comment, {})
