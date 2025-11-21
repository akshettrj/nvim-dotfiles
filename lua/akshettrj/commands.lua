vim.api.nvim_create_user_command(
  "FixJSONCommas",
  function(opts)
    if opts.range == 2 then
      line1 = opts.line1
      line2 = opts.line2

      final_command = line1 .. "," .. line2
    else
      final_command = "%"
    end

    final_command =  final_command .. [[s/,\(\n\?\s*[\]}]\)/\1]]

    vim.cmd(final_command)
  end,
  { nargs = 0, range = true }
)
