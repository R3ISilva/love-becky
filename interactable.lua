local function createInteractable(posX, posY, sizeX, sizeY)
	local self = {
		x = posX,
		y = posY,
		sizeX = sizeX,
		sizeY = sizeY,
	}

	function self:draw()
		love.graphics.setColor(0, 1, 0)
		love.graphics.rectangle("fill", self.x, self.y, self.sizeX, self.sizeY)
	end

	return self
end

return createInteractable
