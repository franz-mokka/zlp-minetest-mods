--------------------------------------------------------------------------------
--	Gemstones!
--------------------------------------------------------------------------------
--	This mod adds gems such as rubies, sapphires, emeralds, etc. Tools and
--	'solid' blocks can be crafted from the gems.
--
--	(c)2012 Fernando Zapata (ZLovesPancakes, Franz.ZPT)
--	Code licensed under GNU GPLv2
--		http://www.gnu.org/licenses/gpl-2.0.html
--	Content licensed under CC BY-SA 3.0
--		http://creativecommons.org/licenses/by-sa/3.0/
--
--	2011-12-04    13:26:40
--------------------------------------------------------------------------------

-- Name of the mod --
gemsmodn = 'gemstones'

-- List containing the names and quantity of the ores --
minerallist = {}

--local register_multitool = function( modname, basename, craftname, )

--end

---- Big, bad function to declare gems -----------------------------------------
register_gem = function( modname, gemtype, rarity, basetime, durability, toolrules )

	-- Ores --
	mineralname = modname .. ':mineral_'..gemtype
	mineraltex  = 'default_stone.png^'..modname..'_mineral_'..gemtype..'.png'

	-- Gems/lumps --
	gemname     = modname..':gem_'..gemtype
	gemtex      = modname..'_gem_'..gemtype..'.png'
	craftname   = gemname

	-- Solid block --
	blockname   = modname..':block_'..gemtype
	blocktex    = modname..'_block_'..gemtype..'.png'

	table.insert( minerallist, { mineralname, rarity } )

	minetest.register_craftitem( gemname, {
		image = gemtex,
		on_place_on_ground = minetest.craftitem_place_item,
	} )

	-- Mineral block --
	minetest.register_node( mineralname, {
		description		= 'Stone with '..gemtype,
		tile_images		= { mineraltex },
		is_ground_content	= true,
		material		= minetest.digprop_stonelike(1.0),
		groups			= { cracky=3 },
		drop			= craftname..' 1',

	} )

	-- Solid block --
	minetest.register_node( blockname, {
		description		= gemtype..' block',
		--drawtype		= 'glasslike',
		tile_images		= { blocktex },
		--alpha			= 200,
		is_ground_content	= true,
		groups			= { cracky=2 }
	} )

	-- Tools, inspired by 'add_tool' by MarkTraceur
	--register_multitool( modname, gemtype, craftname, basetime, durability,
	--	toolrules )

	-- Crafting blocks --
	minetest.register_craft( {
		output                = blockname .. ' 1',
		recipe = {
			                { craftname,craftname,craftname },
			                { craftname,craftname,craftname },
			                { craftname,craftname,craftname },
		},
	} )

	minetest.register_craft( {
		output                = craftname .. ' 9',
		recipe = {
			                { blockname },
		},
	} )
end

---- Create gems on chunk generation -------------------------------------------
-- celeron55 said:
-- 'It is somewhat doable, but not very fancily. Off the top of my head
-- without any testing:'
-- + My fixes
local generate_gem = function( minp, maxp )
	for c, oreinfo in ipairs( minerallist ) do
		--print( oreinfo )
		local amount = math.random( 0, oreinfo[2] )
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
					local p = {
						x = pos.x + i,
						y = pos.y + j,
						z = pos.z + k
					}
					local n = minetest.env:get_node( p )
					if n.name == 'default:stone' then
						minetest.env:add_node( p, {
							name = oreinfo[1] } )
					end
				end
			end
			end
			end
		end
	end
end

minetest.register_on_generated( generate_gem )

---- Register new gemstones ----------------------------------------------------

---- Amethyst ----
-- Less durable but slightly faster than steel.
register_gem( gemsmodn, 'amethyst',  5, 0.9, 250,  { sword_time = 1 } )

---- Cubic Zirconia ----
-- Almost wood slow, but almost mese-like durability
register_gem( gemsmodn, 'czirconia', 5, 1.6, 1000, { sword_time = 1 } )

---- Emerald ----
-- Just a bit less durable than steel
register_gem( gemsmodn, 'emerald',   5, 1.0, 300,  { sword_time = 1 } )

---- Ruby ----
-- Faster, but much less durable than steel
register_gem( gemsmodn, 'ruby',      5, 0.7, 180,  { sword_time = 1 } )

---- Sapphire ----
-- Slow, but more durable than steel
register_gem( gemsmodn, 'sapphire',  5, 1.2, 500,  { sword_time = 1 } )

---- Was loaded? ---------------------------------------------------------------
-- Just to be sure, may remove if you like.
print( ' ++ loaded : Gemstones, by ZLovesPancakes' )
