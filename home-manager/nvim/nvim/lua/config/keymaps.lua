vim.opt.mouse=''

local km = vim.keymap.set

-- Telescope
km("n", "<leader>fg", require("telescope.builtin").live_grep, { desc = "[F]ind in file using Telescope" })
km("n", "<C-f>", function()
    require("telescope.builtin").find_files(require("telescope.themes").get_dropdown({ previewer = false }))
end, { desc = "Telescope [f]ind file" })

-- diagnostics
km("n", "<leader>xx", vim.cmd.TroubleToggle, { desc = "TroubleToggle" })
km(
    "n",
    "<leader>xw",
    "<cmd>TroubleToggle workspace_diagnostics<cr>",
    { desc = "TroubleToggle [W]orkspace" }
)

-- buffer
vim.keymap.del("n", "<S-h>", { desc = "Prev buffer" })
vim.keymap.del("n", "<S-l>", { desc = "Next buffer" })

km({ "n", "i", "v" }, "<A-l>", vim.cmd.bnext, { desc = "Switch to next Buffer" })
km({ "n", "i", "v" }, "<A-h>", vim.cmd.bprev, { desc = "Switch to prev Buffer" })
km("n", "<C-q>", function() vim.cmd("bw"); end, { desc = "Close Buffer" })

-- paste
km("n", "<leader>p", "\"_dP")

-- colors
km("n", "<leader>cc", vim.cmd.ColorizerToggle, { desc = "[C]olorizer" })
km("n", "<leader>cp", vim.cmd.PickColor, { desc = "[P]ick Color" })

-- tmux
km({ "n", "i", "v" }, "<C-h>", vim.cmd.TmuxNavigateLeft)
km({ "n", "i", "v" }, "<C-j>", vim.cmd.TmuxNavigateDown)
km({ "n", "i", "v" }, "<C-k>", vim.cmd.TmuxNavigateUp)
km({ "n", "i", "v" }, "<C-l>", vim.cmd.TmuxNavigateRight)

