-- add new binds here, following existing format.
-- Structure:
--  { modifier(s) },
--  hotkey,
--  function,
--  friendly name

local binds = {
  {

    {
      "ctrl",
      "shift",
    },
    "V",
    function()
      hs.eventtap.keyStrokes(hs.pasteboard.getContents())
    end,
    "Type clipboard",
  },

  {
    {
      "cmd",
    },
    "return",
    function()
      local t = os.execute("open -n /Applications/Alacritty.app")
      return t
    end,
    "Open Alacritty",
  },

  {
    {
      "alt",
    },
    "f",
    function()
      local t = os.execute("open -n /Applications/Zen.app")
      return t
    end,
    "Open Zen Browser",
  },

  {
    {
      "alt",
    },
    "m",
    function()
      hs.application.launchOrFocus("Music")
    end,
    "Open Music",
  },

  {
    {
      "ctrl",
      "shift",
    },
    "n",
    function()
      local t = hs.itunes.next()
      return t
    end,
    "Music - Next Track",
  },

  {
    {
      "ctrl",
      "shift",
    },
    "p",
    function()
      local t = hs.itunes.previous()
      return t
    end,
    "Music - Previous Track",
  },

  {
    {
      "ctrl",
      "shift",
    },
    "s",
    function()
      local t = hs.itunes.playpause()
      return t
    end,
    "Music - Pause/Resume playback",
  },



  {
    {
      "alt",
    },
    "r",
    function()
      local t = os.execute("/opt/homebrew/bin/aerospace reload-config && /opt/homebrew/bin/sketchybar --reload")
      return t
    end,
    "Aerospace config reload",
  },

  {
    {
      "cmd",
      "alt",
      "ctrl",
    },
    "7",
    function()
      hs.application.launchOrFocus("Safari")
      local safari = hs.appfinder.appFromName("Safari")

      local str_default = { "Develop", "User Agent", "Default (Automatically Chosen)" }
      local str_edge = { "Develop", "User Agent", "Microsoft Edge — macOS" }
      local str_chrome = { "Develop", "User Agent", "Google Chrome — Windows" }

      local default = safari:findMenuItem(str_default)
      local edge = safari:findMenuItem(str_edge)
      local chrome = safari:findMenuItem(str_chrome)

      if (default and default["ticked"]) then
        safari:selectMenuItem(str_edge)
        hs.alert.show("Edge")
      end
      if (edge and edge["ticked"]) then
        safari:selectMenuItem(str_chrome)
        hs.alert.show("Chrome")
      end
      if (chrome and chrome["ticked"]) then
        safari:selectMenuItem(str_default)
        hs.alert.show("Safari")
      end
    end,
    "Set Safari user Agent",
  },

}

local bindLoader = function()
  for _, bind in pairs(binds) do
    hs.hotkey.bind(bind[1], bind[2], bind[3])
    print("\"" .. bind[4] .. "\" keybind loaded successfully.")
  end
end

return bindLoader()
