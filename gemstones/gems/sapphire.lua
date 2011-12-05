--------------------------------------------------------------------------------
--    Sapphire Gemstone
--    Almost wood slow, but almost mese-like durability
--------------------------------------------------------------------------------
--module( ..., package.seeall )
--orename = "gemstones:sapphire_stone"

---- Ore Block -----------------------------------------------------------------
minetest.register_node( "gemstones:sapphire_stone", {
	tile_images = { "default_stone.png^gemstones_sapphire_stone.png" },
	inventory_image = minetest.inventorycube( "default_stone.png^gemstones_sapphire_stone.png" ),
	is_ground_content = true,
	material = minetest.digprop_stonelike(1.0),
	dug_item = 'craft "gemstones:sapphire_gem" 1',
	extra_dug_item = 'craft "gemstones:sapphire_gem" 1',
	extra_dug_item_rarity = 20,
})

---- "Lump" (or shard) ---------------------------------------------------------
minetest.register_craftitem( "gemstones:sapphire_gem", {
	image = "gemstones_sapphire_gem.png",
	on_place_on_ground = minetest.craftitem_place_item,
})

---- Solid Block ---------------------------------------------------------------
minetest.register_node( "gemstones:sapphire_block", {
	drawtype = "glasslike",
	tile_images = { "gemstones_sapphire_block.png" },
	inventory_image = minetest.inventorycube( "gemstones_sapphire_block.png" ),
	alpha = 200,
	is_ground_content = true,
	material = minetest.digprop_glasslike(3.0),
})

---- Pick ----------------------------------------------------------------------
minetest.register_tool( "gemstones:sapphire_pick", {
	image = "gemstones_sapphire_pick.png",
	basetime = 1.5,
	dt_weight = 0,
	dt_crackiness = -0.5,
	dt_crumbliness = 4,
	dt_cuttability = 4,
	basedurability = 1000,
	dd_weight = 0,
	dd_crackiness = 0,
	dd_crumbliness = 0,
	dd_cuttability = 0,
})

---- Shovel --------------------------------------------------------------------
minetest.register_tool( "gemstones:sapphire_shovel", {
	image = "gemstones_sapphire_shovel.png",
	basetime = 1.5,
	dt_weight = 0.5,
	dt_crackiness = 4,
	dt_crumbliness = -1,
	dt_cuttability = 3,
	basedurability = 1000,
	dd_weight = 0,
	dd_crackiness = 0,
	dd_crumbliness = 0,
	dd_cuttability = 0,
})

---- Axe -----------------------------------------------------------------------
minetest.register_tool( "gemstones:sapphire_axe", {
	image = "gemstones_sapphire_axe.png",
	basetime = 1.5,
	dt_weight = 0.5,
	dt_crackiness = 3,
	dt_crumbliness = 4,
	dt_cuttability = -2,
	basedurability = 1000,
	dd_weight = 0,
	dd_crackiness = 0,
	dd_crumbliness = 0,
	dd_cuttability = 0,
})

---- Sword ---------------------------------------------------------------------
minetest.register_tool( "gemstones:sapphire_sword", {
	image = "gemstones_sapphire_sword.png",
	basetime = 2.5,
	dt_weight = 2,
	dt_crackiness = 2,
	dt_crumbliness = 1,
	dt_cuttability = -1,
	basedurability = 1000,
	dd_weight = 0,
	dd_crackiness = 0,
	dd_crumbliness = 0,
	dd_cuttability = 0,
})

---- Craft Tools ---------------------------------------------------------------
minetest.register_craft({
	output = 'tool "gemstones:sapphire_pick"',
	recipe = {
		{ 'craft "gemstones:sapphire_gem"', 'craft "gemstones:sapphire_gem"', 'craft "gemstones:sapphire_gem"' },
		{ '', 'craft "default:stick"', '' },
		{ '', 'craft "default:stick"', '' },
	}
})

minetest.register_craft({
	output = 'tool "gemstones:sapphire_shovel"',
	recipe = {
		{ 'craft "gemstones:sapphire_gem"' },
		{ 'craft "default:stick"' },
		{ 'craft "default:stick"' },
	}
})

minetest.register_craft({
	output = 'tool "gemstones:sapphire_axe"',
	recipe = {
		{ 'craft "gemstones:sapphire_gem"', 'craft "gemstones:sapphire_gem"' },
		{ 'craft "gemstones:sapphire_gem"', 'craft "default:stick"' },
		{ '', 'craft "default:stick"' },
	}
})

minetest.register_craft({
	output = 'tool "gemstones:sapphire_sword"',
	recipe = {
		{ 'craft "gemstones:sapphire_gem"' },
		{ 'craft "gemstones:sapphire_gem"' },
		{ 'craft "default:stick"' },
	}
})

---- Craft Block ---------------------------------------------------------------
minetest.register_craft( {
	output = 'node "gemstones:sapphire_block" 1',
	recipe = {
		{ 'craft "gemstones:sapphire_gem"', 'craft "gemstones:sapphire_gem"', 'craft "gemstones:sapphire_gem"' },
		{ 'craft "gemstones:sapphire_gem"', 'craft "gemstones:sapphire_gem"', 'craft "gemstones:sapphire_gem"' },
		{ 'craft "gemstones:sapphire_gem"', 'craft "gemstones:sapphire_gem"', 'craft "gemstones:sapphire_gem"' },
	}
})

minetest.register_craft( {
	output = 'craft "gemstones:sapphire_gem" 9',
	recipe = {
		{ 'node "gemstones:sapphire_block"' },
	}
})
---- End Sapphire --------------------------------------------------------------
