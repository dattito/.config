local M = {}

M.tmux = {
  n = {
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "Window left" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "Window right" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "Window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "Window up" },
  },
}

M.vimtex = {
  n = {
    ["<leader>rr"] = { "<cmd> RunCode<CR>", "Run code" },
    ["<leader>ll"] = { "<plug>(vimtex-compile)", "Compile latex" },
    ["<leader>lk"] = { "<plug>(vimtex-stop)", "Stop latex compilation" },
  },
}

M.copilot = {
  i = {
    ["<C-u>"] = {
      function()
        require("copilot.suggestion").accept()
      end,
      "accept copilot suggestion",
    },
  },
  n = {
    ["<leader>co"] = {
      function()
        require("copilot.suggestion").toggle_auto_trigger()
      end,
      "toggle copilot suggestion",
    },
  },
}

return M
