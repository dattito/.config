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
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      return require "custom.configs.treesitter"
    end,
  },
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
    build = ":! brew install node go",
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
        { name = "copilot" },
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
      vim.g.tex_flavor = "latex"
      vim.g.vimtex_compiler_progname = "nvr"

      vim.g.vimtex_quickfix_ignore_filters = {
        "Underfull",
        "Overfull",
        "Empty bibliography",
      }

      if vim.fn.has "wsl" then
        vim.g.vimtex_view_general_viewer = "SumatraPDF"
        vim.g.vimtex_view_general_options = "-reuse-instance -forward-search @tex @line @pdf"
      end

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
        yaml = "kubectl apply -f $file",
        go = {
          "cd $dir &&",
          "go run .",
        },
      },
    },
  },
  {
    "wfxr/minimap.vim",
    event = { "BufReadPre", "BufNewFile" },
    init = function()
      vim.g.minimap_width = 14
      vim.g.minimap_auto_start = 1
      vim.g.minimap_git_colors = 1
    end,
    build = ":! brew install code-minimap",
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    dependencies = {
      "zbirenbaum/copilot-cmp",
    },
    config = function()
      require("copilot").setup {
        suggestion = {
          enabled = false,
          auto_trigger = true,
        },
        panel = {
          enabled = false,
        },
      }
      require("copilot_cmp").setup()
    end,
  },
}

return plugins
