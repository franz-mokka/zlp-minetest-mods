--------------------------------------------------------------------------------
--	Hatch
--------------------------------------------------------------------------------
--	Á hatch/trapdoor similar to the one introduced in Minecraft Beta 1.6
--
--	2012-07-31	08:19:13
--
--	(c)2012 Fernando Zapata (ZLovesPancakes, Franz.ZPT)
--	Code licensed under GNU GPLv2
--		http://www.gnu.org/licenses/gpl-2.0.html
--	Content licensed under CC BY-SA 3.0
--		http://creativecommons.org/licenses/by-sa/3.0/
--------------------------------------------------------------------------------

------------------------------------------------------------- Constants --------

hatch = {}

------------------------------------------------------------- Functions --------

function hatch.open( p, n )
	minetest.env:set_node( p, { name='hatch:hatch_o', param2=n.param2 } )
end

function hatch.close( p, n )
	minetest.env:set_node( p, { name='hatch:hatch_c', param2=n.param2 } )
end

--function hatch.toggle( p )
--	local n = minetest.env:get_node( p )
--	if p.name == 'hatch:hatch_o' then
--
--end

----------------------------------------------------------------- Nodes --------

minetest.register_node( 'hatch:hatch_c', {
	description		= 'Hatch',
	--inventory_image		= 'hatch_wood_a.png',
	--wield_image		= 'hatch_wood_a.png',
	groups		= {	snappy = 1,
				choppy = 2,
				oddly_breakable_by_hand = 2,
				flammable = 3 },
	tiles		= {	'hatch_wood_a.png',
				'hatch_wood_a.png',
				'hatch_wood_h.png' },
	drawtype		= 'nodebox',
	paramtype		= 'light',
	paramtype2		= 'facedir',
	sunlight_propagates	= true,
	node_box	= {	type = 'fixed',
				fixed = { -1/2, -1/2, -1/2, 1/2, -5/16, 1/2 } },
	selection_box	= {	type = 'fixed',
				fixed = { -1/2, -1/2, -1/2, 1/2, -5/16, 1/2 } },
	drop			= 'hatch:hatch_c',
	sounds			= default.node_sound_wood_defaults(),
	on_punch		= hatch.open
})

minetest.register_node( 'hatch:hatch_o', {
	description		= 'Hatch',
	groups		= {	snappy = 1,
				choppy = 2,
				oddly_breakable_by_hand = 2,
				flammable = 3 },
	tiles		= {	'hatch_wood_h.png', 'hatch_wood_h.png',
				'hatch_wood_v.png', 'hatch_wood_v.png',
				'hatch_wood_a.png', 'hatch_wood_a.png' },
	drawtype		= 'nodebox',
	paramtype		= 'light',
	paramtype2		= 'facedir',
	sunlight_propagates	= true,
	node_box	= {	type = 'fixed',
				fixed = { -1/2, -1/2, 5/16, 1/2, 1/2, 1/2} },
	selection_box	= {	type = 'fixed',
				fixed = { -1/2, -1/2, 5/16, 1/2, 1/2, 1/2} },
	drop			= 'hatch:hatch_c',
	sounds			= default.node_sound_wood_defaults(),
	on_punch		= hatch.close
})

---------------------------------------------------------------- Recipe --------

minetest.register_craft({
	output	= 'hatch:hatch_c 2',
	recipe	= {	{ 'default:wood', 'default:wood', 'default:wood' },
			{ 'default:wood', 'default:wood', 'default:wood' } }
})

--------------------------------------------------------------------------------
