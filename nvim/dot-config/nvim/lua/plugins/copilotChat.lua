return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    lazy = true,
    opts = {
      debug = false, -- Enable debugging
      mappings = {
        reset = {
          normal = "C-x",
          insert = "C-x",
        },
      },
      window = {
        width = 0.6,
      },
    },

    --   local chat = require("CopilotChat")
    --   require("CopilotChat.integrations.cmp").setup()
    --
    --   vim.api.nvim_create_autocmd("BufEnter", {
    --     pattern = "copilot-chat",
    --     callback = function()
    --       vim.opt_local.relativenumber = true
    --       vim.opt_local.number = false
    --     end,
    --   })
    --   chat.setup(opts)
    -- end,

    keys = {
      { mode = { "n", "v" }, "<leader>ae", "<cmd>CopilotChatExplain<cr>", desc = "Copilot explain" },
      { mode = { "n", "v" }, "<leader>af", "<cmd>CopilotChatFix<cr>", desc = "Copilot fix" },
      { mode = { "n", "v" }, "<leader>ao", "<cmd>CopilotChatOptimize<cr>", desc = "Copilot optimize" },
      {
        mode = { "n", "v" },
        "<leader>ac",
        "<cmd>CopilotChatCommitStaged<cr>",
        desc = "Copilot write commit message for staged changes",
      },
    },
  },
}
