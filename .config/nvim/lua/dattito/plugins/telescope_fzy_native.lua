return {
  "nvim-telescope/telescope-fzy-native.nvim",
  dependencies = "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  config = function()
    require("telescope").load_extension("fzy_native")
  end,
}
