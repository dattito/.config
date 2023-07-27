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
            git = true,
          },
          glyphs = {
            folder = {
              default = "",
            },
          },
        },
      },
    },
  },
  -- {
  --   "williamboman/mason.nvim",
  --   lazy = false,
  -- },
  -- {
  --   "williamboman/mason-lspconfig.nvim",
  --   opts = {
  --     automatic_installation = true,
  --   },
  --   lazy = false,
  -- },
  -- {
  --   "neovim/nvim-lspconfig",
  --   config = function()
  --     require "plugins.configs.lspconfig"
  --     require "custom.configs.lspconfig"
  --   end,
  -- },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "nvim-lua/plenary.nvim",
      "jose-elias-alvarez/null-ls.nvim",
    },
    config = function()
      require "custom.configs.null-ls" -- require your null-ls config here (example below)
    end,
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      highlight = {
        disable = { "tex" },
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
        { name = "omni" },
      },
    },
  },
  {
    "lervag/vimtex",
    ft = "tex",
    config = function()
      vim.g.vimtex_compiler_progname = "nvr"

      vim.g.vimtex_compiler_latexmk = {
        out_dir = "output",
      }
    end,
  },
  {
    "CRAG666/code_runner.nvim",
    config = true,
    cmd = {
      "RunCode",
    },
    opts = {
      filetype = {
        go = {
          "cd $dir &&",
          "go run .",
        },
      },
    },
  },
}

return plugins
