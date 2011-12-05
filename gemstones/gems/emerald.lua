--------------------------------------------------------------------------------
--    Emerald Gemstone
--------------------------------------------------------------------------------
module( ..., package.seeall )
orename = "gemstones:emerald_stone"

---- Ore Block -----------------------------------------------------------------
minetest.register_node( "gemstones:emerald_stone", {
	tile_images = { "default_stone.png^gemstones_emerald_stone.png" },
	inventory_image = minetest.inventorycube( "default_stone.png^gemstones_emerald_stone.png" ),
	is_ground_content = true,
	material = minetest.digprop_stonelike(1.0),
	dug_item = 'craft "gemstones:emerald_gem" 1',
	extra_dug_item = 'craft "gemstones:emerald_gem" 1',
	extra_dug_item_rarity = 20,
})

---- "Lump" (or shard) ---------------------------------------------------------
minetest.register_craftitem( "gemstones:emerald_gem", {
	image = "gemstones_emerald_gem.png",
	on_place_on_ground = minetest.craftitem_place_item,
})

---- Solid Block ---------------------------------------------------------------
minetest.register_node( "gemstones:emerald_block", {
	drawtype = "glasslike",
	tile_images = { "gemstones_emerald_block.png" },
	inventory_image = minetest.inventorycube( "gemstones_emerald_block.png" ),
	alpha = 200,
	is_ground_content = true,
	material = minetest.digprop_glasslike(3.0),
})

---- Pick ----------------------------------------------------------------------
minetest.register_tool( "gemstones:emerald_pick", {
	image = "gemstones_emerald_pick.png",
	basetime = 1.0,
	dt_weight = 0,
	dt_crackiness = -2,
	dt_crumbliness = 3,
	dt_cuttability = 3,
	basedurability = 200,
	dd_weight = 0,
	dd_crackiness = 0,
	dd_crumbliness = 0,
	dd_cuttability = 0,
})

---- Shovel --------------------------------------------------------------------
minetest.register_tool( "gemstones:emerald_shovel", {
	image = "gemstones_emerald_shovel.png",
	basetime = 1.0,
	dt_weight = 0.5,
	dt_crackiness = 3,
	dt_crumbliness = -2,
	dt_cuttability = 3,
	basedurability = 200,
	dd_weight = 0,
	dd_crackiness = 0,
	dd_crumbliness = 0,
	dd_cuttability = 0,
})

---- Axe -----------------------------------------------------------------------
minetest.register_tool( "gemstones:emerald_axe", {
	image = "gemstones_emerald_axe.png",
	basetime = 1.0,
	dt_weight = 0.5,
	dt_crackiness = 3,
	dt_crumbliness = 3,
	dt_cuttability = -3,
	basedurability = 200,
	dd_weight = 0,
	dd_crackiness = 0,
	dd_crumbliness = 0,
	dd_cuttability = 0,
})

---- Sword ---------------------------------------------------------------------
minetest.register_tool( "gemstones:emerald_sword", {
	image = "gemstones_emerald_sword.png",
	basetime = 2.0,
	dt_weight = 5,
	dt_crackiness = 2,
	dt_crumbliness = 1,
	dt_cuttability = -1,
	basedurability = 200,
	dd_weight = 0,
	dd_crackiness = 0,
	dd_crumbliness = 0,
	dd_cuttability = 0,
})

---- Craft Tools ---------------------------------------------------------------
minetest.register_craft({
	output = 'tool "gemstones:emerald_pick"',
	recipe = {
		{ 'craft "gemstones:emerald_gem"', 'craft "gemstones:emerald_gem"', 'craft "gemstones:emerald_gem"' },
		{ '', 'craft "default:stick"', '' },
		{ '', 'craft "default:stick"', '' },
	}
})

minetest.register_craft({
	output = 'tool "gemstones:emerald_shovel"',
	recipe = {
		{ 'craft "gemstones:emerald_gem"' },
		{ 'craft "default:stick"' },
		{ 'craft "default:stick"' },
	}
})

minetest.register_craft({
	output = 'tool "gemstones:emerald_axe"',
	recipe = {
		{ 'craft "gemstones:emerald_gem"', 'craft "gemstones:emerald_gem"' },
		{ 'craft "gemstones:emerald_gem"', 'craft "default:stick"' },
		{ '', 'craft "default:stick"' },
	}
})

minetest.register_craft({
	output = 'tool "gemstones:emerald_sword"',
	recipe = {
		{ 'craft "gemstones:emerald_gem"' },
		{ 'craft "gemstones:emerald_gem"' },
		{ 'craft "default:stick"' },
	}
})

---- Craft Block ---------------------------------------------------------------
minetest.register_craft( {
	output = 'node "gemstones:emerald_block" 1',
	recipe = {
		{ 'craft "gemstones:emerald_gem"', 'craft "gemstones:emerald_gem"', 'craft "gemstones:emerald_gem"' },
		{ 'craft "gemstones:emerald_gem"', 'craft "gemstones:emerald_gem"', 'craft "gemstones:emerald_gem"' },
		{ 'craft "gemstones:emerald_gem"', 'craft "gemstones:emerald_gem"', 'craft "gemstones:emerald_gem"' },
	}
})

minetest.register_craft( {
	output = 'craft "gemstones:emerald_gem" 9',
	recipe = {
		{ 'node "gemstones:emerald_block"' },
	}
})
print( "Emerald" )
