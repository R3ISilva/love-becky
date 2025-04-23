---@module "libs.lume.lume"
local lume = require("libs.lume.lume")

local function createInteractable(posX, posY, sizeX, sizeY, type)
	local self = {
		x = posX,
		y = posY,
		sizeX = sizeX,
		sizeY = sizeY,
		type = type,
	}

	function self:draw()
		love.graphics.setColor(0, 1, 0)
		love.graphics.rectangle("fill", self.x, self.y, self.sizeX, self.sizeY)
	end

	function self:interact(player)
		if self.type == Types.testGet then --- if is to return item
			if player.hand == nil then
				local interactAction = { item = self.type.item }
				return interactAction
			end
		end
		if self.type == Types.testSet then
			if player.hand == Types.testSet.item then
				local interactAction = { item = nil }
				return interactAction
			end
		end

		return nil
	end

	return self
end

Types = {
	testGet = { item = "test_item" },
	testSet = { item = "test_item" },
}

return createInteractable
