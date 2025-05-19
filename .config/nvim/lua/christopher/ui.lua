--show relative line number
vim.opt.relativenumber  = true
vim.opt.number = true

vim.opt.syntax = "on"

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.cmd('set list listchars=nbsp:¬,tab:»·,trail:·,extends:>')

vim.o.winborder = "single"

local function make_floating_preview_opts(opts)
  local new_opts = opts or {}
  new_opts.border = new_opts.border or 'single'
  return new_opts
end

local orig_open_floating_preview = vim.lsp.util.open_floating_preview
vim.lsp.util.open_floating_preview = function(contents, syntax, opts, ...)
  opts = make_floating_preview_opts(opts)
  return orig_open_floating_preview(contents, syntax, opts, ...)
end

-- set lsp icons, underline, sort by severity and disable virtual text
vim.diagnostic.config {
  float = { border = "single" },
  underline = { severity = vim.diagnostic.severity.ERROR },
  virtual_text = false,
  severity_sort = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '󰅚 ',
      [vim.diagnostic.severity.WARN] = ' ',
      [vim.diagnostic.severity.HINT] = '󰌶 ',
      [vim.diagnostic.severity.INFO] = ' ',
    }
  }
}
