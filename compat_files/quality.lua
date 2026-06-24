local Common = require "utils.common"
local Recipe = require "utils.recipe"
local Tech = require "utils.tech"
local Quality = require "utils.quality"

-- 2.1 Fixes

--Recycler recipe balance
Recipe:get("recycler"):setIngredients({
  {type= "item", name= "iron-gear-wheel", amount= 20},
  {type= "item", name= "steel-plate", amount= 10},
  {type= "item", name= "concrete", amount= 10},
  {type= "item", name= "advanced-circuit", amount= 5},
})
:setProducts({
  {type= "item", name= "recycler", amount= 1},
})
Tech:get("recycling"):setPrerequisites({"concrete", "modules"}):setColors("RG"):setCost(500)


Tech:get("epic-quality"):setPrerequisites({"modules"}):setColors("RG"):setCost(500):setEffects({
  {type="unlock-quality", quality="rare"}
})
Tech:get("legendary-quality"):setPrerequisites({"epic-quality"}):setColors("RGBP"):setCost(500):setEffects({
  {type="unlock-quality", quality="legendary"}
})

Tech:get("quality-module"):remove()
Tech:get("quality-module-2"):remove()
Tech:get("quality-module-3"):remove()

if mods["quality"] then
-- Change module tech to unlock the modules and then disable the originals
Tech:get("modules"):setEffects({
  {type="unlock-recipe", recipe="efficiency-module"},
  {type="unlock-recipe", recipe="productivity-module"},
  {type="unlock-recipe", recipe="speed-module"},
  {type="unlock-recipe", recipe="quality-module"}
})
end

if mods["quality"] then
-- Create the Modules 2 Tech
Tech:get("speed-module-2"):setCost(200):setEffects({
  {type="unlock-recipe", recipe="speed-module-2"},
  {type="unlock-recipe", recipe="efficiency-module-2"},
  {type="unlock-recipe", recipe="productivity-module-2"}
})
data.raw["technology"]["speed-module-2"].icons = nil
data.raw["technology"]["speed-module-2"].icon = "__underhaulV2__/graphics/technology/quality_module_tech_2.png"
data.raw["technology"]["speed-module-2"].icon_size = 256
end

if mods["quality"] then
-- Create the Modules 3 Tech
Tech:get("speed-module-3"):setCost(1000):setEffects({
  {type="unlock-recipe", recipe="speed-module-3"},
  {type="unlock-recipe", recipe="efficiency-module-3"},
  {type="unlock-recipe", recipe="productivity-module-3"},
  {type="unlock-recipe", recipe="quality-module-3"}
})
data.raw["technology"]["speed-module-3"].icons = nil
data.raw["technology"]["speed-module-3"].icon = "__underhaulV2__/graphics/technology/quality_module_tech_3.png"
data.raw["technology"]["speed-module-3"].icon_size = 256
end

Quality:get("normal"):nextProbability(1):nextQuality("rare"):setIcon("__underhaulV2__/graphics/icons/normal_line.png", 64)

Quality:get("uncommon"):remove()
Quality:get("rare"):nextProbability(2):setLevel(1):nextQuality("legendary"):setIcon("__underhaulV2__/graphics/icons/uncommon_line.png", 64)
Quality:get("epic"):remove()
Quality:get("legendary"):setLevel(2):setIcon("__underhaulV2__/graphics/icons/rare_line.png", 64)

data.raw["tips-and-tricks-item"]["quality"] = nil
data.raw["tips-and-tricks-item"]["quality-factoriopedia"] = nil
data.raw["tips-and-tricks-item"]["quality-modules"] = nil
data.raw["tips-and-tricks-item"]["quality-probabilities"] = nil