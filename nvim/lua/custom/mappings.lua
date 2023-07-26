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
    ["<leader>rr"] = {"<cmd> RunCode<CR>", "Run code"},
    ["<leader>ll"] = {"<plug>(vimtex-compile)", "Compile latex"},
    ["<leader>lk"] = {"<plug>(vimtex-stop)", "Stop latex compilation"},

  }
}

return M
