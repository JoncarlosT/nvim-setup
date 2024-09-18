local keymaps = require("lazyvim.plugins.lsp.keymaps")
local flutter_path = "/Users/joncarlostavarez/fvm"
local keymap = vim.keymap.set
return {
  -- for DAP support
  {
    "mfussenegger/nvim-dap",
    debugger = {
      enabled = true,
      register_configurations = function()
        require("dap").configurations.dart = {}
        require("dap.ext.vscode").load_launchjs()
      end,
    },
  },
  {
    "akinsho/flutter-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "stevearc/dressing.nvim" },
    config = function()
      keymap("n", "<leader>FS", ":FlutterRun <CR>", {})
      keymap("n", "<leader>FQ", ":FlutterQuit <CR>", {})
      keymap("n", "<leader>FR", ":FlutterRestart <CR>", {})
      keymap("n", "<leader>LR", ":FlutterLspRestart <CR>", {})
      keymap("n", "<leader>FO", ":FlutterOpen <CR>", {})
      keymap("n", "<leader>FD", ":FlutterDevTools <CR>", {})
      keymap("n", "<leader>FC", require("telescope").extensions.flutter.commands, { desc = "Open command Flutter" })

      require("flutter-tools").setup({
        -- (uncomment below line for windows only)
        -- flutter_path = "home/flutter/bin/flutter.bat",

        debugger = {
          -- make these two params true to enable debug mode
          enabled = false,
          run_via_dap = false,
          register_configurations = function(_)
            require("dap").adapters.dart = {
              type = "executable",
              command = vim.fn.stdpath("data") .. "/mason/bin/dart-debug-adapter",
              args = { "flutter" },
            }

            require("dap").configurations.dart = {
              {
                type = "dart",
                request = "launch",
                name = "Launch flutter",
                dartSdkPath = flutter_path,
                flutterSdkPath = flutter_path,
                -- program = "${workspaceFolder}/lib/main.dart",
                -- cwd = "${workspaceFolder}",
              },
            }
            -- uncomment below line if you've launch.json file already in your vscode setup
            -- require("dap.ext.vscode").load_launchjs()
          end,
        },
        -- fvm = true,
        -- root_patterns = { ".git", "pubspec.yaml" },
        dev_log = {
          -- toggle it when you run without DAP
          enabled = true,
          open_cmd = "tabedit",
        },
        dev_tools = {
          autostart = true,
          auto_open_browser = false,
        },
        widget_guides = {
          enabled = true,
        },
        lsp = {
          color = { -- show the derived colours for dart variables
            enabled = true, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
            background = true, -- highlight the background
            background_color = nil, -- required, when background is transparent (i.e. background_color = { r = 19, g = 17, b = 24},)
            foreground = false, -- highlight the foreground
            virtual_text = true, -- show the highlight using virtual text
            virtual_text_str = "■", -- the virtual text character to highlight
          },
          settings = {
            showTodos = true,
            completeFunctionCalls = true,
            analysisExcludedFolders = { flutter_path },
            renameFilesWithClasses = "prompt", -- "always"
            enableSnippets = true,
            updateImportsOnRename = true, -- Whether to update imports and other directives when files are renamed. Required for `FlutterRename` command.
          },
        },
      })
    end,
  },
  -- for dart syntax hightling
  {
    "dart-lang/dart-vim-plugin",
  },
}
