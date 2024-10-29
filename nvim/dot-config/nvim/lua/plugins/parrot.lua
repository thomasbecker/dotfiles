return {
    {
        "frankroeder/parrot.nvim",
        dependencies = { "ibhagwan/fzf-lua", "nvim-lua/plenary.nvim" },
        -- optionally include "rcarriga/nvim-notify" for beautiful notifications
        config = function()
            require("parrot").setup({
                providers = {
                    anthropic = {
                        api_key = os.getenv("ANTHROPIC_API_KEY"),
                    },
                },
            })
        end,
    },
}
