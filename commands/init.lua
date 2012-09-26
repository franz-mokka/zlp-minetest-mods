--------------------------------------------------------------------------------
--	Custom Commands
--------------------------------------------------------------------------------
--	Many custom commands, currently includes:
--		/kill		Suicide
--		/list		List players
--
--	(c)2012 Fernando Zapata
--	Code licensed under GNU GPLv2
--		http://www.gnu.org/licenses/gpl-2.0.html
--
--	2012-05-12	01:03:30
--------------------------------------------------------------------------------

---- Suicide command ----
minetest.register_chatcommand( 'kill', {
	description = 'kill yourself',
	func = function( name, param )
		local player = minetest.env:get_player_by_name(name)
		player:set_hp(0)
	end
})

---- List connected players ----
minetest.register_chatcommand( 'list', {
	descrpition = 'list connected players',
	func = function( name, param )
		local players = minetest.get_connected_players()
		local list = ''
		for i,j in ipairs(players) do
			list = list .. j:get_player_name() .. ' '
		end
		minetest.chat_send_player( name, list )
	end
})

--------------------------------------------------------------------------------
