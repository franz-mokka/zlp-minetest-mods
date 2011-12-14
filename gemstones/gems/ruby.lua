--------------------------------------------------------------------------------
--    Ruby Gemstone
--    Faster, but much less durable than steel
--------------------------------------------------------------------------------

table.insert( reggems, "gemstones:ruby_stone" )

---- Ore Block -----------------------------------------------------------------
minetest.register_node( "gemstones:ruby_stone", {
	tile_images = { "default_stone.png^gemstones_ruby_stone.png" },
	inventory_image = minetest.inventorycube( "default_stone.png^gemstones_ruby_stone.png" ),
	is_ground_content = true,
	material = minetest.digprop_stonelike(1.0),
	dug_item = 'craft "gemstones:ruby_gem" 1',
	extra_dug_item = 'craft "gemstones:ruby_gem" 1',
	extra_dug_item_rarity = 20,
})

---- "Lump" (or shard) ---------------------------------------------------------
minetest.register_craftitem( "gemstones:ruby_gem", {
	image = "gemstones_ruby_gem.png",
	on_place_on_ground = minetest.craftitem_place_item,
})

---- Solid Block ---------------------------------------------------------------
minetest.register_node( "gemstones:ruby_block", {
	drawtype = "glasslike",
	tile_images = { "gemstones_ruby_block.png" },
	inventory_image = minetest.inventorycube( "gemstones_ruby_block.png" ),
	alpha = 200,
	is_ground_content = true,
	material = minetest.digprop_glasslike(3.0),
})

---- Pick ----------------------------------------------------------------------
minetest.register_tool( "gemstones:ruby_pick", {
	image = "gemstones_ruby_pick.png",
	basetime = 1.0,
	dt_weight = 0,
	dt_crackiness = -2,
	dt_crumbliness = 3,
	dt_cuttability = 3,
	basedurability = 180,
	dd_weight = 0,
	dd_crackiness = 0,
	dd_crumbliness = 0,
	dd_cuttability = 0,
})

---- Shovel --------------------------------------------------------------------
minetest.register_tool( "gemstones:ruby_shovel", {
	image = "gemstones_ruby_shovel.png",
	basetime = 1.0,
	dt_weight = 0.5,
	dt_crackiness = 3,
	dt_crumbliness = -2,
	dt_cuttability = 3,
	basedurability = 180,
	dd_weight = 0,
	dd_crackiness = 0,
	dd_crumbliness = 0,
	dd_cuttability = 0,
})

---- Axe -----------------------------------------------------------------------
minetest.register_tool( "gemstones:ruby_axe", {
	image = "gemstones_ruby_axe.png",
	basetime = 1.0,
	dt_weight = 0.5,
	dt_crackiness = 3,
	dt_crumbliness = 3,
	dt_cuttability = -3,
	basedurability = 180,
	dd_weight = 0,
	dd_crackiness = 0,
	dd_crumbliness = 0,
	dd_cuttability = 0,
})

---- Sword ---------------------------------------------------------------------
minetest.register_tool( "gemstones:ruby_sword", {
	image = "gemstones_ruby_sword.png",
	basetime = 2.0,
	dt_weight = 5,
	dt_crackiness = 2,
	dt_crumbliness = 1,
	dt_cuttability = -1,
	basedurability = 180,
	dd_weight = 0,
	dd_crackiness = 0,
	dd_crumbliness = 0,
	dd_cuttability = 0,
})

---- Craft Tools ---------------------------------------------------------------
minetest.register_craft({
	output = 'tool "gemstones:ruby_pick"',
	recipe = {
		{ 'craft "gemstones:ruby_gem"', 'craft "gemstones:ruby_gem"', 'craft "gemstones:ruby_gem"' },
		{ '', 'craft "default:stick"', '' },
		{ '', 'craft "default:stick"', '' },
	}
})

minetest.register_craft({
	output = 'tool "gemstones:ruby_shovel"',
	recipe = {
		{ 'craft "gemstones:ruby_gem"' },
		{ 'craft "default:stick"' },
		{ 'craft "default:stick"' },
	}
})

minetest.register_craft({
	output = 'tool "gemstones:ruby_axe"',
	recipe = {
		{ 'craft "gemstones:ruby_gem"', 'craft "gemstones:ruby_gem"' },
		{ 'craft "gemstones:ruby_gem"', 'craft "default:stick"' },
		{ '', 'craft "default:stick"' },
	}
})

minetest.register_craft({
	output = 'tool "gemstones:ruby_sword"',
	recipe = {
		{ 'craft "gemstones:ruby_gem"' },
		{ 'craft "gemstones:ruby_gem"' },
		{ 'craft "default:stick"' },
	}
})

---- Craft Block ---------------------------------------------------------------
minetest.register_craft( {
	output = 'node "gemstones:ruby_block" 1',
	recipe = {
		{ 'craft "gemstones:ruby_gem"', 'craft "gemstones:ruby_gem"', 'craft "gemstones:ruby_gem"' },
		{ 'craft "gemstones:ruby_gem"', 'craft "gemstones:ruby_gem"', 'craft "gemstones:ruby_gem"' },
		{ 'craft "gemstones:ruby_gem"', 'craft "gemstones:ruby_gem"', 'craft "gemstones:ruby_gem"' },
	}
})

minetest.register_craft( {
	output = 'craft "gemstones:ruby_gem" 9',
	recipe = {
		{ 'node "gemstones:ruby_block"' },
	}
})
---- End Ruby ------------------------------------------------------------------
