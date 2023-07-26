local plugins = {
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      git = {
        enable = true,
      },
      renderer = {
        highlight_git = true,
        icons = {
          show = {
            git = true
          },
          glyphs = {
            folder = {
              default = ""
            },
          },
        },
      },
    },
  },
  {
    "williamboman/mason.nvim",
    lazy = false,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      automatic_installation = true,
    },
    lazy = false,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
    -- dependencies = {
    --   "jose-elias-alvarez/null-ls.nvim",
    --   config = function()
    --     require "custom.configs.null-ls"
    --   end,
    -- },
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      highlight = {
        disable = {"tex"}
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    opts = {
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        -- { name = "buffer" },
        { name = "nvim_lua" },
        { name = "path" },
      },
    },
  },
  {
    "lervag/vimtex",
    ft="tex",
  },
  {
    "CRAG666/code_runner.nvim",
    config = true,
    lazy = false,
    opts = {
      filetype = {
        go = {
          "cd $dir &&",
          "go run ."
        }
      },
    },
  },
}

return plugins
