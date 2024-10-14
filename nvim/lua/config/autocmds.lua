-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
local function compile_and_run_cpp()
  -- Get the current file name and check if it's a C++ file
  local file_name = vim.fn.expand("%")
  if string.match(file_name, "%.cpp$") then
    -- Get the executable name by removing the .cpp extension
    local exe_name = string.gsub(file_name, "%.cpp$", "")

    -- Compile the C++ file
    local compile_cmd = string.format("g++ -std=c++11 -Wall -Wextra -Wpedantic -O2 -o %s %s", exe_name, file_name)
    vim.cmd("write") -- Save the file
    vim.fn.system(compile_cmd)

    if vim.v.shell_error == 0 then
      local cmd = string.format("gnome-terminal -- bash -c '%s; read -p \"\nPress enter to exit...\"'", exe_name)
      os.execute(cmd)
    else
      print("Compilation failed!")
    end
  else
    print("Not a C++ file")
  end
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = "cpp", -- Only apply for C++ files
  callback = function()
    vim.api.nvim_buf_set_keymap(
      0,
      "n",
      "<leader>r",
      "",
      { noremap = true, silent = true, desc = "Compile and Run C++", callback = compile_and_run_cpp }
    )
  end,
})
