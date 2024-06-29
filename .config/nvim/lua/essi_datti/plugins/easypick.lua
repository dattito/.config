return {
  "axkirillov/easypick.nvim",
  dependencies = "nvim-telescope/telescope.nvim",
  config = function()
    local easypick = require("easypick")
    easypick.setup({
      pickers = {
        -- list files that have conflicts with diffs in preview
        {
          name = "conflicts",
          command = "git diff --name-only --diff-filter=U --relative",
          previewer = easypick.previewers.file_diff(),
        },
        {
          name = "execute_just_command",
          command = "just -l|awk 'NR > 1 {print $1}'",
          action = easypick.actions.nvim_commandf("!just %s"),
          previewer = easypick.previewers.default(),
        },
        {
          name = "execute_just_command_floating",
          command = "just -l|awk 'NR > 1 {print $1}'",
          action = easypick.actions.nvim_commandf('!zellij run --floating -- zsh -ic "just %s"'),
          previewer = easypick.previewers.default(),
        },
      },
    })
  end,
  cmd = "Easypick",
  keys = {
    { "<leader>fuu", "<cmd>Easypick execute_just_command<cr>",          desc = "Execute just command" },
    { "<leader>fut", "<cmd>Easypick execute_just_command_floating<cr>", desc = "Execute just command floating" },
  }
}
