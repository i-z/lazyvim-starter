return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
        omnisharp = false,
        roslyn = function()
          local lspconfig = require("lspconfig")
          lspconfig.roslyn = {
            default_config = {
              cmd = {
                "dotnet",
                "C:/Users/Admin/AppData/Local/nvim/LanguageServer/win-x64/Microsoft.CodeAnalysis.LanguageServer.dll",
                "--logLevel=Information",
                "--extensionLogDirectory=" .. vim.fs.dirname(vim.lsp.get_log_path()),
                "--stdio",
              },

              filetypes = { "cs", "vb" },
              root_dir = lspconfig.util.root_pattern("*.sln", "*.csproj", ".git"),
              init_options = {
                RoslynExtensionsOptions = {
                  EnableAnalyzersSupport = true,
                  EnableImportCompletion = true,
                  AnalyzeOpenDocumentsOnly = false,
                },
              },
              settings = {},
            },
          }

          lspconfig.roslyn.setup({})
          return true
        end,
      },
    },
  },
}
