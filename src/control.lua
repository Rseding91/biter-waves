require "defines"

remote.addinterface("biterwaves", {
	reset = function()
		glob.timer = 60 * 60 * 5
	end,
	set = function(ticks)
		if type(ticks) == "number" then
			glob.timer = ticks
			game.player.print(glob.timer)
		end
	end
})

game.onevent(defines.events.ontick, function(event)
	if glob.timer == nil then glob.timer = 60 * 60 * 30 end
	glob.timer = glob.timer - 1
	
	if glob.timer == 0 then
		player = game.getplayer(1)
		if player and player.character then
			game.setmulticommand({type = defines.command.attack,
								target = player.character,
								distraction = defines.distraction.byenemy},
								5)
		end
		glob.timer = 60 * 60 * 5
	end
end)