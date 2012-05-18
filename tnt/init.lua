--------------------------------------------------------------------------------
--	TNT
--------------------------------------------------------------------------------
--	A simple TNT mod which damages both terrain and entities.
--	Based on bcmpinc's pull request.
--
--	(c)2012 Fernando Zapata (ZLovesPancakes, Franz.ZPT)
--	Code licensed under GNU GPLv2
--		http://www.gnu.org/licenses/gpl-2.0.html
--	Content licensed under CC BY-SA 3.0
--		http://creativecommons.org/licenses/by-sa/3.0/
--------------------------------------------------------------------------------

local RANGE = 3
local DAMAGE = 16

------------------------------------------------------------ Definition --------

local tnt_ent = {
	physical	= true,
	collisionbox	= {-0.5,-0.5,-0.5, 0.5,0.5,0.5},
	visual		= 'cube',
	textures	= {	'tnt_top.png', 'tnt_bottom.png',
				'tnt_side.png', 'tnt_side.png',
				'tnt_side.png', 'tnt_side.png'},
	timer		= 0,
	health		= 1,
	blinktimer	= 0,
	blinkstatus	= true,
}

tnt_ent.on_activate = function( self, staticdata )

	self.object:setvelocity({x=0, y=4, z=0})
	self.object:setacceleration({x=0, y=-10, z=0})
	self.object:settexturemod('^[brighten')

end

tnt_ent.on_step = function( self, dtime )

	self.timer = self.timer + dtime
	self.blinktimer = self.blinktimer + dtime
	if self.timer>5 then
		self.blinktimer = self.blinktimer + dtime
		if self.timer>8 then
			self.blinktimer = self.blinktimer + dtime
			self.blinktimer = self.blinktimer + dtime
		end
	end
	if self.blinktimer > 0.5 then
		self.blinktimer = self.blinktimer - 0.5
		if self.blinkstatus then
			self.object:settexturemod('')
		else
			self.object:settexturemod('^[brighten')
		end
		self.blinkstatus = not self.blinkstatus
	end
	if self.timer > 10 then
		-- explode
		local pos = self.object:getpos()
		pos = { x=math.floor(pos.x+0.5),
			y=math.floor(pos.y+0.5),
			z=math.floor(pos.z+0.5) }
		local objs = minetest.env:get_objects_inside_radius(pos,
			RANGE+1)
		for k, obj in pairs(objs) do
			obj:set_hp( obj:get_hp() - DAMAGE )
		end
		for x=-RANGE,RANGE do
		for y=-RANGE,RANGE do
		for z=-RANGE,RANGE do
			if x*x+y*y+z*z <= RANGE * RANGE + RANGE then
				local np={x=pos.x+x,y=pos.y+y,z=pos.z+z}
				local n = minetest.env:get_node(np)
				if n.name ~= 'air' then
					minetest.env:remove_node(np)
				end
			end
		end
		end
		end
		self.object:remove()
	end

end

tnt_ent.on_punch = function( self, user )

	user:get_inventory():add_item( 'main', 'tnt:tnt' )
	self.object:remove()

end

-------------------------------------------------------------- Register --------

minetest.register_entity( 'tnt:tnt_ent', tnt_ent )

minetest.register_craft({
	output		= 'tnt:tnt 4',
	recipe		= {
		{'default:wood'},
		{'default:coal_lump'},
		{'default:wood'}
	}
})

minetest.register_node('tnt:tnt', {
	description	= 'TNT',
	tile_images	= {	'tnt_top.png', 'tnt_bottom.png',
				'tnt_side.png', 'tnt_side.png',
				'tnt_side.png', 'tnt_side.png'},
	drop		= '',
	material	= { diggability = 'not' }
})

minetest.register_on_punchnode( function( pos, node )
	if node.name ~= 'tnt:tnt' then return end
	minetest.env:remove_node( pos )
	minetest.env:add_entity( pos, 'tnt:tnt_ent' )
end)
----------------------------------------------------------------- Debug --------

print( ' ++ loaded : TNT, fixed by ZLovesPancakes' )

--------------------------------------------------------------------------------
