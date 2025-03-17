return {
  "danielfalk/smart-open.nvim",
  branch = "0.3.x",
  dependencies = {
    "kkharji/sqlite.lua",
    "nvim-telescope/telescope-fzy-native.nvim",
    -- "nvim-telescope/telescope.nvim",
  },
  config = function()
    local telescope = require("telescope")
    telescope.load_extension("smart_open")
    telescope.setup({
      extensions = {
        smart_open = {
          match_algorithm = "fzy",
        },
      },
    })
    local plugin = require("lazy.core.config").plugins["telescope.nvim"]
    require("lazy.core.loader").reload(plugin)
  end,
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
