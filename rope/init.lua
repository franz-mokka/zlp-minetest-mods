--------------------------------------------------------------------------------
--	Rope
--------------------------------------------------------------------------------
--	Climbable ropes which can be extended or cut
--
--	(c)2012 Fernando Zapata (ZLovesPancakes, Franz.ZPT)
--	Code licensed under GNU GPLv2
--		http://www.gnu.org/licenses/gpl-2.0.html
--	Content licensed under CC BY-SA 3.0
--		http://creativecommons.org/licenses/by-sa/3.0/
--------------------------------------------------------------------------------

------------------------------------------------------- Node Definition --------

minetest.register_node( 'rope:rope', {

	description		= 'Rope',
	drawtype		= 'nodebox',
	tiles			= { 'rope_rope.png' },
	paramtype		= 'light',
	is_ground_content	= true,
	walkable		= false,
	climbable		= true,
	groups			= { snappy = 1, oddly_breakable_by_hand = 1 },
	node_box		= {
		type	= 'fixed',
		fixed	= { -0.0625, -0.5, -0.0625, 0.0625, 0.5, 0.0625 }
	},
	selection_box		= {
		type	= 'fixed',
		fixed	= { -0.0625, -0.5, -0.0625, 0.0625, 0.5, 0.0625 }
	},

	on_place = function( stack, user, point )
		if point.type ~= 'node' then return stack end

		local pos = point.under
		local node = minetest.env:get_node( pos )

		if node.name ~= 'rope:rope' then
			pos = point.above
			node = minetest.env:get_node( pos )
		end

		while node.name == 'rope:rope' do
			pos.y = pos.y - 1
			node = minetest.env:get_node( pos )
		end

		if node.name ~= 'air' then
			minetest.chat_send_player(
				user:get_player_name(),
				"The rope can't be longer!" )
			return stack
		else
			point.under = pos
			point.above = pos
		end

		return minetest.item_place( stack, user, point )
	end,

	on_dig = function( pos, node, user )
		local code = minetest.node_dig( pos, node, user )
		local count = 0

		local inv = user:get_inventory()

		local posb = pos
		posb.y = posb.y - 1
		local nodeb = minetest.env:get_node( posb )

		while nodeb.name == 'rope:rope' do
			minetest.env:remove_node( posb )
			count = count + 1
			posb.y = posb.y - 1
			nodeb = minetest.env:get_node( posb )
		end

		inv:add_item( 'main', 'rope:rope ' .. count )

		return code
	end

})

------------------------------------------------------- Crafting Recipe --------

minetest.register_craft({
	output		= 'rope:rope 4',
	recipe		= {
		{ 'default:junglegrass' },
		{ 'default:junglegrass' },
		{ 'default:junglegrass' },
	}
})

--------------------------------------------------------------------------------
