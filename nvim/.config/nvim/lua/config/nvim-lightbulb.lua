local _local_1_ = require("nvim-lightbulb")
local setup = _local_1_["setup"]
setup({autocmd = {enabled = true}})
return vim.fn.sign_define("LightBulbSign", {text = "\239\160\181 ", texthl = "", linehl = "", numhl = ""})
