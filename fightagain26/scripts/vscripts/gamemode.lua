function GameMode:InitGameMode()
	print( "Template addon is loaded." )
	GameRules:GetGameModeEntity():SetThink( "OnThink", self, "GlobalThink", 2 )

	GameMode:LoadLevels()


	parts = Entities:FindAllByName("map_part")
	for _,part in pairs(parts) do
		self.level:LaunchPart(part, nil, Vector(part.x, part.y) * 1.01, 0)
		--print('is falling')
	end


	   self:RegisterThinker(0.01,
        function()
           -- if self.State == STATE_ROUND_IN_PROGRESS and self.round then
                self.round:Update()
                self.level:Update()
                print('thinking')
           -- end
        end
    )

end

--load the pieces and associate them 
--load polygons to parts
--load level points info and associate them

function GameMode:RegisterThinker(period, callback)
    local timer = {}
    timer.period = period
    timer.callback = callback
    timer.next = Time() + period

    self.Thinkers = self.Thinkers or {}

    table.insert(self.Thinkers, timer)
end




function GameMode:LoadLevels()
	self.level = Level()
	self.level:LoadPolygons()
	self.level:Clusterize()
	self.level:AssociatePieces()
	self.level:constructor()
	self.level:Reset()

end
