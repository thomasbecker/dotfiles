return {
  {
    "frankroeder/parrot.nvim",
    dependencies = { "ibhagwan/fzf-lua", "nvim-lua/plenary.nvim", "rcarriga/nvim-notify" },
    event = "VeryLazy",
    config = function()
      require("parrot").setup({
        providers = {
          anthropic = {
            api_key = os.getenv("ANTHROPIC_API_KEY"),
          },
        },
        cmd_prefix = "Prt",
        chat_conceal_model_params = false,
        user_input_ui = "buffer",
        toggle_target = "tabnew",
        online_model_selection = true,
        command_auto_select_response = true,
        hooks = {
          Complete = function(prt, params)
            local template = [[
        I have the following code from {{filename}}:

        ```{{filetype}}
        {{selection}}
        ```

        Please finish the code above carefully and logically.
        Respond just with the snippet of code that should be inserted."
        ]]
            local model_obj = prt.get_model("command")
            prt.Prompt(params, prt.ui.Target.append, model_obj, nil, template)
          end,
          PRReview = function(prt, params)
            local chat_prompt = [[
        I have the following code from {{filename}}:

        You will be given two inputs:
        
        1. The Pull Request content:
        <pull_request>
        {{PULL_REQUEST}}
        </pull_request>
        
        2. The primary programming language used in the PR:
        <language>
        {{PROGRAMMING_LANGUAGE}}
        </language>
        
        Review Process:
        1. Carefully read through the entire Pull Request, paying close attention to the code changes, commit messages, and any comments or discussions.
        
        2. Assess the overall code quality, considering factors such as:
           - Adherence to best practices and coding standards for the specified programming language
           - Proper use of data structures and algorithms
           - Efficient and optimized code
        
        3. Identify any potential bugs or logical errors in the code. Consider edge cases and possible runtime issues.
        
        4. Evaluate the architectural decisions made in the code changes. Suggest improvements that could enhance scalability, maintainability, or performance.
        
        5. Analyze the readability of the code, including:
           - Appropriate use of comments and documentation
           - Clear and descriptive variable and function names
           - Consistent formatting and indentation
           - Modular and well-organized code structure
        
        6. Detect any typos in variable names, comments, or string literals.
        
        Output Format:
        Provide your review in the following format, enclosed in <review> tags:
        
        <review>
        1. Overall Assessment:
           Briefly summarize the quality of the PR and its potential impact on the codebase.
        
        2. Bugs and Logical Errors:
           List any identified bugs or logical errors, explaining the potential issues and suggesting fixes.
        
        3. Architectural Improvements:
           Propose architectural enhancements that could benefit the code structure, scalability, or performance.
        
        4. Readability Enhancements:
           Suggest improvements for code readability, including better naming conventions, comments, or code organization.
        
        5. Typos:
           Point out any detected typos in the code, comments, or documentation.
        
        6. Additional Comments:
           Provide any other relevant feedback or suggestions not covered in the previous sections.
        </review>
        
        Ensure your review is concise yet comprehensive, focusing on the most critical aspects of the code changes. Provide specific examples and line numbers when referring to particular parts of the code. Be constructive in your feedback, offering clear explanations and suggestions for improvement. 
        ]]
            local model_obj = prt.get_model("command")
            prt.ChatNew(params, chat_prompt)
          end,
          CompleteFullContext = function(prt, params)
            local template = [[
        I have the following code from {{filename}}:

        ```{{filetype}}
        {filecontent}}
        ```

        Please look at the following section specifically:
        ```{{filetype}}
        {{selection}}
        ```

        Please finish the code above carefully and logically.
        Respond just with the snippet of code that should be inserted.
        ]]
            local model_obj = prt.get_model("command")
            prt.Prompt(params, prt.ui.Target.append, model_obj, nil, template)
          end,
          CompleteMultiContext = function(prt, params)
            local template = [[
        I have the following code from {{filename}} and other related files:

        ```{{filetype}}
        {{multifilecontent}}
        ```

        Please look at the following section specifically:
        ```{{filetype}}
        {{selection}}
        ```

        Please finish the code above carefully and logically.
        Respond just with the snippet of code that should be inserted.
        ]]
            local model_obj = prt.get_model("command")
            prt.Prompt(params, prt.ui.Target.append, model_obj, nil, template)
          end,
          Explain = function(prt, params)
            local template = [[
        Your task is to take the code snippet from {{filename}} and explain it with gradually increasing complexity.
        Break down the code's functionality, purpose, and key components.
        The goal is to help the reader understand what the code does and how it works.

        ```{{filetype}}
        {{selection}}
        ```

        Use the markdown format with codeblocks and inline code.
        Explanation of the code above:
        ]]
            local model = prt.get_model("command")
            prt.logger.info("Explaining selection with model: " .. model.name)
            prt.Prompt(params, prt.ui.Target.new, model, nil, template)
          end,
          FixBugs = function(prt, params)
            local template = [[
        You are an expert in {{filetype}}.
        Fix bugs in the below code from {{filename}} carefully and logically:
        Your task is to analyze the provided {{filetype}} code snippet, identify
        any bugs or errors present, and provide a corrected version of the code
        that resolves these issues. Explain the problems you found in the
        original code and how your fixes address them. The corrected code should
        be functional, efficient, and adhere to best practices in
        {{filetype}} programming.

        ```{{filetype}}
        {{selection}}
        ```

        Fixed code:
        ]]
            local model_obj = prt.get_model("command")
            prt.logger.info("Fixing bugs in selection with model: " .. model_obj.name)
            prt.Prompt(params, prt.ui.Target.new, model_obj, nil, template)
          end,
          Optimize = function(prt, params)
            local template = [[
        You are an expert in {{filetype}}.
        Your task is to analyze the provided {{filetype}} code snippet and
        suggest improvements to optimize its performance. Identify areas
        where the code can be made more efficient, faster, or less
        resource-intensive. Provide specific suggestions for optimization,
        along with explanations of how these changes can enhance the code's
        performance. The optimized code should maintain the same functionality
        as the original code while demonstrating improved efficiency.

        ```{{filetype}}
        {{selection}}
        ```

        Optimized code:
        ]]
            local model_obj = prt.get_model("command")
            prt.logger.info("Optimizing selection with model: " .. model_obj.name)
            prt.Prompt(params, prt.ui.Target.new, model_obj, nil, template)
          end,
          UnitTests = function(prt, params)
            local template = [[
        I have the following code from {{filename}}:

        ```{{filetype}}
        {{selection}}
        ```

        Please respond by writing table driven unit tests for the code above.
        ]]
            local model_obj = prt.get_model("command")
            prt.logger.info("Creating unit tests for selection with model: " .. model_obj.name)
            prt.Prompt(params, prt.ui.Target.enew, model_obj, nil, template)
          end,
          Debug = function(prt, params)
            local template = [[
        I want you to act as {{filetype}} expert.
        Review the following code, carefully examine it, and report potential
        bugs and edge cases alongside solutions to resolve them.
        Keep your explanation short and to the point:

        ```{{filetype}}
        {{selection}}
        ```
        ]]
            local model_obj = prt.get_model("command")
            prt.logger.info("Debugging selection with model: " .. model_obj.name)
            prt.Prompt(params, prt.ui.Target.enew, model_obj, nil, template)
          end,
          CommitMsg = function(prt, params)
            local futils = require("parrot.file_utils")
            if futils.find_git_root() == "" then
              prt.logger.warning("Not in a git repository")
              return
            else
              local template = [[
          I want you to act as a commit message generator. I will provide you
          with information about the task and the prefix for the task code, and
          I would like you to generate an appropriate commit message using the
          conventional commit format. Do not write any explanations or other
          words, just reply with the commit message.
          Start with a short headline as summary but then list the individual
          changes in more detail.

          Here are the changes that should be considered by this message:
          ]] .. vim.fn.system("git diff --no-color --no-ext-diff --staged")
              local model_obj = prt.get_model("command")
              prt.Prompt(params, prt.ui.Target.append, model_obj, nil, template)
            end
          end,
          SpellCheck = function(prt, params)
            local chat_prompt = [[
        Your task is to take the text provided and rewrite it into a clear,
        grammatically correct version while preserving the original meaning
        as closely as possible. Correct any spelling mistakes, punctuation
        errors, verb tense issues, word choice problems, and other
        grammatical mistakes.
        ]]
            prt.ChatNew(params, chat_prompt)
          end,
          CodeConsultant = function(prt, params)
            local chat_prompt = [[
          Your task is to analyze the provided {{filetype}} code and suggest
          improvements to optimize its performance. Identify areas where the
          code can be made more efficient, faster, or less resource-intensive.
          Provide specific suggestions for optimization, along with explanations
          of how these changes can enhance the code's performance. The optimized
          code should maintain the same functionality as the original code while
          demonstrating improved efficiency.

          Here is the code
          ```{{filetype}}
          {{filecontent}}
          ```
        ]]
            prt.ChatNew(params, chat_prompt)
          end,
          ProofReader = function(prt, params)
            local chat_prompt = [[
        I want you to act as a proofreader. I will provide you with texts and
        I would like you to review them for any spelling, grammar, or
        punctuation errors. Once you have finished reviewing the text,
        provide me with any necessary corrections or suggestions to improve the
        text. Highlight the corrected fragments (if any) using markdown backticks.

        When you have done that subsequently provide me with a slightly better
        version of the text, but keep close to the original text.

        Finally provide me with an ideal version of the text.

        Whenever I provide you with text, you reply in this format directly:

        ## Corrected text:

        {corrected text, or say "NO_CORRECTIONS_NEEDED" instead if there are no corrections made}

        ## Slightly better text

        {slightly better text}

        ## Ideal text

        {ideal text}
        ]]
            prt.ChatNew(params, chat_prompt)
          end,
          ProofReadCurrentFile = function(prt, params)
            local template = [[
        I want you to act as a proofreader. I will provide you with a text at
        the end of this prompt and I would like you to review them for any
        spelling, grammar, or punctuation errors. Once you have finished
        reviewing the text, provide me with any necessary corrections or
        suggestions to improve the text. Highlight the corrected fragments (if
        any) using markdown backticks.

        When you have done that subsequently provide me with a slightly better
        version of the text, but keep close to the original text.

        Finally provide me with an ideal version of the text.

        Whenever I provide you with text, you reply in this format directly:

        ## Corrected text:

       {corrected text, or say "NO_CORRECTIONS_NEEDED" instead if there are no
       corrections made}

        ## Slightly better text

        {slightly better text}

        ## Ideal text

        {ideal text}

        Here is the text I want you to proof read:
        ```{{filetype}}
        {{filecontent}}
        ```
        ]]
            local model_obj = prt.get_model("command")
            prt.logger.info("Proof reading current file: " .. model_obj.name)
            prt.Prompt(params, prt.ui.Target.vnew, model_obj, nil, template)
          end,
        },
      })
    end,
    keys = {
      { "<C-g>c", "<cmd>PrtChatNew<cr>", mode = { "n", "i" }, desc = "New Chat" },
      { "<C-g>c", ":<C-u>'<,'>PrtChatNew<cr>", mode = { "v" }, desc = "Visual Chat New" },
      { "<C-g>t", "<cmd>PrtChatToggle<cr>", mode = { "n", "i" }, desc = "Toggle Popup Chat" },
      { "<C-g>f", "<cmd>PrtChatFinder<cr>", mode = { "n", "i" }, desc = "Chat Finder" },
      { "<C-g>r", "<cmd>PrtRewrite<cr>", mode = { "n", "i" }, desc = "Inline Rewrite" },
      { "<C-g>r", ":<C-u>'<,'>PrtRewrite<cr>", mode = { "v" }, desc = "Visual Rewrite" },
      {
        "<C-g>j",
        "<cmd>PrtRetry<cr>",
        mode = { "n" },
        desc = "Retry rewrite/append/prepend command",
      },
      { "<C-g>a", "<cmd>PrtAppend<cr>", mode = { "n", "i" }, desc = "Append" },
      { "<C-g>a", ":<C-u>'<,'>PrtAppend<cr>", mode = { "v" }, desc = "Visual Append" },
      { "<C-g>o", "<cmd>PrtPrepend<cr>", mode = { "n", "i" }, desc = "Prepend" },
      { "<C-g>o", ":<C-u>'<,'>PrtPrepend<cr>", mode = { "v" }, desc = "Visual Prepend" },
      { "<C-g>e", ":<C-u>'<,'>PrtEnew<cr>", mode = { "v" }, desc = "Visual Enew" },
      { "<C-g>s", "<cmd>PrtStop<cr>", mode = { "n", "i", "v", "x" }, desc = "Stop" },
      {
        "<C-g>i",
        ":<C-u>'<,'>PrtComplete<cr>",
        mode = { "n", "i", "v", "x" },
        desc = "Complete visual selection",
      },
      { "<C-g>x", "<cmd>PrtContext<cr>", mode = { "n" }, desc = "Open context file" },
      { "<C-g>n", "<cmd>PrtModel<cr>", mode = { "n" }, desc = "Select model" },
      { "<C-g>p", "<cmd>PrtProvider<cr>", mode = { "n" }, desc = "Select provider" },
      { "<C-g>q", "<cmd>PrtAsk<cr>", mode = { "n" }, desc = "Ask a question" },
    },
  },
}
