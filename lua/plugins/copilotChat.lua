return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    lazy = true,
    opts = {
      debug = false, -- Enable debugging
      mappings = {
        reset = {
          normal = "C-r",
          insert = "C-r",
        },
      },
    },
    keys = {
      { "<leader>bco", "<cmd>CopilotChatOpen<cr>", desc = "Open Copilot chat" },
      { "<leader>bct", "<cmd>CopilotChatOpen<cr>", desc = "Toggle Copilot chat" },
      { mode = { "n", "v" }, "<leader>bce", "<cmd>CopilotChatExplain<cr>", desc = "lopilot explain" },
      { mode = { "n", "v" }, "<leader>bcf", "<cmd>CopilotChatFix<cr>", desc = "Copilot fix" },
      { mode = { "n", "v" }, "<leader>bco", "<cmd>CopilotChatOptimize<cr>", desc = "Copilot optimize" },
      { "<leader>bcc", "<cmd>CopilotChatCommitStaged<cr>", desc = "Copilot write commit message for staged changes" },
      {
        "<leader>bcq",
        function()
          local input = vim.fn.input("Quick Chat: ")
          if input ~= "" then
            require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
          end
        end,
        desc = "Copilot write commit message for staged changes",
      },
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
}
