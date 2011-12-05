--------------------------------------------------------------------------------
--    Gemstones!
--    This mod adds gems such as rubies, sapphires, emeralds, etc. Tools and
--    "solid" blocks can be crafted from the gems.
--
--    by ZLovesPancakes
--    2011-12-04    13:26:40
--------------------------------------------------------------------------------

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
	--drawtype = "glasslike",
	tile_images = { "gemstones_amethyst_block.png" },
	inventory_image = minetest.inventorycube( "gemstones_amethyst_block.png" ),
	--alpha = 200,
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
--------------------------------------------------------------------------------
--    Emerald Gemstone
--    Just a bit less durable than steel
--------------------------------------------------------------------------------
--module( ..., package.seeall )
--orename = "gemstones:emerald_stone"

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
	--drawtype = "glasslike",
	tile_images = { "gemstones_emerald_block.png" },
	inventory_image = minetest.inventorycube( "gemstones_emerald_block.png" ),
	--alpha = 200,
	is_ground_content = true,
	material = minetest.digprop_glasslike(3.0),
})

---- Pick ----------------------------------------------------------------------
minetest.register_tool( "gemstones:emerald_pick", {
	image = "gemstones_emerald_pick.png",
	basetime = 1.0,
	dt_weight = 0,
	dt_crackiness = -0.5,
	dt_crumbliness = 2,
	dt_cuttability = 0,
	basedurability = 300,
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
	dt_crackiness = 2,
	dt_crumbliness = -1.5,
	dt_cuttability = 0.0,
	basedurability = 300,
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
	dt_crackiness = -0.2,
	dt_crumbliness = 1,
	dt_cuttability = -0.5,
	basedurability = 300,
	dd_weight = 0,
	dd_crackiness = 0,
	dd_crumbliness = 0,
	dd_cuttability = 0,
})

---- Sword ---------------------------------------------------------------------
minetest.register_tool( "gemstones:emerald_sword", {
	image = "gemstones_emerald_sword.png",
	basetime = 2.0,
	dt_weight = 3,
	dt_crackiness = 0,
	dt_crumbliness = 1,
	dt_cuttability = -1,
	basedurability = 300,
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
---- End Emerald ---------------------------------------------------------------
--------------------------------------------------------------------------------
--    Ruby Gemstone
--    Faster, but much less durable than steel
--------------------------------------------------------------------------------
--module( ..., package.seeall )
--orename = "gemstones:ruby_stone"

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
	--drawtype = "glasslike",
	tile_images = { "gemstones_ruby_block.png" },
	inventory_image = minetest.inventorycube( "gemstones_ruby_block.png" ),
	--alpha = 200,
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
	--drawtype = "glasslike",
	tile_images = { "gemstones_sapphire_block.png" },
	inventory_image = minetest.inventorycube( "gemstones_sapphire_block.png" ),
	--alpha = 200,
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

---- Create gems on chunk generation -------------------------------------------
-- celeron55 said:
-- "It is somewhat doable, but not very fancily. Off the top of my head without
-- any testing:"
-- + My fixes

local reggems = {
	"gemstones:amethyst_stone", "gemstones:emerald_stone", "gemstones:ruby_stone",
	"gemstones:sapphire_stone"
}

-- pun intended
local rarity = 10

local gemstones_gen = function( minp, maxp )
	for c, gemname in ipairs(reggems) do
		local amount = math.random( 0, rarity )
		for a = 0, amount do
			local pos = {
				x = math.random( minp.x, maxp.x ),
				y = math.random( minp.y, maxp.y ),
				z = math.random( minp.z, maxp.z ),
			}
			for i = -1, 1 do
				for j = -1, 1 do
					for k = -1, 1 do
						if math.random() > 0.2 then
							--continue
						else
							local p = { x=pos.x+i, y=pos.y+j, z=pos.z+k }
							local n = minetest.env:get_node( p )
							if n.name == "default:stone" then
								minetest.env:add_node( p, { name = gemname } )
							end
						end
					end
				end
			end
		end
	end
end

minetest.register_on_generated( gemstones_gen )

---- Was loaded? ---------------------------------------------------------------
-- Just to be sure, may remove if you like.
print( "Loaded: Gemstones, by ZLovesPancakes" )
