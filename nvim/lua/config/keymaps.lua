-- 1. فتح شجرة الملفات (Space + e)
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", {})

-- 2. [الجديد] زرار العربي (Space + a)
-- بيقلب الشاشة يمين عشان تقرأ العربي معدول، واضغط تاني يرجعها شمال
vim.keymap.set("n", "<leader>a", ":set invrightleft<CR>", { desc = "Toggle Arabic View" })

-- 3. الخروج من التيرمنال (Esc مرتين)
vim.keymap.set('t', '<Esc><Esc>', [[<C-\><C-n>]], {desc = "Exit terminal mode"})

-- 4. تشغيل الكود (F5 - External Window)
vim.keymap.set("n", "<F5>", function()
  vim.cmd("write")
  local filetype = vim.bo.filetype
  local filename = vim.fn.expand("%")
  local command_string = ""

  if filetype == "cpp" then
    local output_name = vim.fn.expand("%:r") .. ".exe"
    command_string = 'start cmd /c "g++ ' .. filename .. ' -o ' .. output_name .. ' && ' .. output_name .. ' & pause"'
  elseif filetype == "python" then
    command_string = 'start cmd /c "python ' .. filename .. ' & pause"'
  else
    print("Run not configured for this file type!")
    return
  end
  vim.cmd("silent !" .. command_string)
end)