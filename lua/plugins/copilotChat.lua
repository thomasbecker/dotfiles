return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    lazy = true,
    opts = {
      debug = false, -- Enable debugging
      -- See Configuration section for rest
    },
    keys = {
      { "<leader>bco", "<cmd>CopilotChatOpen<cr>", desc = "Open Copilot chat" },
      { "<leader>bct", "<cmd>CopilotChatOpen<cr>", desc = "Toggle Copilot chat" },
      { "<leader>bce", "<cmd>CopilotChatExplain<cr>", desc = "Copilot explain" },
      { "<leader>bcf", "<cmd>CopilotChatFix<cr>", desc = "Copilot fix" },
      { "<leader>bco", "<cmd>CopilotChatOptimize<cr>", desc = "Copilot optimize" },
      { "<leader>bcc", "<cmd>CopilotChatCommitStaged<cr>", desc = "Copilot write commit message for staged changes" },
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
}
