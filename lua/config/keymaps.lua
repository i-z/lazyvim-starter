-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>ob", function()
  local file = vim.fn.expand("%:p")
  if vim.fn.has("win32") == 1 then
    vim.cmd("silent !powershell.exe -NoProfile -ExecutionPolicy Bypass -Command \"Start-Process '" .. file .. "'\"")
  elseif vim.fn.has("macunix") == 1 then
    vim.fn.jobstart({ "open", file }, { detach = true })
  else
    vim.fn.jobstart({ "xdg-open", file }, { detach = true })
  end
end, { desc = "Open file in browser" })
