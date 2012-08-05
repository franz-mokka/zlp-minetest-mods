--------------------------------------------------------------------------------
--	Doors
--------------------------------------------------------------------------------
--	This mod adds 'minecraftlike' doors to the game.
--
--	(c) 2011-2012 Fernando Zapata
--	Code licensed under GNU GPLv2
--		http://www.gnu.org/licenses/gpl-2.0.html
--	Content licensed under CC BY-SA 3.0
--		http://creativecommons.org/licenses/by-sa/3.0/
--
--	2012-01-08	11:03:57
--------------------------------------------------------------------------------

---------------------------------------------------------------- Blocks --------

minetest.register_craftitem( 'zdoor:door_wood', {
	description		= 'Door',
	inventory_image		= 'zdoor_door_wood.png',
	on_place		= function( i, u, p )
		if p.type ~= 'node' then return i end
		local e = minetest.env
		local f = minetest.dir_to_facedir( u:get_look_dir() )
		local pa = p.above
		local pb = { x=pa.x, y=pa.y+1, z=pa.z }
		local pc = { x=pa.x, y=pa.y-1, z=pa.z }
		if e:get_node( pb ).name == 'air' then
			e:set_node( pa,
				{ name='zdoor:door_wood_b_t', param2=f } )
			e:set_node( pb,
				{ name='zdoor:door_wood_a_t', param2=f } )
			i:take_item()
		elseif e:get_node( pc ).name == 'air' then
			e:set_node( pa,
				{ name='zdoor:door_wood_a_t', param2=f } )
			e:set_node( pc,
				{ name='zdoor:door_wood_b_t', param2=f } )
			i:take_item()
		end
		return i
	end
})

minetest.register_node( 'zdoor:door_wood_a_t', {
	groups		= {	snappy=1,
				choppy=2,
				oddly_breakable_by_hand=2,
				flammable=3 },
	tiles		= {	'zdoor_door_wood_s.png',
				'zdoor_door_wood_s.png',
				'zdoor_door_wood_s.png',
				'zdoor_door_wood_s.png',
				'zdoor_door_wood_a_b.png',
				'zdoor_door_wood_a_f.png' },
	drawtype		= 'nodebox',
	paramtype		= 'light',
	paramtype2		= 'facedir',
	node_box	= {	type = "fixed",
				fixed = { -1/2, -1/2, -1/2, 1/2, 1/2, -5/16 } },
	selection_box	= {	type = "fixed",
				fixed = { -1/2, -1/2, -1/2, 1/2, 1/2, -5/16 } },
	drop			= 'zdoor:door_wood',
	sounds			= default.node_sound_wood_defaults(),
	on_punch		= function( p, n ,u )
		minetest.env:set_node( p,
			{ name='zdoor:door_wood_a_f', param2=n.param2 } )
		p.y = p.y - 1
		minetest.env:set_node( p,
			{ name='zdoor:door_wood_b_f', param2=n.param2 } )
	end,
	on_dig			= function( p, n, u )
		minetest.node_dig( p, n, u )
		p.y = p.y - 1
		minetest.env:remove_node( p )
	end
})

minetest.register_node( 'zdoor:door_wood_a_f', {
	groups		= {	snappy=1,
				choppy=2,
				oddly_breakable_by_hand=2,
				flammable=3 },
	tiles		= {	'zdoor_door_wood_s.png',
				'zdoor_door_wood_s.png',
				'zdoor_door_wood_a_f.png',
				'zdoor_door_wood_a_b.png',
				'zdoor_door_wood_s.png',
				'zdoor_door_wood_s.png' },
	drawtype		= 'nodebox',
	paramtype		= 'light',
	paramtype2		= 'facedir',
	node_box	= {	type = "fixed",
				fixed = { -1/2, -1/2, -1/2, -5/16, 1/2, 1/2 } },
	selection_box	= {	type = "fixed",
				fixed = { -1/2, -1/2, -1/2, -5/16, 1/2, 1/2 } },
	drop			= 'zdoor:door_wood',
	sounds			= default.node_sound_wood_defaults(),
	on_punch		= function( p, n ,u )
		minetest.env:set_node( p,
			{ name='zdoor:door_wood_a_t', param2=n.param2 } )
		p.y = p.y - 1
		minetest.env:set_node( p,
			{ name='zdoor:door_wood_b_t', param2=n.param2 } )
	end,
	on_dig			= function( p, n, u )
		minetest.node_dig( p, n, u )
		p.y = p.y - 1
		minetest.env:remove_node( p )
	end
})

