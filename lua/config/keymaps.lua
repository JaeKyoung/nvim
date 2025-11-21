-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>h", function()
  local ok, snacks = pcall(require, "snacks")
  if not ok then
    vim.notify("snacks.nvim not loaded", vim.log.levels.WARN)
    return
  end
  if snacks.dashboard and snacks.dashboard.open then
    snacks.dashboard.open()
  elseif snacks.dashboard then
    snacks.dashboard()
  else
    vim.notify("Snacks.dashboard not available", vim.log.levels.WARN)
  end
end, { desc = "Go Home (Dashboard)" })

vim.keymap.set("t", "<Esc>", [[<C-\><C-n><C-w>p]], { desc = "back to work" })

vim.keymap.set("n", "<leader>r", function()
  vim.cmd("silent !ruff check --fix %")
  vim.cmd("edit")
end, { desc = "Ruff fix current file" })


vim.keymap.set("n", "<leader>R", function()
  vim.cmd("silent !ruff check --fix")
  vim.cmd("edit")
end, { desc = "Ruff fix all files" })
