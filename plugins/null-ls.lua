local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  -- b.formatting.deno_fmt,
  -- b.formatting.prettier,
  b.formatting.prettier.with {
    prefer = "node_modules/.bin",
    -- command = "node_modules/.bin/prettier",
    -- filetypes = { "typescript", "html", "markdown", "css", "tsserver" }
  },

  -- Lua
  b.formatting.stylua,

  -- Shell
  b.formatting.shfmt,
  b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },

  -- cpp
  b.formatting.clang_format,

  -- go
  b.formatting.gofumpt,

  -- python
  b.formatting.black,
  b.diagnostics.pylint
}

null_ls.setup {
  debug = true,
  sources = sources,
}

