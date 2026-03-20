-- Add new spoons to this table
_G.spoonsToLoad = {
  "EmmyLua",
}

-- loop thru spoonsToLoad to load every Spoon
_G.spoonLoaderFunction = function()
  for i = 1, #spoonsToLoad do
    hs.loadSpoon(spoonsToLoad[i])
    print("\"" .. spoonsToLoad[i] .. "\" spoon loaded successfully.")
  end
end

return spoonLoaderFunction()
