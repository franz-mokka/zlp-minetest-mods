--------------------------------------------------------------------------------
--    Gemstones!
--    This mod adds gems such as rubies, sapphires, emeralds, etc. Tools and
--    "solid" blocks can be crafted from the gems.
--
--    by ZLovesPancakes
--    2011-12-04    13:26:40
--------------------------------------------------------------------------------
require "gems.emerald"
require "gems.ruby"
require "gems.sapphire"
print( minetest.env:path_userdata() .. "usermods" )
---- Create gems on chunk generation -------------------------------------------
-- celeron55 said:
-- "It is somewhat doable, but not very fancily. Off the top of my head without
-- any testing:"
-- + My fixes

local reggems = {
	gems.emerald.orename, gems.ruby.orename, gems.sapphire.orename
}

local gemstones_gen = function( minp, maxp )
	for c, gemname in ipairs(reggems) do
		local amount = math.random( 0, 20 )
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
