local files =
{
  'custom_runtimes',    -- Plugin Development
  'packer_plugin',      -- Plugin Manager
  'settings',           -- Personal Settings
  -- PLUGINS <<<
  'nvim_cmp_plugin',
  'bufferline_plugin',
  'indentline_plugin',
  'lualine_plugin',
  'telescope_plugin',
  'treesitter_plugin',
  'vimwiki_plugin',
  'comment',
  'firenvim_plugin',
  'which_key_plugin',
  'gitsigns_plugin',
  'contextprint_plugin',
  'copilot_plugin',
  'jupyter_ascending_plugin',
  'toggleterm_nvim_plugin',
  'luasnip_plugin',
  'ts-manipulator_plugin',
  -- 'dc_presence_plugin',
  -- >>>
  'colorscheme',
  'autocommands',
  'keymappings',
  'my_lsp_config',
}

for _, plugin in ipairs(files) do
  require(plugin)
end
