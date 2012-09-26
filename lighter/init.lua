--------------------------------------------------------------------------------
--	Lighter
--------------------------------------------------------------------------------
--	Easy method to create fire
--
--	(c)2012 Fernando Zapata (ZLovesPancakes, Franz.ZPT)
--	Code licensed under GNU GPLv2
--		http://www.gnu.org/licenses/gpl-2.0.html
--	Content licensed under CC BY-SA 3.0
--		http://creativecommons.org/licenses/by-sa/3.0/
--	2012-05-01	14:22:27
--------------------------------------------------------------------------------

minetest.register_craftitem( 'lighter:flint', {
	description		= 'Flint',
	inventory_image		= 'lighter_flint.png'
})

minetest.register_tool( 'lighter:lighter', {
	description		= 'Flint & Steel',
	inventory_image		= 'lighter_lighter.png',
	on_use			= function( s, u, p )
		if p.type ~= 'node' then return end
		if minetest.env:get_node( p.under ).name == 'tnt:tnt' then
			tnt.lit( p.under )
		else
			minetest.env:add_node( p.above,
				{ name='fire:basic_flame' } )
		end
		s:add_wear( math.ceil(65535/30) )
		return s
	end
})

minetest.register_craft({
	output			= 'lighter:lighter',
	recipe			= {
		{ 'default:steel_ingot', '' },
		{ '', 'lighter:flint' }
	}
})

----------------------------------------------------------- End of File --------
