---@module "libs.lume.lume"
local lume = require("libs.lume.lume")

local function createInteractable(posX, posY, sizeX, sizeY)
	local self = {
		x = posX,
		y = posY,
		sizeX = sizeX,
		sizeY = sizeY,
		ableToInteractPlayers = {},
	}

	function self:draw()
		love.graphics.setColor(0, 1, 0)
		love.graphics.rectangle("fill", self.x, self.y, self.sizeX, self.sizeY)
	end

	function self:setAbleToInteract(playerId)
		table.insert(self.ableToInteractPlayers, playerId)
	end

	return self
end

return createInteractable
