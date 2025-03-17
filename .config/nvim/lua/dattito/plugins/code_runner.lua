return {
  "CRAG666/code_runner.nvim",
  config = true,
  cmd = "RunCode",
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
      gleam = "gleam run"
    },
  },
  keys = {
    { "<leader>rr", "<cmd>RunCode<cr>", desc = "Run code" },
  },
}
