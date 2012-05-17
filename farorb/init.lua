--------------------------------------------------------------------------------
--	Magic Teleporting Ball
--	(c)2012 Fernando Zapata (ZLovesPancakes, Franz.ZPT)
--------------------------------------------------------------------------------

local V = 18
local G = 9

local throw_orb = function( itemstack, user, pointed )

	if itemstack:take_item() ~= nil then
		local dir = user:get_look_dir()
		local pos = user:getpos()
		local obj = minetest.env:add_entity( {
			x = pos.x,
			y = pos.y + 1.5,
			z = pos.z
		}, 'farorb:farorb_ent' )
		obj:get_luaentity().launcher = user or nil
		obj:setvelocity( {
			x = dir.x * V,
			y = dir.y * V,
			z = dir.z * V
		})
		obj:setacceleration( {
			x = dir.x * -3,
			y = -G,
			z = dir.z * -3
		})
	end
	return itemstack

end

local farorb_ent = {

	physical = false,
	textures = { 'farorb_farorb.png' },
	collisionbox = { 0, 0, 0, 0, 0, 0 },
	launcher = nil,
	timer = 0

}

--farorb_ent.on_activate = function( self, static )
--
--	if self.launcher ~= nil then
--		minetest.chat_send_all( self.launcher )
--	else
--		minetest.chat_send_all( 'launcher is nil?' )
--	end
--
--end

farorb_ent.on_step = function( self, dtime )

	if self.launcher == nil then self.object:remove(); return end

	local pos = self.object:getpos()
	local node = minetest.env:get_node(pos)

	if node.name ~= 'air' then
		pos = minetest.env:find_node_near( pos, 1, 'air' )
		if pos == nil then
			minetest.chat_send_player(
				self.launcher:get_player_name(),
				"can't teleport, no air near location" )
		else
			--self.launcher:setpos( pos )
			self.launcher:moveto( pos )
		end
		self.object:remove()
	end

	--minetest.env:add_node( pos, { name="fire:basic_flame" } )

end

minetest.register_entity( 'farorb:farorb_ent', farorb_ent )

minetest.register_craftitem( 'farorb:farorb', {
	description = 'Farwalk Orb',
	inventory_image = 'farorb_farorb.png',
	on_use = throw_orb
})

minetest.register_craft({
	output = 'farorb:farorb',
	recipe = {
		{ '',              'default:glass', ''              },
		{ 'default:glass', 'default:mese',  'default:glass' },
		{ '',              'default:glass', ''              }
	}
})

----------------------------------------------------------- End of File --------
