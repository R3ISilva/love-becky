local createPlayer = require("player")
local createInteractable = require("interactable")

---@module "libs.Slab.API"
local Slab = require("libs.Slab.Slab")

Player1 = createPlayer(100, 100, 1)
Collidables = {
	createInteractable(50, 50, 40, 40, Types.testSet),
	createInteractable(150, 150, 40, 40, Types.testGet),
}

local function handleInteractions()
	if Player1:IsTryingToInteract() then
		for _, obj in ipairs(Collidables) do
			if CheckInteractArea(Player1, obj) then
				local interactAction = obj:interact(Player1)
				Player1:handleInteract(interactAction)
				return
			end
		end
	end
end

function love.load()
	-- Background color (set once)
	love.graphics.setBackgroundColor(0.1, 0.1, 0.15) -- dark blue/gray
	Slab.Initialize()
end

function love.update(dt)
	Slab.Update(dt)
	Slab.BeginWindow("Debug Window", { Title = "Debug Title Window" })

	local oldPosition = Player1:handleMovement(dt)

	for _, obj in ipairs(Collidables) do
		if CheckCollision(Player1, obj) then
			Player1.x, Player1.y = oldPosition.oldX, oldPosition.oldY
		end
	end

	handleInteractions()

	Slab.Text(tostring(Player1.hand))

	Slab.EndWindow()
end

function love.draw()
	Player1:draw()
	Slab.Draw()

	for _, obj in ipairs(Collidables) do
		obj:draw()
	end
end

function CheckCollision(a, b)
	return a.x < b.x + b.sizeX and b.x < a.x + a.sizeX and a.y < b.y + b.sizeY and b.y < a.y + a.sizeY
end

function CheckInteractArea(a, b)
	local interactRange = 20 -- You can tweak this value

	return (a.x - interactRange) < b.x + b.sizeX
		and b.x < a.x + a.sizeX + interactRange
		and (a.y - interactRange) < b.y + b.sizeY
		and b.y < a.y + a.sizeY + interactRange
end