minetest.register_node( 'zdoor:door_wood_b_t', {
	groups		= {	snappy=1,
				choppy=2,
				oddly_breakable_by_hand=2,
				flammable=3 },
	tiles		= {	'zdoor_door_wood_s.png',
				'zdoor_door_wood_s.png',
				'zdoor_door_wood_s.png',
				'zdoor_door_wood_s.png',
				'zdoor_door_wood_b_b.png',
				'zdoor_door_wood_b_f.png' },
	drawtype		= 'nodebox',
	paramtype		= 'light',
	paramtype2		= 'facedir',
	node_box	= {	type = "fixed",
				fixed = { -1/2, -1/2, -1/2, 1/2, 1/2, -5/16 } },
	selection_box	= {	type = "fixed",
				fixed = { -1/2, -1/2, -1/2, 1/2, 1/2, -5/16 } },
	drop			= 'zdoor:door_wood',
	sounds			= default.node_sound_wood_defaults(),
	on_punch		= function( p, n ,u )
		minetest.env:set_node( p,
			{ name='zdoor:door_wood_b_f', param2=n.param2 } )
		p.y = p.y + 1
		minetest.env:set_node( p,
			{ name='zdoor:door_wood_a_f', param2=n.param2 } )
	end,
	on_dig			= function( p, n, u )
		minetest.node_dig( p, n, u )
		p.y = p.y + 1
		minetest.env:remove_node( p )
	end
})

minetest.register_node( 'zdoor:door_wood_b_f', {
	groups		= {	snappy=1,
				choppy=2,
				oddly_breakable_by_hand=2,
				flammable=3 },
	tiles		= {	'zdoor_door_wood_s.png',
				'zdoor_door_wood_s.png',
				'zdoor_door_wood_b_f.png',
				'zdoor_door_wood_b_b.png',
				'zdoor_door_wood_s.png',
				'zdoor_door_wood_s.png' },
	drawtype		= 'nodebox',
	paramtype		= 'light',
	paramtype2		= 'facedir',
	node_box	= {	type = "fixed",
				fixed = { -1/2, -1/2, -1/2, -5/16, 1/2, 1/2 } },
	selection_box	= {	type = "fixed",
				fixed = { -1/2, -1/2, -1/2, -5/16, 1/2, 1/2 } },
	drop			= 'zdoor:door_wood',
	sounds			= default.node_sound_wood_defaults(),
	on_punch		= function( p, n ,u )
		minetest.env:set_node( p,
			{ name='zdoor:door_wood_b_t', param2=n.param2 } )
		p.y = p.y + 1
		minetest.env:set_node( p,
			{ name='zdoor:door_wood_a_t', param2=n.param2 } )
	end,
	on_dig			= function( p, n, u )
		minetest.node_dig( p, n, u )
		p.y = p.y + 1
		minetest.env:remove_node( p )
	end
})

--------------------------------------------------------------- Recipes --------

minetest.register_craft( {
	output		= 'zdoor:door_wood',
	recipe	= {	{ 'default:wood', 'default:wood' },
			{ 'default:wood', 'default:wood' },
			{ 'default:wood', 'default:wood' }},
})

minetest.register_craft({
	type		= 'fuel',
	recipe		= 'zdoor:door',
	burntime	= 30,
})

--------------------------------------------------------------------------------
