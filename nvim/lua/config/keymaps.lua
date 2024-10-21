-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
vim.keymap.set("n", "<leader>fb", function()
  require("telescope.builtin").buffers({ initial_mode = "normal" })
end, { desc = "Find buffers" })
