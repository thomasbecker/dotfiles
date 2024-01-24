return {
  {
    "mfussenegger/nvim-dap",
    keys = {
      {
        "<leader>dO",
        function()
          require("dap").step_out()
        end,
        desc = "Step Out",
      },
      {
        "<leader>do",
        function()
          require("dap").step_over()
        end,
        desc = "Step Over",
      },
      {
        "<leader>dS",
        function()
          require("dap").stop()
        end,
        desc = "Stop",
      },
    },
  },
  {
    "leoluz/nvim-dap-go",
    opts = {
      dap_configurations = {
        {
          type = "go",
          name = "Attach remote",
          mode = "remote",
          request = "attach",
        },
      },
      delve = {
        port = 38697,
      },
    },
  },
}
