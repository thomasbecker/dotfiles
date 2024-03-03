return {
  {
    "mfussenegger/nvim-jdtls",
    opts = {
      cmd = {
        vim.fn.exepath("jdtls"),
        "--jvm-arg=" .. string.format("-javaagent:%s", vim.fn.expand("$MASON/share/jdtls/lombok.jar")),
      },
    },
  },
}
