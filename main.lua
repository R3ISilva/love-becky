local createPlayer = require("player")
local createInteractable = require("Interactable")

Player1 = createPlayer(100, 100)
Collidables = {
	createInteractable(50, 50, 40, 40),
	createInteractable(150, 150, 40, 40),
}

function love.load()
	-- Background color (set once)
	love.graphics.setBackgroundColor(0.1, 0.1, 0.15) -- dark blue/gray
end

function love.update(dt)
	Player1:handleMovement(dt)

	-- print("Hello, console!")
	-- for _, obj in ipairs(Collidables) do
	-- 	if CheckCollision(Player1, obj) then
	-- 		print("Hello, console!")
	-- 	end
	-- end
end

function love.draw()
	Player1:draw()

	for _, obj in ipairs(Collidables) do
		obj:draw()
	end
end

function CheckCollision(a, b)
	return a.x < b.x + b.sizeX and b.x < a.x + a.sizeX and a.y < b.y + b.sizeY and b.y < a.y + a.sizeY
end
