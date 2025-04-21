local function createPlayer(x, y, id)
	local self = {
		x = x,
		y = y,
		sizeX = 40,
		sizeY = 40,
		speed = 200,
		hand = HandState.empty,
		id = id,
	}

	function self:handleMovement(dt, Collidables)
		local oldX, oldY = self.x, self.y

		-- Movement input
		if love.keyboard.isDown("right") then
			self.x = self.x + self.speed * dt
		elseif love.keyboard.isDown("left") then
			self.x = self.x - self.speed * dt
		end

		if love.keyboard.isDown("down") then
			self.y = self.y + self.speed * dt
		elseif love.keyboard.isDown("up") then
			self.y = self.y - self.speed * dt
		end

		return {
			oldX = oldX,
			oldY = oldY,
		}
	end

	function self:draw()
		-- Draw the self as a red rectangle
		love.graphics.setColor(1, 0.2, 0.2) -- red
		love.graphics.rectangle("fill", self.x, self.y, self.sizeX, self.sizeY)

		-- Optional: Reset color for anything else
		love.graphics.setColor(1, 1, 1)
	end

	return self
end

HandState = {
	empty = 0,
	full = 1,
}

return createPlayer
