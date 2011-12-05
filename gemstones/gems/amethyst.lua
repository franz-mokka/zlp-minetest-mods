--------------------------------------------------------------------------------
--    Amethyst Gemstone
--    Less durable but slightly faster than steel.
--------------------------------------------------------------------------------
--module( ..., package.seeall )
--orename = "gemstones:amethyst_stone"

---- Ore Block -----------------------------------------------------------------
minetest.register_node( "gemstones:amethyst_stone", {
	tile_images = { "default_stone.png^gemstones_amethyst_stone.png" },
	inventory_image = minetest.inventorycube( "default_stone.png^gemstones_amethyst_stone.png" ),
	is_ground_content = true,
	material = minetest.digprop_stonelike(1.0),
	dug_item = 'craft "gemstones:amethyst_gem" 1',
	extra_dug_item = 'craft "gemstones:amethyst_gem" 1',
	extra_dug_item_rarity = 20,
})

---- "Lump" (or shard) ---------------------------------------------------------
minetest.register_craftitem( "gemstones:amethyst_gem", {
	image = "gemstones_amethyst_gem.png",
	on_place_on_ground = minetest.craftitem_place_item,
})

---- Solid Block ---------------------------------------------------------------
minetest.register_node( "gemstones:amethyst_block", {
	drawtype = "glasslike",
	tile_images = { "gemstones_amethyst_block.png" },
	inventory_image = minetest.inventorycube( "gemstones_amethyst_block.png" ),
	alpha = 200,
	is_ground_content = true,
	material = minetest.digprop_glasslike(3.0),
})

---- Pick ----------------------------------------------------------------------
minetest.register_tool( "gemstones:amethyst_pick", {
	image = "gemstones_amethyst_pick.png",
	basetime = 1.0,
	dt_weight = 0,
	dt_crackiness = -0.8,
	dt_crumbliness = 2,
	dt_cuttability = 1,
	basedurability = 250,
	dd_weight = 0,
	dd_crackiness = 0,
	dd_crumbliness = 0,
	dd_cuttability = 0,
})

---- Shovel --------------------------------------------------------------------
minetest.register_tool( "gemstones:amethyst_shovel", {
	image = "gemstones_amethyst_shovel.png",
	basetime = 1.0,
	dt_weight = 0.5,
	dt_crackiness = 2,
	dt_crumbliness = -2,
	dt_cuttability = 1,
	basedurability = 250,
	dd_weight = 0,
	dd_crackiness = 0,
	dd_crumbliness = 0,
	dd_cuttability = 0,
})

---- Axe -----------------------------------------------------------------------
minetest.register_tool( "gemstones:amethyst_axe", {
	image = "gemstones_amethyst_axe.png",
	basetime = 1.0,
	dt_weight = 0.5,
	dt_crackiness = -0.5,
	dt_crumbliness = 2,
	dt_cuttability = -0.8,
	basedurability = 250,
	dd_weight = 0,
	dd_crackiness = 0,
	dd_crumbliness = 0,
	dd_cuttability = 0,
})

---- Sword ---------------------------------------------------------------------
minetest.register_tool( "gemstones:amethyst_sword", {
	image = "gemstones_amethyst_sword.png",
	basetime = 2.0,
	dt_weight = 4,
	dt_crackiness = -0.2,
	dt_crumbliness = 0,
	dt_cuttability = -1,
	basedurability = 250,
	dd_weight = 0,
	dd_crackiness = 0,
	dd_crumbliness = 0,
	dd_cuttability = 0,
})

---- Craft Tools ---------------------------------------------------------------
minetest.register_craft({
	output = 'tool "gemstones:amethyst_pick"',
	recipe = {
		{ 'craft "gemstones:amethyst_gem"', 'craft "gemstones:amethyst_gem"', 'craft "gemstones:amethyst_gem"' },
		{ '', 'craft "default:stick"', '' },
		{ '', 'craft "default:stick"', '' },
	}
})

minetest.register_craft({
	output = 'tool "gemstones:amethyst_shovel"',
	recipe = {
		{ 'craft "gemstones:amethyst_gem"' },
		{ 'craft "default:stick"' },
		{ 'craft "default:stick"' },
	}
})

minetest.register_craft({
	output = 'tool "gemstones:amethyst_axe"',
	recipe = {
		{ 'craft "gemstones:amethyst_gem"', 'craft "gemstones:amethyst_gem"' },
		{ 'craft "gemstones:amethyst_gem"', 'craft "default:stick"' },
		{ '', 'craft "default:stick"' },
	}
})

minetest.register_craft({
	output = 'tool "gemstones:amethyst_sword"',
	recipe = {
		{ 'craft "gemstones:amethyst_gem"' },
		{ 'craft "gemstones:amethyst_gem"' },
		{ 'craft "default:stick"' },
	}
})

---- Craft Block ---------------------------------------------------------------
minetest.register_craft( {
	output = 'node "gemstones:amethyst_block" 1',
	recipe = {
		{ 'craft "gemstones:amethyst_gem"', 'craft "gemstones:amethyst_gem"', 'craft "gemstones:amethyst_gem"' },
		{ 'craft "gemstones:amethyst_gem"', 'craft "gemstones:amethyst_gem"', 'craft "gemstones:amethyst_gem"' },
		{ 'craft "gemstones:amethyst_gem"', 'craft "gemstones:amethyst_gem"', 'craft "gemstones:amethyst_gem"' },
	}
})

minetest.register_craft( {
	output = 'craft "gemstones:amethyst_gem" 9',
	recipe = {
		{ 'node "gemstones:amethyst_block"' },
	}
})
---- End Amethyst --------------------------------------------------------------
