return {
  "kawre/leetcode.nvim",
  build = ":TSUpdate html",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim", -- required by telescope
    "MunifTanjim/nui.nvim",

    -- optional
    "nvim-treesitter/nvim-treesitter",
    -- "rcarriga/nvim-notify",
    "nvim-tree/nvim-web-devicons",

    "3rd/image.nvim",
  },
  lazy = "leetcode.nvim" ~= vim.fn.argv()[1],
  opts = {
    lang = "python3",
    arg = "leetcode.nvim",
    image_support = true,
  },
}
