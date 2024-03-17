local mod = RegisterMod("Restart", 1)

local startTime = 0 -- Start time in milliseconds
local seconds=0
local stop = false

local function FasterRestart(_,_,_, buttonAction)



	local room = Game():GetLevel()
	local currentStage = room:GetStage()



	if Input.IsActionTriggered(ButtonAction.ACTION_RESTART,0) and buttonAction==ButtonAction.ACTION_RESTART and stop==false then

	Isaac.ExecuteCommand("restart")
	
	return false
	
	
	end



end


local function Time()

local game = Game()
local currentTime = game:GetFrameCount() - startTime 
local seconds = math.floor(currentTime / 30) 

    seconds = seconds % 60
	
if seconds>=30 then
stop=true
end

end



local function Update()
stop=false
end




mod:AddCallback(ModCallbacks.MC_INPUT_ACTION, FasterRestart, InputHook.IS_ACTION_PRESSED)
mod:AddCallback(ModCallbacks.MC_POST_RENDER, Time) 
mod:AddCallback(ModCallbacks.MC_POST_GAME_STARTED,Update)
