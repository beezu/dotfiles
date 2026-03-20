-- reload HammerSpoon on config file changes
function _G.reloadConfig(files)
  _G.doReload = false
  for _, file in pairs(files) do
    if file:sub(-4) == ".lua" then
      _G.doReload = true
    end
  end
  if doReload then
    hs.reload()
  end
end

hs.alert.show("HammerSpoon config reloaded.")

-- reload Aerospace & Sketchybar if either's config files change
function _G.reloadAerospaceSketchybar()
  _G.aerospaceReload = os.execute("/opt/homebrew/bin/aerospace reload-config")
  _G.sketchybarReload = os.execute("/opt/homebrew/bin/sketchybar --reload")
  hs.alert.show("Aerospace + Sketchybar config reloaded.")
end

_G.spoonWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
_G.sketchybarWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.config/sketchybar", reloadAerospaceSketchybar):start()
_G.aerospaceWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.aerospace.toml", reloadAerospaceSketchybar):start()
