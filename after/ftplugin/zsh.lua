local cmp = require'cmp'

cmp.setup.buffer {
  sources = {
    { name = "zsh" },
    { name = "spell" },
    { name = "treesitter" }
  }
}
