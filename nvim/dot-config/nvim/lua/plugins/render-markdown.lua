return {
    {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
            code = {
                sign = true,
                width = "block",
                -- right_pad = 1,
            },
            heading = {
                sign = true,
                icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
            },
            bullet = {
                enabled = true,
                icons = { "●", "○", "◆", "◇" },
                left_pad = 0,
                right_pad = 0,
                highlight = "RenderMarkdownBullet",
            },
        },
    },
}