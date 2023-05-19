local status, _ = pcall(vim.cmd, "colorscheme gruvbox")
if not status then 
  print("COLOR SCHEME NOT FOUND")
  return
end
