local opt = vim.opt

opt.cursorline = false
opt.number = true -- Print line number
opt.relativenumber = true -- Relative line numbers
opt.hlsearch = false -- highlight search
opt.incsearch = true -- incremental search
opt.scrolloff = 4 -- scroll offset
opt.clipboard = "unnamedplus" -- sync clipboard with os
opt.breakindent = true

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

opt.swapfile = false

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("arduinoCommentString", { clear = true }),
  pattern = { "ino", "arduino" },
  callback = function(ev)
    -- Set single-line comment string
    vim.bo[ev.buf].commentstring = "// %s"

    -- Configure block comments: s1:/* (start), mb:* (middle), ex:*/ (end)
    vim.bo[ev.buf].comments = "s1:/*,mb:*,ex:*/"
  end,
})

-- opt.cinoptions:append(":0") -- switch statement indentations
