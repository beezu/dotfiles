local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "bee.lsp.mason"
require("bee.lsp.handlers").setup()
require "bee.lsp.null-ls"
