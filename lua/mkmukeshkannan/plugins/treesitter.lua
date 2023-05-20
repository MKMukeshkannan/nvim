local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
  return
end

treesitter.setup({
  highlight = {
    enable = true,
  },
  
  indent = { enable = true },
  autotag = { enable = true },

  ensure_installed = {
    "json",
    "javascript",
    "typescript",
    "tsx",
    "html",
    "css",
    "markdown",
    "markdown_inline",
    "bash",
    "lua",
  },
  -- auto install above language parsers
  auto_install = true,
})
