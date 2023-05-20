local mason_status, mason = pcall(require, "mason")
if not mason_status then
  print("ISSUE WITH MASON")
  return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
  print("ISSUE WITH MASON-LSPCONFIG") 
  return
end

local mason_null_status, mason_null = pcall(require, "mason-null-ls")
if not mason_null_status  then
  print("ISSUE WITH MASON-LSPCONFIG") 
  return
end


mason.setup()

mason_lspconfig.setup({
    ensure_installed = { 
        "clangd", 
        "html", 
        "cssls", 
        "tailwindcss", 
        "pyright", 
        "marksman",

      },
})

mason_null.setup( {
ensure_installed = {
    "prettier",
    "eslind_d",
  }
})
