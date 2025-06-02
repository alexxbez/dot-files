local wezterm = require("wezterm")

config = wezterm.config_builder()

config = {
  automatically_reload_config = true,
  enable_tab_bar = false,
  window_close_confirmation = "NeverPrompt",
  window_decorations = "RESIZE",
  default_cursor_style = "BlinkingBar",
  color_scheme = 'Catppuccin Mocha',
  font = wezterm.font("SauceCodePro Nerd Font Mono"),
  font_size = 12,
  background = {
    {
      source = {
        Color = "#000",
      },
      width = "100%",
      height = "100%",
      opacity = 1.0,
    },
    {
      source = {
        File = "/Users/alexx/Downloads/hallownest.png",
      },
      hsb = {
        hue = 1.0,
        saturation = 1.0,
        brightness = 1.0,
      },
      width = "100%",
      height = "100%",
      horizontal_align = "Center",
      vertical_align = "Middle",
      opacity = 1.0,
      repeat_x = "NoRepeat",
      repeat_y = "NoRepeat",
    },
    {
      source = {
        Color = "#1e1e2e",
      },
      width = "100%",
      height = "100%",
      opacity = 0.90,
    },
  },

  -- Key Bindings

  leader = { key = 'Space', mods = 'CTRL', timeout_milliseconds = 1000, },
  keys = {
    -- Pane navigation with leader + hjkl
    { key = 'h', mods = 'LEADER', action = wezterm.action.ActivatePaneDirection('Left') },
    { key = 'j', mods = 'LEADER', action = wezterm.action.ActivatePaneDirection('Down') },
    { key = 'k', mods = 'LEADER', action = wezterm.action.ActivatePaneDirection('Up') },
    { key = 'l', mods = 'LEADER', action = wezterm.action.ActivatePaneDirection('Right') },

    -- Optional: Split panes
    { key = 'f', mods = 'LEADER', action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
    { key = 'd', mods = 'LEADER', action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } },

    -- Optional: Close pane
    { key = 'w', mods = 'LEADER', action = wezterm.action.CloseCurrentPane { confirm = true } },
  },
}

return config
