local excluded_files =
"{node_modules,target,.venv,.git,__pycache__,dist,build,.terraform,.mypy_cache,.ipynb_checkpoints,.DS_Store,.ruff_cache,.idea}"

return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    {
      "<leader>ff",
      "<cmd>Telescope find_files<cr>",
      desc = "Find files",
    },
    {
      "<leader>fa",
      "<cmd>Telescope find_files follow=true no_ignore=true hidden=true <cr>",
      desc = "Find all files",
    },
    {
      "<leader>fo",
      "<cmd>Telescope oldfiles<cr>",
      desc = "Find old files",
    },
    {
      "<leader>fb",
      "<cmd>Telescope buffers<cr>",
      desc = "Find buffers",
    },
    {
      "<leader>fw",
      "<cmd>Telescope live_grep<cr>",
      desc = "Live grep",
    },
    {
      "<leader>fn",
      "<cmd>Telescope find_files cwd=~/repositories/dotfiles<cr>",
      desc = "Find dotfiles",
    },
    {
      "<leader>fz",
      "<cmd>Telescope current_buffer_fuzzy_find<cr>",
      desc = "Live grep current file",
    },
  },
  cmd = "Telescope",
  opts = {
    defaults = {
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
        "--glob",
        "!" .. excluded_files,
      },
    },
    pickers = {
      find_files = {
        find_command = {
          "fd",
          "--type",
          "f",
          "--strip-cwd-prefix",
          "--hidden",
          "-E",
          excluded_files,
        },
      },
    },
  },
}
