--------------------------------------------------------------------------------
--	Bed
--------------------------------------------------------------------------------
--	Beds which set spawn when placed
--
--	(c)2012 Fernando Zapata (ZLovesPancakes, Franz.ZPT)
--	Code licensed under GNU GPLv2
--		http://www.gnu.org/licenses/gpl-2.0.html
--	Content licensed under CC BY-SA 3.0
--		http://creativecommons.org/licenses/by-sa/3.0/
--------------------------------------------------------------------------------

------------------------------------------------------------- Constants --------

bed = {}

bed.spnlst = {}
bed.spndir = minetest.get_worldpath() .. '/spawn/'

------------------------------------------------------------- Functions --------

function bed.setHome( n, p )
	local f = io.open( bed.spndir .. n, 'w' )
	local t = 'return{x=' .. p.x .. ',y=' .. p.y .. ',z=' .. p.z .. '}'
	bed.spnlst[n] = p
	f:write( t )
	f:close()
end

function bed.unsetHome( n )
	local f = io.open( bed.spndir .. n, 'w' )
	bed.spnlst[n] = nil
	f:write( 'return nil' )
	f:close()
end

function bed.moveToHome( u )
	u:setpos( bed.spnlst[u:get_player_name()] )
end

----------------------------------------------------------------- Nodes --------

minetest.register_node( 'bed:bed_a', {
	description		= 'Bed',
	groups			= {
				snappy = 1,
				choppy = 2,
				oddly_breakable_by_hand = 2,
				flammable = 3 },
	inventory_image		= 'bed_icon.png',
	wield_image		= 'bed_icon.png',
	tiles			= {
				'bed_top_b.png', 'default_wood.png',
				'bed_side_b.png' },
	drawtype		= 'nodebox',
	paramtype		= 'light',
	paramtype2		= 'facedir',
	node_box		= nodeBox( -1/2, -1/2, -1/2, 1/2, 1/8, 1/2 ),
	selection_box		= nodeBox( -1/2, -1/2, -1/2, 1/2, 1/8, 3/2 ),
	after_place_node	= function( p, u )
		local m = minetest.env:get_meta( p )
		local n = minetest.env:get_node( p )
		m:set_string('owner', u:get_player_name())
		case( n.param2 ):of {
			[0] = function() p.z = p.z + 1 end,
			[1] = function() p.x = p.x + 1 end,
			[2] = function() p.z = p.z - 1 end,
			[3] = function() p.x = p.x - 1 end
		}
		minetest.env:set_node( p, {name='bed:bed_b', param2=n.param2} )
		bed.setHome( u:get_player_name(), u:getpos() )
		minetest.chat_send_player( u:get_player_name(), 'Home set!' )
	end,
	on_destruct		= function( p )
		bed.unsetHome( minetest.env:get_meta( p ):get_string('owner') )
		case( minetest.env:get_node(p).param2 ):of {
			[0] = function() p.z = p.z + 1 end,
			[1] = function() p.x = p.x + 1 end,
			[2] = function() p.z = p.z - 1 end,
			[3] = function() p.x = p.x - 1 end
		}
		minetest.env:remove_node( p )
	end
})

minetest.register_node( 'bed:bed_b', {
	groups			= {
				snappy = 1,
				choppy = 2,
				oddly_breakable_by_hand = 2 },
	tiles		= {	'bed_top_a.png', 'default_wood.png',
				'bed_right_a.png', 'bed_left_a.png',
				'bed_front_a.png', 'bed_front_a.png' },
	drawtype		= 'nodebox',
	paramtype		= 'light',
	paramtype2		= 'facedir',
	node_box		= nodeBox( -1/2, -1/2, -1/2, 1/2, 1/8, 1/2 ),
	selection_box		= nodeBox( 0, 0, 0, 0, 0, 0 )
})

--------------------------------------------------------------- Recipes --------

minetest.register_craft({
	output		= 'bed:bed',
	recipe	= {	{ 'wool:blue', 'wool:blue', 'wool:blue' },
			{ 'default:wood', 'default:wood', 'default:wood' } }
})

---------------------------------------------------------------- Events --------

minetest.register_on_joinplayer( function( u )
	local n = u:get_player_name()
	local f = loadfile( bed.spndir .. n )
	if f ~= nil then bed.spnlst[n] = f() end
end)

minetest.register_on_respawnplayer( function( u )
	if bed.spnlst[u:get_player_name()] ~= nil then
		bed.moveToHome( u )
		return true
	end
end)

--------------------------------------------------------------------------------

minetest.register_alias( 'bed:bed', 'bed:bed_a' )

if not isDir(bed.spndir) then
	os.execute( 'mkdir ' .. bed.spndir )
end

--------------------------------------------------------------------------------
