require('mini.icons').setup({})

require('mini.files').setup({
    vim.keymap.set("n", "<leader>pv", function() MiniFiles.open() end)
})

require('fzf-lua').setup({
    vim.keymap.set("n", "<c-P>", function() require('fzf-lua').files() end, { desc = "Fzf Files" }),
    vim.keymap.set("n", "<c-G>", function() require('fzf-lua').grep() end, { desc = "Fzf grep search" })
})

require('arrow').setup({
    show_icons = true,
    leader_key = ';', 
    buffer_leader_key = 'm',

    vim.keymap.set("n", "H", require("arrow.persist").previous),
    vim.keymap.set("n", "L", require("arrow.persist").next),
    vim.keymap.set("n", "<C-s>", require("arrow.persist").toggle)
})
