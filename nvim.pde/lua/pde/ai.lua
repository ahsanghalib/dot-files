if not require("config").pde.ai then
  return {}
end

return {
  "Exafunction/codeium.vim",
  event = "BufEnter",
}
