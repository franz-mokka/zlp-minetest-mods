--------------------------------------------------------------------------------
--	Macintosh SE
--------------------------------------------------------------------------------

minetest.register_node( 'macse:macse', {
	description		= 'Macintosh SE',
	groups		= {	snappy = 1,
				choppy = 2,
				oddly_breakable_by_hand = 2 },
	tiles		= {	'macse_u.png', 'macse_d.png',
				'macse_c.png', 'macse_s.png',
				'macse_b.png', 'macse_t.png' },
	drawtype		= 'nodebox',
	paramtype		= 'light',
	paramtype2		= 'facedir',
	node_box	= {	type = 'fixed',
				fixed = {
					{ -3/8, 3/8, -3/8, -1/8, 1/2, 3/8 },
					{ -1/8, 3/8, -3/8, 1/8, 1/2, 3/16 },
					{ 1/8, 3/8, -3/8, 3/8, 1/2, 3/8 },
					{ -3/8, -3/8, -3/8, 3/8, 3/8, 3/8 },
					{ -3/8, -1/2, -5/16, 3/8, -3/8, 3/8 } } },
	selection_box	= {	type = 'fixed',
				fixed = { -3/8, -1/2, -3/8, 3/8, 1/2, 3/8 } },
})
