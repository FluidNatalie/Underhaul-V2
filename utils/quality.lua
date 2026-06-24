-- 2.0 Library

-- Util library for item. Supports method chaining
-- Sample usage:
-- Item:get("item-name"):mass(20kg):stackSize(10)

local Common = require "common"

local Quality = {}
local qualityName = ""

-- Defines the quality you want to modify
function Quality:get(name)
  qualityName = name
  assert(data.raw["quality"][name], "Quality '"..name.."' not found")
  local quality = data.raw["quality"][name].normal or data.raw["quality"][name]
  setmetatable(quality, self)
  self.__index = self
  return quality
end

-- Creates a new quality by cloning an existing one
function Quality:cloneInto(from, into)
  Common.cloneInto("quality", from, into)
  return Quality:get(into)
end

-- Set the icon of the quality
function Quality:setIcon(filepath, iconsize)
  self.icons = nil
  self.icon = filepath
  self.icon_size = iconsize
  return self
end

function Quality:nextProbability(level)
  self.next_probability = level
  return self
end

function Quality:nextQuality(quality)
  self.next = quality
  return self
end

function Quality:setLevel(level)
  self.level = level
  return self
end

function Quality:hide()
  self.hidden_in_factoriopedia = true
  self.hidden = true
  return self
end

-- Removes the quality altogether
-- Note: this is a bad idea
function Quality:remove()
  data.raw["quality"][qualityName] = nil
  -- Note we don't return self here, as the quality is gone!
end

return Quality