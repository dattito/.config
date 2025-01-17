return {
  "danielfalk/smart-open.nvim",
  branch = "0.2.x",
  config = function()
    require("telescope").load_extension("smart_open")
  end,
  dependencies = {
    "kkharji/sqlite.lua",
    -- Only required if using match_algorithm fzf
    "nvim-lua/plenary.nvim",

    { "nvim-telescope/telescope-fzy-native.nvim"},
    "nvim-telescope/telescope.nvim",
  },
  keys = {
    {
      "<leader><leader>",
      function()
        require("telescope").extensions.smart_open.smart_open({
          match_algorithm = "fzy",
        })
      end,
      desc = "Find files",
    },
  },
}
