local M = {}
M.tmux = {
  plugin = true,
  n = {
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "Window left" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "Window right" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "Window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "Window up" },
  },
}

M.vimtex = {
  plugin = true,
  n = {
    ["<leader>rr"] = { "<cmd> RunCode<CR>", "Run code" },
    ["<leader>ll"] = { "<plug>(vimtex-compile)", "Compile latex" },
    ["<leader>lk"] = { "<plug>(vimtex-stop)", "Stop latex compilation" },
  },
}

M.copilot = {
  plugin = true,
  n = {
    ["<leader>co"] = {
      "<cmd> Copilot toggle<CR>",
      "toggle copilot suggestion",
    },
  },
}

M.harpoon = {
  plugin = true,
  n = {
    ["<leader>pa"] = {
      function()
        require("harpoon.mark").add_file()
      end,
      "Add file to harpoon",
    },
    ["<leader>pu"] = {
      function()
        require("harpoon.ui").toggle_quick_menu()
      end,
      "Toggle harpoon quick menu",
    },
    ["<leader>fh"] = {
      function()
        require("telescope").extensions.harpoon.marks()
      end,
      "Find harpoon marks",
    },
    ["<leader>1"] = {
      function()
        require("harpoon.ui").nav_file(1)
      end,
      "Go to harpoon mark 1",
    },
    ["<leader>2"] = {
      function()
        require("harpoon.ui").nav_file(2)
      end,
      "Go to harpoon mark 2",
    },
    ["<leader>3"] = {
      function()
        require("harpoon.ui").nav_file(3)
      end,
      "Go to harpoon mark 3",
    },
    ["<leader>4"] = {
      function()
        require("harpoon.ui").nav_file(4)
      end,
      "Go to harpoon mark 4",
    },
  },
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>", "Add breakpoint at line" },
    ["<leader>ds"] = {
      function()
        local widgets = require "dap.ui.widgets"
        local sidebar = widgets.sidebar(widgets.scope)
        sidebar.open()
      end,
      "Open debug sidebar",
    },
  },
}

M.dap_go = {
  plugin = true,
  n = {
    ["<leader>dgt"] = {
      function()
        require("dap-go").debug_test()
      end,
      "Debug go test",
    },
    ["<leader>dgl"] = {
      function()
        require("dap-go").debug_last()
      end,
      "Debug last go test",
    },
  },
}

M.translate = {
  plugin = true,
  n = {
    ["<leader>tdy"] = { "<cmd> Translate DE<CR>", "Translate and yank word under cursor to german" },
    ["<leader>tey"] = { "<cmd> Translate EN<CR>", "Translate and yank word under cursor to english" },
    ["<leader>tds"] = { "<cmd> Translate DE -output=floating<CR>", "Translate and show word under cursor to german" },
    ["<leader>tes"] = { "<cmd> Translate EN -output=floating<CR>", "Translate and show word under cursor to english" },
  },
  v = {
    ["<leader>tdy"] = { "<cmd> Translate DE<CR>", "Translate and yank word under cursor to german" },
    ["<leader>tey"] = { "<cmd> Translate EN<CR>", "Translate and yank word under cursor to english" },
    ["<leader>tds"] = { "<cmd> Translate DE -output=floating<CR>", "Translate and show word under cursor to german" },
    ["<leader>tes"] = { "<cmd> Translate EN -output=floating<CR>", "Translate and show word under cursor to english" },
  },
}

M.gopher = {
  plugin = true,
  n = {
    ["<leader>ge"] = { "<cmd> GoIfErr<CR>", "add go 'if err'" },
  },
}

M.oil = {
  plugin = true,
  n = {
    ["-"] = { "<cmd> Oil<CR>", "Open oil file explorer" },
    ["<leader>-"] = {
      function()
        require("oil").close()
      end,
      "close oil",
    },
  },
}

M.zoxide = {
  plugin = true,
  n = {
    ["<leader>fj"] = {
      function()
        require("telescope").extensions.zoxide.list()
      end,
      "Find and change workspace",
    },
  },
}

M.git_worktree = {
  plugin = true,
  n = {
    ["<leader>ft"] = {
      function()
        require("telescope").extensions.git_worktree.git_worktrees()
      end,
      "Find git worktrees",
    },
    ["<leader>fn"] = {
      function()
        require("telescope.builtin").find_files { cwd = "~/.config/nvim" }
      end,
      "Find files in .config",
    },
    ["<leader>fr"] = {
      function()
        require("telescope.builtin").find_files { cwd = "~/repositories" }
      end,
      "Find files in repositories",
    },
  },
}

M.mini_files = {
  plugin = true,
  n = {
    ["<leader>."] = {
      function()
        require("mini.files").open()
      end,
      "Open minifiles",
    },
  },
}

M.lsp_config = {
  plugin = true,
  n = {
    ["<leader>lr"] = {
      "<CMD> LspRestart<CR>",
      "Restart LSP",
    },
  },
}

return M
