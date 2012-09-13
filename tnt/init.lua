--------------------------------------------------------------------------------
--	TNT
--------------------------------------------------------------------------------
--	A simple TNT mod which damages both terrain and entities.
--	Barely based on bcmpinc's pull request.
--
--	(c)2012 Fernando Zapata (ZLovesPancakes, Franz.ZPT)
--	Code licensed under GNU GPLv2
--		http://www.gnu.org/licenses/gpl-2.0.html
--	Content licensed under CC BY-SA 3.0
--		http://creativecommons.org/licenses/by-sa/3.0/
--------------------------------------------------------------------------------

--------------------------------------------------------------- Globals --------

tnt = {}

tnt.power = 3

------------------------------------------------------------- Functions --------

function tnt.damage( a, b, p )
	local i = 1 - dist3d( a, b ) / ( p * 2 )
	local d = math.ceil( ( i * i + i ) * 8 * p + 1 )
	return d
end

function tnt.explode( p, f )
	for x= -f, f do for y= -f, f do for z= -f, f do
		if ( x * x + y * y + z * z ) <= ( f * f + f ) then
			local np = xyz( p.x+x, p.y+y, p.z+z )
			if minetest.env:get_node( np ).name == 'tnt:tnt' then
				tnt.lit( np )
			elseif minetest.env:get_node( np ).name ~= 'air' then
				--if math.random( 1,3 ) == 1 then
				--	minetest.env:dig_node( np )
				--else
					minetest.env:dig_node( np )
				--end
			end
		end
	end end end
	local os = minetest.env:get_objects_inside_radius( p, f * 2 + 1 )
	for _, o in pairs( os ) do
		local op = o:getpos()
		local dd = dist3d( p, op )
		local u = xyz( 0,0,0 )
		local vm = 0
		if dd > 0 then
			u = xyz( (op.x-p.x)/dd, (op.y-p.y)/dd, (op.z-p.z)/dd )
			vm = 18 * (1/dd)
		end
		o:setvelocity( xyz( u.x*vm, u.y*vm, u.z*vm ) )
		o:set_hp( o:get_hp() - tnt.damage( p, op, f ) )
	end
end

function tnt.lit( p, n )
	--if n.name ~= 'tnt:tnt' then return end
	minetest.env:remove_node( p )
	minetest.env:add_entity( p, 'tnt:tnt_ent' )
end

----------------------------------------------------------------- Nodes --------

minetest.register_node('tnt:tnt', {
	description	= 'TNT',
	groups	= {	snappy = 2,
			choppy = 3,
			oddly_breakable_by_hand = 2 },
	tile_images	= { 'tnt_top.png', 'tnt_bottom.png', 'tnt_side.png' },
	sounds		= default.node_sound_wood_defaults()
})

--------------------------------------------------------------- Recipes --------

minetest.register_craft({
	output		= 'tnt:tnt 4',
	recipe		= {
		{ 'default:coal_lump', 'default:sand', 'default:coal_lump' },
		{ 'default:sand', 'default:coal_lump', 'default:sand' },
		{ 'default:coal_lump', 'default:sand', 'default:coal_lump' },
	}
})

-------------------------------------------------------------- Entities --------

tnt.ent_proto = {
	hp_max		= 100,
	physical	= true,
	collisionbox	= { -1/2, -1/2, -1/2, 1/2, 1/2, 1/2 },
	visual		= 'cube',
	textures = {	'tnt_top.png', 'tnt_bottom.png', 'tnt_side.png',
			'tnt_side.png', 'tnt_side.png', 'tnt_side.png' },

	timer		= 0,
	btimer		= 0,
	bstatus		= true,
	physical_state	= true,

	on_activate = function( sf, sd )
		sf.object:set_armor_groups( { immortal=1 } )
		sf.object:setvelocity({x=0, y=4, z=0})
		sf.object:setacceleration({x=0, y=-10, z=0})
		sf.object:settexturemod('^[brighten')
	end,

	on_step = function( sf, dt )
		sf.timer = sf.timer + dt
		sf.btimer = sf.btimer + dt
		if sf.btimer > 0.5 then
			sf.btimer = sf.btimer - 0.5
			if sf.bstatus then
				sf.object:settexturemod('')
			else
				sf.object:settexturemod('^[brighten')
			end
			sf.bstatus = not sf.bstatus
		end
		if sf.timer > 0.5 then
			local p = sf.object:getpos()
			p.y = p.y - 0.501
			local nn = minetest.env:get_node(p).name
			if not minetest.registered_nodes[nn] or
				minetest.registered_nodes[nn].walkable then
				sf.object:setvelocity({x=0,y=0,z=0})
				sf.object:setacceleration({x=0, y=0, z=0})
			end
		end
		if sf.timer > 4 then
			local pos = sf.object:getpos()
			pos = xyz( math.floor(pos.x+0.5), math.floor(pos.y+0.5),
				math.floor(pos.z+0.5) )
			tnt.explode( pos, tnt.power, 'air' )
			sf.object:remove()
		end
	end,
}

minetest.register_entity( 'tnt:tnt_ent', tnt.ent_proto )

------------------------------------------------------------------ ABMs --------

minetest.register_abm({
	nodenames	= { 'tnt:tnt' },
	neighbors	= { 'group:igniter' },
	interval	= 5,
	chance		= 1,
	action		= tnt.lit
})

--------------------------------------------------------------------------------
