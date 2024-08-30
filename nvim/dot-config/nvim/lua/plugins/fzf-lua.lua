local actions = require("fzf-lua.actions")

return {
  {
    "ibhagwan/fzf-lua",
    opts = {
      files = {
        rg_opts = [[--color=never --files --follow -g "!.git"]],
        fd_opts = [[--color=never --type f --follow --exclude .git]],
        cwd_prompt = false,
        actions = {
          -- ["alt-i"] = { actions.toggle_ignore },
          ["alt-d"] = { actions.toggle_hidden },
          ["alt-h"] = "",
          ["ctrl-g"] = "",
        },
      },
      grep = {
        actions = {
          -- ["alt-i"] = { actions.toggle_ignore },
          ["alt-d"] = { actions.toggle_hidden },
          ["alt-h"] = "",
          ["ctrl-g"] = "",
        },
      },
    },
    keys = {
      {
        "<leader>fd",
        function()
          require("fzf-lua").files({ cwd = "~/.config" })
        end,
        desc = "Find dotfiles",
      },
      {
        "<leader>fp",
        function()
          require("fzf-lua").files({ cwd = require("lazy.core.config").options.root })
        end,
        desc = "Find Plugin File",
      },
      {
        "<leader>fz",
        function()
          require("fzf-lua").files({ cwd = "~/.config/zsh", hidden = true })
        end,
        desc = "Find Zsh Files",
      },
      {
        "<leader>sxd",
        function()
          require("fzf-lua").lsp_declarations()
        end,
        desc = "Find declarations",
      },
      {
        "<leader>sxr",
        function()
          require("fzf-lua").lsp_references()
        end,
        desc = "Find references",
      },
      {
        "<leader>sxf",
        function()
          require("fzf-lua").lsp_finder()
        end,
        desc = "Find lsp finder (all lsp locations, combined view)",
      },
    },
  },
}
