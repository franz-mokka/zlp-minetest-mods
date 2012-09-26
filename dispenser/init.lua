--------------------------------------------------------------------------------
--	Dispenser
--------------------------------------------------------------------------------
--	Mesecons operated dispenser
--
--	(c)2012 Fernando Zapata (ZLovesPancakes, Franz.ZPT)
--	Code licensed under GNU GPLv2
--		http://www.gnu.org/licenses/gpl-2.0.html
--	Content licensed under CC BY-SA 3.0
--		http://creativecommons.org/licenses/by-sa/3.0/
--------------------------------------------------------------------------------

--------------------------------------------------------------- Globals --------

dispenser = {}

------------------------------------------------------------- Functions --------

function dispenser.dispense( p, n )
	local i = minetest.env:get_meta( p ):get_inventory()
	while not i:is_empty('main') do
		local k = math.random( 9 )
		local s = i:get_stack( 'main', k )
		if not s:is_empty() then
			local ps = s:peek_item()
			s:take_item()
			i:set_stack( 'main', k, s )
			local v = {x=0,y=0,z=0}
			case( n.param2 ):of {
				[0] = function() v.z = v.z - 1 end,
				[1] = function() v.x = v.x - 1 end,
				[2] = function() v.z = v.z + 1 end,
				[3] = function() v.x = v.x + 1 end
			}
			p.x = p.x + v.x
			p.z = p.z + v.z
			if weapon.arrows[ps:get_name()] ~= nil then
				weapon.shoot( ps:get_name(), p, v, 18, 0,
					'throwing_sound' )
			else
				local o = minetest.env:add_item( p, ps )
				if o ~= nil then
					v.x = v.x * 5 + math.random(-1,1)
					v.z = v.z * 5 + math.random(-1,1)
					o:setvelocity(v)
				end
			end
			break
		end
	end
end

---------------------------------------------------------------- Blocks --------

minetest.register_node( 'dispenser:dispenser', {
	description		= 'Dispenser',
	groups			= { cracky = 3, mesecon = 2 },
	tiles		= {	'dispenser_s.png', 'dispenser_s.png',
				'dispenser_s.png', 'dispenser_s.png',
				'dispenser_s.png', 'dispenser_f.png' },
	paramtype2		= 'facedir',
	is_ground_content	= true,
	sounds			= default.node_sound_stone_defaults(),
	on_construct		= function( p )
		local m = minetest.env:get_meta( p )
		m:set_string(	'formspec',
				'size[8,8]\
				list[context;main;2.5,0;3,3;]\
				list[current_player;main;0,4;8,4;]' )
		local i = m:get_inventory()
		i:set_size( 'main', 3 * 3 )
	end,
	can_dig			= function( p, u )
		local i = minetest.env:get_meta( p ):get_inventory()
		return i:is_empty( 'main' )
	end
})

--------------------------------------------------------------- Recipes --------

minetest.register_craft({
	output	= 'dispenser:dispenser',
	recipe	= {
		{ 'default:cobble', 'default:cobble', 'default:cobble' },
		{ 'default:cobble', 'weapon:xbow_wood', 'default:cobble' },
		{ 'default:cobble', 'mesecons:mesecon', 'default:cobble' } }
})

-------------------------------------------------------------- Mesecons --------

mesecon:register_effector( 'dispenser:dispenser', 'dispenser:dispenser' )

mesecon:register_on_signal_on( function( p, n )
	if n.name == 'dispenser:dispenser' then
		dispenser.dispense( p, n )
	end
end)

--------------------------------------------------------------------------------
