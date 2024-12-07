return {
  {
    "mfussenegger/nvim-jdtls",
    opts = function(_, opts)
      local home = os.getenv("HOME")
      local path_to_mason = os.getenv("MASON")
      local path_to_mason_packages = path_to_mason .. "/packages"
      local path_to_jdtls = path_to_mason_packages .. "/jdtls"
      local lombok_path = path_to_jdtls .. "/lombok.jar"
      local path_to_jar = vim.fn.glob(path_to_jdtls .. "/plugins/org.eclipse.equinox.launcher_*.jar")
      local path_to_config = path_to_jdtls .. "/config_mac_arm"
      -- opts.root_dir = require("lspconfig.server_configurations.jdtls").default_config.root_dir
      opts.cmd = {
        "java",
        "--enable-preview",
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-Xmx4g",
        "-javaagent:" .. lombok_path,
        "--add-modules=ALL-SYSTEM",
        "--add-opens",
        "java.base/java.util=ALL-UNNAMED",
        "--add-opens",
        "java.base/java.lang=ALL-UNNAMED",
        "-jar",
        path_to_jar,
        "-configuration",
        path_to_config,
      }
      opts.full_cmd = function(full_cmd_opts)
        local jdtls_setup = require("jdtls.setup")
        local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
        local root_dir = jdtls_setup.find_root(root_markers)
        local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
        local cmd = vim.deepcopy(full_cmd_opts.cmd)
        local workspace_dir = home .. "/.cache/jdtls/workspace-" .. project_name
        if project_name then
          vim.list_extend(cmd, {
            -- "-configuration",
            -- opts.jdtls_config_dir(project_name),
            "-data",
            workspace_dir,
          })
        end
        return cmd
      end
      opts.dap = { hotcodereplace = "auto", config_overrides = {} }
      opts.dap_main = {}
      opts.test = true
      opts.server = {
        on_attach = function(_, bufnr)
          -- Create a command `:Format` local to the LSP buffer
          vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
            vim.lsp.buf.format()
          end, { desc = "Format current buffer with LSP" })
        end,
      }
      opts.jdtls = {
        settings = {
          java = {
            references = {
              includeDecompiledSources = true,
            },
            format = {
              enabled = true,
              settings = {
                url = vim.fn.stdpath("config") .. "/lang_server/palantir_java_format.xml",
                -- url = vim.fn.stdpath("config") .. "/lang_server/intellij-java-style.xml",
              },
            },
            eclipse = {
              downloadSources = true,
            },
            maven = {
              downloadSources = true,
            },
            signatureHelp = { enabled = true },
            contentProvider = { preferred = "fernflower" },
            implementationsCodeLens = {
              enabled = true,
            },
            completion = {
              favoriteStaticMembers = {
                "java.util.Objects.requireNonNull",
                "java.util.Objects.requireNonNullElse",
                "org.assertj.core.api.Assertions.*",
                "org.hamcrest.CoreMatchers.*",
                "org.hamcrest.MatcherAssert.assertThat",
                "org.hamcrest.Matchers.*",
                "org.junit.jupiter.api.Assertions.*",
                "org.mockito.Mockito.*",
              },
              filteredTypes = {
                "com.sun.*",
                "io.micrometer.shaded.*",
                "java.awt.*",
                "jdk.*",
                "sun.*",
              },
              importOrder = {
                "com",
                "java",
                "javax",
                "lombok",
                "org",
              },
            },
            sources = {
              organizeImports = {
                starThreshold = 9999,
                staticStarThreshold = 9999,
              },
            },
            codeGeneration = {
              toString = {
                template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
                -- flags = {
                -- 	allow_incremental_sync = true,
                -- },
              },
              useBlocks = true,
            },
            configuration = {
              runtimes = {
                {
                  name = "JavaSE-17",
                  path = "/Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home",
                },
                {
                  name = "JavaSE-21",
                  path = "/Library/Java/JavaVirtualMachines/temurin-21.jdk/Contents/Home",
                },
              },
            },
          },
          -- project = {
          -- 	referencedLibraries = {
          -- 		"**/lib/*.jar",
          -- 	},
          -- },
        },
      }
    end,
  },
}
