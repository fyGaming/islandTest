-- Generated from template
print("Loading Dota Arena")

if _G.GameMode == nil then
	_G.GameMode = class({})
end




function fyrequire(path)    -------nice可以用！！

	local files = require(path .. '/_loader')
	if not files then 
	error('fyquire failed to load'  .. path)
	end

	if files and type(files) == 'table' then
		for _,file in pairs(files) do
			print(file)
			print(path)
			require(path .. '/' .. file)
		end

	elseif files and not type(files) == 'table' then
			print (path, 'doesnt retuen a table contains files to require')
	
	end
end
require('level')
require("levels/polygon")
require("levels/level_lua")
require("levels/arena_small")
require('gamemode')
require('lib/timers')
require('lib/animations')
require('lib/vector_target')
require('lib/statcollection')

function Precache( context )
	--[[
		Precache things we know we'll use.  Possible file types include (but not limited to):
			PrecacheResource( "model", "*.vmdl", context )
			PrecacheResource( "soundfile", "*.vsndevts", context )
			PrecacheResource( "particle", "*.vpcf", context )
			PrecacheResource( "particle_folder", "particles/folder", context )
	]]
end

-- Create the game mode when we activate
function Activate()
	GameRules.GameMode = GameMode()
	GameRules.GameMode:InitGameMode()
end



-- Evaluate the state of the game
function GameMode:OnThink()
	if GameRules:State_Get() == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
		--print( "Template addon script is running." )
	elseif GameRules:State_Get() >= DOTA_GAMERULES_STATE_POST_GAME then
		return nil
	end
	return 1
end