{
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
                local harpoon = require("harpoon")
                harpoon:setup()
                vim.keymap.set("n", "<leader>a", function()
                        harpoon:list():append()
                end)
        end,
},