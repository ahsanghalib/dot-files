local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_scheme = "3024 Night"
config.font_size = 14
config.font = wezterm.font("JetBrains Mono")

return config
