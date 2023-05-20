local opt = vim.opt

opt.relativenumber = true
opt.number = true

opt.tabstop = 2 
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true 

opt.wrap = false

opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true 

opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

opt.clipboard:append("unnamedplus") -- use system clipboard as default register

opt.splitright = true 
opt.splitbelow = true

opt.iskeyword:append("-") 
