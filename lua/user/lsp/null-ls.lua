local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

local code_actions = null_ls.builtins.code_actions
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup {
  debug = false,
  sources = {
    code_actions.eslint, -- js,ts
    code_actions.refactoring, -- Martin Fowler Refactoring
    -- null_ls.builtins.code_actions.gitsigns,
    -- null_ls.builtins.code_actions.jdtls,
    code_actions.shellcheck,

    formatting.prettier.with { extra_args = { "--single-quote", "--jsx-single-quote" } },
    -- formatting.deno_fmt,
    formatting.black.with { extra_args = { "--fast" } },
    -- formatting.black.with { extra_args = { "--line-length=160" } }, -- for Python
    formatting.reorder_python_imports, -- for reordering Python imports
    formatting.stylua, -- for Lua
    formatting.google_java_format, -- Java
    formatting.astyle, -- Java and others
    formatting.jq, -- JSON
    formatting.markdownlint, -- Markdown
    formatting.pg_format, -- SQL
    -- formatting.stylelint, -- css
    formatting.terraform_fmt, -- Terraform
    formatting.shellharden,

    -- diagnostics.flake8.with { extra_args = { "--ignore=E501" } }, -- for work project
    diagnostics.flake8.with { extra_args = { "--format", "default", "--stdin-display-name", "$FILENAME", "-", "--line-length", "160" } },
    -- diagnostics.mypy, -- static type checker for Python
    -- diagnostics.vulture, -- finds unused code in Python
    diagnostics.eslint, -- js - needs configuring
    diagnostics.gitlint, -- for git commit messages
    diagnostics.hadolint, -- for Dockerfiles
    diagnostics.jsonlint, -- for JSON
    diagnostics.markdownlint, -- for Markdown
    diagnostics.yamllint, -- for YAML
    -- diagnostics.stylelint, -- css - needs configuring
    diagnostics.shellcheck,

    null_ls.builtins.hover.dictionary, -- word definitions
  },
}
