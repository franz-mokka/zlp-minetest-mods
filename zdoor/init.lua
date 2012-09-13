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

------------------------------------------------------------- Constants --------

door = {}

------------------------------------------------------------- Functions --------

function door.toggle( p, n )
	local q = xyz( p.x, p.y+1, p.z )
	local a = minetest.env:get_meta( p )
	local b = minetest.env:get_meta( q )
	minetest.sound_play("zdoor_toggle", {pos = q})
	minetest.env:set_node( p, {name=a:get_string('alt'), param2=n.param2} )
	minetest.env:set_node( q, {name=b:get_string('alt'), param2=n.param2} )
end

---------------------------------------------------------------- Blocks --------

minetest.register_craftitem( 'zdoor:door_wood', {
	description		= 'Door',
	inventory_image		= 'zdoor_door_wood.png',
	on_place		= function( i, u, p )
		if p.type ~= 'node' then return i end
		local e = minetest.env
		local f = minetest.dir_to_facedir( u:get_look_dir() )
		local pa = p.above
		local pb = xyz( pa.x, pa.y+1, pa.z )
		if e:get_node( pb ).name == 'air' then
			e:set_node( pa,
				{ name='zdoor:door_wood_b_t', param2=f } )
			e:set_node( pb,
				{ name='zdoor:door_wood_a_t', param2=f } )
			i:take_item()
		end
		return i
	end
})

minetest.register_node( 'zdoor:door_wood_a_t', {
	groups		= {	door=1,
				snappy=1,
				choppy=2,
				oddly_breakable_by_hand=2 },
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
				fixed = { 0, 0, 0, 0, 0, 0 } },
	drop			= 'zdoor:door_wood',
	sounds			= default.node_sound_wood_defaults(),
	on_construct		= function( p )
		local m = minetest.env:get_meta( p )
		m:set_string( 'alt', 'zdoor:door_wood_a_f' )
	end
})

minetest.register_node( 'zdoor:door_wood_a_f', {
	groups		= {	door=1,
				snappy=1,
				choppy=2,
				oddly_breakable_by_hand=2 },
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
				fixed = { 0, 0, 0, 0, 0, 0 } },
	drop			= 'zdoor:door_wood',
	sounds			= default.node_sound_wood_defaults(),
	on_construct		= function( p )
		local m = minetest.env:get_meta( p )
		m:set_string( 'alt', 'zdoor:door_wood_a_t' )
	end
})

minetest.register_node( 'zdoor:door_wood_b_t', {
	groups		= {	door=2,
				snappy=1,
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
				fixed = { -1/2, -1/2, -1/2, 1/2, 3/2, -5/16 } },
	drop			= 'zdoor:door_wood',
	sounds			= default.node_sound_wood_defaults(),
	on_construct		= function( p )
		local m = minetest.env:get_meta( p )
		m:set_string( 'alt', 'zdoor:door_wood_b_f' )
	end,
	on_punch		= door.toggle,
	after_dig_node		= function( p, n, u )
		p.y = p.y + 1
		minetest.env:remove_node( p )
	end
})

minetest.register_node( 'zdoor:door_wood_b_f', {
	groups		= {	door=2,
				snappy=1,
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
				fixed = { -1/2, -1/2, -1/2, -5/16, 3/2, 1/2 } },
	drop			= 'zdoor:door_wood',
	sounds			= default.node_sound_wood_defaults(),
	on_construct		= function( p )
		local m = minetest.env:get_meta( p )
		m:set_string( 'alt', 'zdoor:door_wood_b_t' )
	end,
	on_punch		= door.toggle,
	after_dig_node		= function( p )
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
