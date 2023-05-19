local lsp_status, lspconfig = pcall(require, "lspconfig")
if not lsp_status then
  print("Problem With LSP CONFIG")
  return
end

local cmp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_status then
  print("Problem With AUTOCMP LSP")
  return
end

local capabilities = cmp_nvim_lsp.default_capabilities()

lspconfig["html"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})


lspconfig["cssls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})


lspconfig["tailwindcss"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})


lspconfig["pyright"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})
