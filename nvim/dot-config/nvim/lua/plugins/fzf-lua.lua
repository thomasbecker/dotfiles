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
          ["alt-i"] = { actions.toggle_ignore },
          ["alt-d"] = { actions.toggle_hidden },
        },
      },
      grep = {
        actions = {
          ["alt-i"] = { actions.toggle_ignore },
          ["alt-d"] = { actions.toggle_hidden },
        },
      },
    },
  },
}
