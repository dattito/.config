local plugins = {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        prompt_prefix = " 󱁴 Search: ",
        file_ignore_patterns = { "node_modules", "^.*/\\.git/?$", "__pycache__", ".conda", "dist" },
        vimgrep_arguments = {
          "rg",
          "-L",
          "--hidden",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--glob=!.git",
        },
      },
    },
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
    ft = {
      "html",
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
      "svelte",
      "vue",
      "tsx",
      "jsx",
      "rescript",
      "xml",
      "php",
      "markdown",
      "astro",
      "glimmer",
      "handlebars",
      "hbs",
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      return require "custom.configs.treesitter"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    init = function()
      require("core.utils").load_mappings "lsp_config"
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
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "LspInfo", "LspInstall", "LspUninstall" },
    build = ":! brew install node go ripgrep",
  },
  {
    "jay-babu/mason-null-ls.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "nvim-lua/plenary.nvim",
      "nvimtools/none-ls.nvim",
    },
    config = function()
      require "custom.configs.null-ls" -- require your null-ls config here (example below)
    end,
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    init = function()
      require("core.utils").load_mappings "vimtex"
    end,
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
        { name = "crates" },
        { name = "nvim_lsp" },
        { name = "copilot" },
        { name = "luasnip" },
        { name = "nvim_lua" },
        { name = "path" },
        { name = "omni" },
      },
    },
  },
  {
    "lervag/vimtex",
    ft = "tex",
    init = function()
      require("core.utils").load_mappings "vimtex"
    end,
    config = function()
      -- vim.g.tex_flavor = "latex"
      -- vim.g.vimtex_compiler_progname = "nvr"

      vim.g.vimtex_quickfix_ignore_filters = {
        "Underfull",
        "Overfull",
        "Empty bibliography",
      }

      -- If statement is always "true", so useless...
      -- if vim.fn.has "wsl" then
      --   vim.g.vimtex_view_general_viewer = "SumatraPDF"
      --   vim.g.vimtex_view_general_options = "-reuse-instance -forward-search @tex @line @pdf"
      -- end

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
        rust = {
          "cargo run",
        },
      },
    },
  },
  {
    "wfxr/minimap.vim",
    cmd = "Minimap",
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
    -- event = "InsertEnter",
    -- enabled = false,
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
    init = function()
      require("core.utils").load_mappings "copilot"
    end,
  },
  {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
    init = function()
      require("core.utils").load_mappings "harpoon"
    end,
    config = function()
      require("telescope").load_extension "harpoon"
    end,
  },
  {
    "jvgrootveld/telescope-zoxide",
    dependencies = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    init = function()
      require("core.utils").load_mappings "zoxide"
    end,
    config = function()
      require("telescope").load_extension "zoxide"
    end,
    build = ":! brew install zoxide",
  },
  {
    "ThePrimeagen/git-worktree.nvim",
    dependencies = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    init = function()
      require("core.utils").load_mappings "git_worktree"
    end,
    config = function()
      require("telescope").load_extension "git_worktree"
    end,
  },
  {
    "ahmedkhalf/project.nvim",
    dependencies = "nvim-telescope/telescope.nvim",
    event = "VeryLazy",
    config = function()
      require("project_nvim").setup {
        scope_chdir = "tab",
        detection_methods = { "pattern" },
      }
    end,
  },
  {
    "uga-rosa/translate.nvim",
    cmd = "Translate",
    init = function()
      require("core.utils").load_mappings "translate"
    end,
    config = function()
      require("translate").setup {
        default = {
          output = "register",
        },
        preset = {
          output = {
            split = {
              append = true,
            },
          },
        },
      }
    end,
  },
  {
    "mfussenegger/nvim-dap",
    init = function()
      require("core.utils").load_mappings "dap"
    end,
  },
  {
    "leoluz/nvim-dap-go",
    -- ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("dap-go").setup(opts)
    end,
    init = function()
      require("core.utils").load_mappings "dap_go"
    end,
  },
  {
    "olexsmir/gopher.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    init = function()
      require("core.utils").load_mappings "gopher"
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },
  {
    "stevearc/oil.nvim",
    cmd = "Oil",
    config = function()
      require("oil").setup {
        view_options = {
          show_hidden = true,
        },
        skip_confirm_for_simple_edits = true,
        cleanup_delay_ms = 500,
      }
    end,
    init = function()
      require("core.utils").load_mappings "oil"
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "natecraddock/workspaces.nvim",
    cmd = {
      "WorkspacesAdd",
      "WorkspacesAddDir",
      "WorkspacesRemove",
      "WorkspacesRemoveDir",
      "WorkspacesRename",
      "WorkspacesList",
      "WorkspacesListDirs",
      "WorkspacesOpen",
      "WorkspacesSyncDirs",
    },
    config = function()
      require("workspaces").setup {
        hooks = {
          open = "Oil",
        },
      }
    end,
  },
  {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    tag = "v0.4.0",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("crates").setup {
        src = {
          cmp = {
            enabled = true,
          },
        },
      }

      local function show_documentation()
        local filetype = vim.bo.filetype
        if vim.tbl_contains({ "vim", "help" }, filetype) then
          vim.cmd("h " .. vim.fn.expand "<cword>")
        elseif vim.tbl_contains({ "man" }, filetype) then
          vim.cmd("Man " .. vim.fn.expand "<cword>")
        elseif vim.fn.expand "%:t" == "Cargo.toml" and require("crates").popup_available() then
          require("crates").show_popup()
        else
          vim.lsp.buf.hover()
        end
      end

      vim.keymap.set("n", "K", show_documentation, { silent = true })
    end,
  },
  {
    "tpope/vim-surround",
    event = "VeryLazy",
  },
  -- {
  --   "simrat39/rust-tools.nvim",
  --   ft = "rust",
  --   dependencies = {
  --     "neovim/nvim-lspconfig",
  --   },
  --   config = function()
  --     local rt = require "rust-tools"
  --
  --     rt.setup {
  --       server = {
  --         on_attach = function(_, bufnr)
  --           -- Hover actions
  --           vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
  --           -- Code action groups
  --           vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
  --         end,
  --       },
  --     }
  --   end,
  -- },
  {
    "kiyoon/treesitter-indent-object.nvim",
    keys = {
      {
        "ai",
        function()
          require("treesitter_indent_object.textobj").select_indent_outer()
        end,
        mode = { "x", "o" },
        desc = "Select context-aware indent (outer)",
      },
      {
        "aI",
        function()
          require("treesitter_indent_object.textobj").select_indent_outer(true)
        end,
        mode = { "x", "o" },
        desc = "Select context-aware indent (outer, line-wise)",
      },
      {
        "ii",
        function()
          require("treesitter_indent_object.textobj").select_indent_inner()
        end,
        mode = { "x", "o" },
        desc = "Select context-aware indent (inner, partial range)",
      },
      {
        "iI",
        function()
          require("treesitter_indent_object.textobj").select_indent_inner(true, "V")
        end,
        mode = { "x", "o" },
        desc = "Select context-aware indent (inner, entire range) in line-wise visual mode",
      },
    },
  },
  -- {
  --   "rust-lang/rust.vim",
  --   ft = "rust",
  --   init = function()
  --     vim.g.rustfmt_autosave = 1
  --   end,
  -- },

  {
    "echasnovski/mini.files",
    version = false,
    -- lazy = false,
    config = function()
      require("mini.files").setup()
    end,
    init = function()
      require("core.utils").load_mappings "mini_files"
    end,
  },
  -- {
  --   "epwalsh/obsidian.nvim",
  --   version = "*", -- recommended, use latest release instead of latest commit
  --   lazy = true,
  --   -- ft = "markdown",
  --   -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  --   event = {
  --     -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --     -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
  --     "BufReadPre ",
  --     "BufNewFile path/to/my-vault/**.md",
  --   },
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --   },
  -- },
  {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      require("hardtime").setup {
        disabled_keys = {
          ["<Up>"] = {},
          ["<Down>"] = {},
          ["<Left>"] = {},
          ["<Right>"] = {},
        },
        restricted_keys = {
          ["h"] = { "n", "x" },
          ["j"] = { "n", "x" },
          ["k"] = { "n", "x" },
          ["l"] = { "n", "x" },
          ["-"] = { "n", "x" },
          ["+"] = { "n", "x" },
          ["gj"] = { "n", "x" },
          ["gk"] = { "n", "x" },
          ["<CR>"] = { "n", "x" },
          ["<C-M>"] = { "n", "x" },
          ["<C-N>"] = { "n", "x" },
          ["<C-P>"] = { "n", "x" },
          ["<Up>"] = { "n", "x" },
          ["<Down>"] = { "n", "x" },
          ["<Left>"] = { "n", "x" },
          ["<Right>"] = { "n", "x" },
        },
      }
    end,
    command = "Hardtime",
  },
  -- {
  --   "folke/noice.nvim",
  --   event = "VeryLazy",
  --   dependencies = {
  --     "MunifTanjim/nui.nvim",
  --     "rcarriga/nvim-notify",
  --   },
  -- },
  {
    "chomosuke/typst-preview.nvim",
    ft = "typst",
    version = "0.1.*",
    build = function()
      require("typst-preview").update()
    end,
  },
  {
    "kaarmu/typst.vim",
    ft = "typst",
    -- lazy = false,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    config = function()
      require("nvim-treesitter.configs").setup {
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            selection_modes = {
              ["@parameter.outer"] = "v", -- charwise
              ["@function.outer"] = "V",  -- linewise
              ["@class.outer"] = "<c-v>", -- blockwise
            },
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["aa"] = { query = "@parameter.outer", desc = "Select outer part of a parameter/argument" },
              ["ia"] = { query = "@parameter.inner", desc = "Select inner part of a parameter/argument" },
            },
          },
          swap = {
            enable = true,
            swap_next = {
              ["<leader>na"] = "@parameter.inner", -- swap parameters/argument with next
              ["<leader>nm"] = "@function.outer",  -- swap function with next
            },
            swap_previous = {
              ["<leader>pa"] = "@parameter.inner", -- swap parameters/argument with prev
              ["<leader>pm"] = "@function.outer",  -- swap function with previous
            },
          },
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              ["]f"] = { query = "@call.outer", desc = "Next function call start" },
              ["]m"] = { query = "@function.outer", desc = "Next method/function def start" },
              ["]c"] = { query = "@class.outer", desc = "Next class start" },
              ["]i"] = { query = "@conditional.outer", desc = "Next conditional start" },
              ["]l"] = { query = "@loop.outer", desc = "Next loop start" },

              ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
              ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
            },
            goto_next_end = {
              ["]F"] = { query = "@call.outer", desc = "Next function call end" },
              ["]M"] = { query = "@function.outer", desc = "Next method/function def end" },
              ["]C"] = { query = "@class.outer", desc = "Next class end" },
              ["]I"] = { query = "@conditional.outer", desc = "Next conditional end" },
              ["]L"] = { query = "@loop.outer", desc = "Next loop end" },
            },
            goto_previous_start = {
              ["[f"] = { query = "@call.outer", desc = "Prev function call start" },
              ["[m"] = { query = "@function.outer", desc = "Prev method/function def start" },
              ["[c"] = { query = "@class.outer", desc = "Prev class start" },
              ["[i"] = { query = "@conditional.outer", desc = "Prev conditional start" },
              ["[l"] = { query = "@loop.outer", desc = "Prev loop start" },
            },
            goto_previous_end = {
              ["[F"] = { query = "@call.outer", desc = "Prev function call end" },
              ["[M"] = { query = "@function.outer", desc = "Prev method/function def end" },
              ["[C"] = { query = "@class.outer", desc = "Prev class end" },
              ["[I"] = { query = "@conditional.outer", desc = "Prev conditional end" },
              ["[L"] = { query = "@loop.outer", desc = "Prev loop end" },
            },
          },
        },
      }

      local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"

      -- vim way: ; goes to the direction you were moving.
      vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
      vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

      -- Optionally, make builtin f, F, t, T also repeatable with ; and ,
      vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f)
      vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F)
      vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t)
      vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T)
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    deps = "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
  },
  {
    "olexsmir/gopher.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    ft = "go",
  },
}

return plugins
