local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

local wk = require("which-key")

wk.register({
    name = "Harpoon",
    ["a"] = {mark.add_file, "Add File to Harpoon"},
    ["h"] = {function () ui.nav_file(1) end, "Navigate to previous file"},
    ["j"] = {function () ui.nav_file(2) end, "Navigate to next file"},
    ["k"] = {function () ui.nav_file(3) end, "Navigate to previous file"},
    ["l"] = {function () ui.nav_file(4) end, "Navigate to next file"},
    ["m"] = {ui.toggle_quick_menu, "Toggle Harpoon menu"},
}, {prefix = "<C-h>"})
wk.register({
  name = "Harpoon Motions",
  ["<C-k>"] = {function () ui.nav_file(1) end, "Navigate to previous file"},
  ["<C-l>"] = {function () ui.nav_file(2) end, "Navigate to next file"},
})
-- vim.keymap.set("n", "<leader>a", mark.add_file, {desc = "Add current file to harpoon"})
-- vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, {desc = "Toggle Harpoon menu"})
--
-- vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end, {desc = "Navigate to previous file"})
-- vim.keymap.set("n", "<C-j>", function() ui.nav_file(2) end, {desc = "Navigate to next file"})
-- vim.keymap.set("n", "<C-k>", function() ui.nav_file(3) end, {desc = "Navigate to previous file"})
-- vim.keymap.set("n", "<C-l>", function() ui.nav_file(4) end, {desc = "Navigate to next file"})
