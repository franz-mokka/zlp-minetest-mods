--------------------------------------------------------------------------------
--	Custom Commands
--	(c)2012 Fernando Zapata
--	2012-05-12	01:03:30
--------------------------------------------------------------------------------

---- Suicide command ----
minetest.register_chatcommand( 'killme', {
	description = 'kill yourself',
	func = function( name, param )
		local player = minetest.env:get_player_by_name(name)
		player:set_hp(0)
	end
})

--------------------------------------------------------------------------------
