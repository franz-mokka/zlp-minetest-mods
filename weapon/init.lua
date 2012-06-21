--------------------------------------------------------------------------------
--	Weapons Mod
--------------------------------------------------------------------------------
--	Function for adding projectile weapons + some examples
--
--	(c)2012 Fernando Zapata
--	Code licensed under GNU GPLv2
--		http://www.gnu.org/licenses/gpl-2.0.html
--	Content licensed under CC BY-SA 3.0
--		http://creativecommons.org/licenses/by-sa/3.0/
--------------------------------------------------------------------------------

local function explode( pos, rad, nod )
	nod = nod or 'fire:basic_flame'
	for x= -rad, rad do
	for y= -rad, rad do
	for z= -rad, rad do
		if ( x * x + y * y + z * z ) <= ( rad * rad + rad ) then
			local np = { x=pos.x+x, y=pos.y+y, z=pos.z+z }
			local n = minetest.env:get_node(np)
			minetest.env:add_node( np, { name=nod } )
		end
	end
	end
	end
end

local function register_weapon( mod, name, wrep, brep, D, V, G, rad, exp, nod )

	exp = exp or false
	rad = rad or 1
	G = G or 9

	local shoot = function( item, user, point )

		if user:get_inventory():contains_item( 'main',
			mod..':'..name..'_b' ) then

			user:get_inventory():remove_item( 'main',
				mod..':'..name..'_b' )

			local pos = user:getpos()

			local obj = minetest.env:add_entity({
				x = pos.x,
				y = pos.y + 1.5,
				z = pos.z
				}, mod..':'..name..'_b_e' )

			local dir = user:get_look_dir()

			obj:setvelocity( {
				x = dir.x * V,
				y = dir.y * V,
				z = dir.z * V })

			obj:setacceleration( {
				x = dir.x * -3,
				y = -G,
				z = dir.z * -3 })
		end
		return

	end

	local entity_p = {
		physical	= false,
		textures	= { mod..'_'..name..'_b_e.png' },
		collisionbox	= { 0, 0, 0, 0, 0, 0 },
		timer		= 0,
		lastpos		= {}
	}

	entity_p.on_step = function(self, dtime)

		self.timer = self.timer+dtime
		local pos = self.object:getpos()
		local node = minetest.env:get_node(pos)

		if self.timer > rad/10 then

		local objs = minetest.env:get_objects_inside_radius( pos, rad )
		for k, obj in pairs( objs ) do
			obj:set_hp( obj:get_hp() - D)
			if obj:get_entity_name() ~= mod..':'..name..'_b_e' then
				--if obj:get_hp()<=0 then
				--	obj:remove()
				--end
				--obj:punch( obj )
				if exp then explode( pos, rad ) end
				self.object:remove()
			end
		end

		end

		if self.lastpos.x ~= nil then
			if node.name ~= "air" then
				if exp then explode( pos, rad, nod ) end
				self.object:remove()
			end
		end

		self.lastpos = pos

	end

	minetest.register_entity( mod..':'..name..'_b_e', entity_p )

	minetest.register_craftitem( mod..':'..name, {
		inventory_image	= mod..'_'..name..'.png',
		stack_max	= 1,
		on_use		= shoot,
	})

	minetest.register_craftitem( mod..':'..name..'_b', {
		inventory_image	= mod..'_'..name..'_b.png',
	})

	minetest.register_craft({
		output		= mod..':'..name,
		recipe		= wrep
	})

	minetest.register_craft({
		output		= mod .. ':' .. name .. '_b 16',
		recipe		= brep
	})

end

------------------------------------------------------ Register Weapons --------

local modname = 'weapon'

---- Rifle ----
local rif_rep = {
	{ 'default:steel_ingot', 'default:steel_ingot', 'default:wood' },
	{ '',                    '',                    'default:wood' }
}

local rifb_rep = {
	{ 'default:steel_ingot', 'default:coal_lump' }
}
register_weapon( modname, 'rifle', rif_rep, rifb_rep, 5, 25, 1.5 )
---- Pistol ----
--register_weapon( modname, 'pistol', 2, 20, 2 )
---- Anti Tank 4 ----
local at4_rep = {
	{ 'default:steel_ingot', 'default:steel_ingot', 'default:steel_ingot' },
	{ '',                    '',                    ''                    },
	{ 'default:steel_ingot', 'default:steel_ingot', 'default:steel_ingot' }
}

local at4b_rep = {
	{ 'tnt:tnt', 'default:steel_ingot', 'default:coal_lump' }
}

register_weapon( modname, 'at4', at4_rep, at4b_rep, 30, 15, 2, 3, true )

--------------------------------------------------------------------------------
