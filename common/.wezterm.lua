
local wezterm = require('wezterm')
--local config = {}
local config = wezterm.config_builder()
config.default_prog = {"powershell.exe"}
--config.font = wezterm.font('JetBrains Mono', {weight = "Bold"})
--config.font = wezterm.font('JetBrains Mono', { weight = 400 })
--config.font = wezterm.font('RobotoMono Nerd Font Mono', {weight = 600})
--config.font = wezterm.font('FiraCode Nerd Font', {weight = 400})
config.font = wezterm.font('CaskaydiaCove NF', {weight = 1, foreground = "#bdb8ad"})
--config.font = wezterm.font('CaskaydiaCove NF', {weight = 1, foreground = "#bdb8ad"})
--config.font = wezterm.font('Hack Nerd Font', {weight = 400})
--config.font = wezterm.font('Comic Shanns Regular', {weight = 400})
--config.font = wezterm.font('Comic Mono', {weight = 400})
--config.font = wezterm.font('MesloLGS Nerd Font', {weight = 400})
--config.font = wezterm.font('Cascadia Code NF', {weight = 400})

config.front_end = "OpenGL"
config.font_size = 12
config.window_decorations = "RESIZE"
config.enable_tab_bar = false
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }

config.exit_behavior = 'CloseOnCleanExit'
--config.enable_kitty_keyboard = true
config.enable_csi_u_key_encoding = true

config.colors =
{
    background = "#252525",
    foreground = "#ffffff",
    cursor_bg = "#ffffff",
    cursor_border = "white",
    selection_fg = "white",
    selection_bg = "#1F1F1F",
    --scrollbar_thumb = "red"
    compose_cursor = 'orange',
}

config.window_padding = {
  left = 2,
  right = 0,
  top = 2,
  bottom = 0,
}

config.window_background_opacity = 0.95
config.foreground_text_hsb =
{
  hue = 1.0,
  saturation = 1.0,
  brightness = 2.1, -- Increase brightness
}

wezterm.on('toggle-opacity', function(window, pane)
  local overrides = window:get_config_overrides() or {}
    if overrides.window_background_opacity then
      overrides.window_background_opacity = nil
    else
      overrides.window_background_opacity = 1.0
    end
    window:set_config_overrides(overrides);
end)

config.keys = {
    {
        key = 'B',
        mods = 'CTRL',
        action = wezterm.action.EmitEvent('toggle-opacity'),
    },
    --{ key = '`', mods = 'CTRL', action = wezterm.action.SendKey {key = '`', mods = 'CTRL'} },
    {
        key = '`',
        mods = 'CTRL',
        action = wezterm.action.SendKey{ key = "F13" }
    },
}

return config
