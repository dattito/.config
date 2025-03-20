return {
  "chomosuke/typst-preview.nvim",
  ft = "typst",
  version = "1.*",
  opts = {
    get_main_file = function(path_of_buffer)
      local buffer_dir = vim.fn.fnamemodify(path_of_buffer, ":p:h")
      local current_dir = buffer_dir
      local drive = vim.fn.fnamemodify(current_dir, ":p:h:h") == "" and vim.fn.fnamemodify(current_dir, ":p:h")

      -- Search up the directory hierarchy for main.typ
      while current_dir ~= drive do
        local main_file = current_dir .. "/main.typ"
        if vim.fn.filereadable(main_file) == 1 then
          return main_file
        end
        -- Move up to parent directory
        current_dir = vim.fn.fnamemodify(current_dir, ":h")
      end

      -- If we reach here, no main.typ was found in parent directories
      return path_of_buffer
    end,
  }, -- lazy.nvim will implicitly calls `setup {}`
  keys = {
    {
      "<leader>tt",
      "<cmd>TypstPreviewToggle<cr>",
      desc = "Typst Preview Toggle",
    },
    {
      "<leader>ts",
      "<cmd>TypstPreviewSyncCursor<cr>",
      desc = "Typst Preview Sync Cursor",
    },
  },
  cmd = "TypstPreviewToggle",
}
