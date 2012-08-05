--------------------------------------------------------------------------------
--	Wheat
--------------------------------------------------------------------------------
--	Harvestable wheat, grass and bread
--
--	(c)2012 Fernando Zapata (ZLovesPancakes, Franz.ZPT)
--	Code licensed under GNU GPLv2
--		http://www.gnu.org/licenses/gpl-2.0.html
--	Content licensed under CC BY-SA 3.0
--		http://creativecommons.org/licenses/by-sa/3.0/
--------------------------------------------------------------------------------

------------------------------------------------------------- Functions --------

local function xyz( i,j,k ) return {x=i,y=j,z=k} end

---------------------------------------------------------------- Blocks --------

minetest.register_node( 'wheat:tall_grass', {
	description		= 'Tall grass',
	groups		= {	snappy = 3,
				dig_immediate = 3,
				flammable = 2 },
	tiles			= { 'wheat_grass.png' },
	drawtype		= 'plantlike',
	paramtype		= 'light',
	walkable		= false,
	buildable_to		= true,
	selection_box	= {	type = 'fixed',
				fixed = { -3/8, -1/2, -3/8, 3/8, 0, 3/8 } },
	drop		= {	max_items = 1,
				items = { {
					items = { 'wheat:seeds' },
					rarity = 3 } } },
	sounds			= default.node_sound_leaves_defaults()
})

minetest.register_node( 'wheat:seeds', {
	description		= 'Seeds',
	groups		= {	snappy = 3,
				dig_immediate = 3,
				flammable = 2 },
	inventory_image		= 'wheat_seeds.png',
	wield_image		= 'wheat_seeds.png',
	tiles			= { 'wheat_seeds_node.png' },
	drawtype		= 'plantlike',
	paramtype		= 'light',
	walkable		= false,
	selection_box	= {	type = 'fixed',
				fixed = { -3/8, -1/2, -3/8, 3/8, -3/8, 3/8 } },
	sounds			= default.node_sound_leaves_defaults(),
	on_place		= function( i, u, p )
		if p.type ~= 'node' then return i end
		np = xyz( p.above.x,p.above.y-1,p.above.z )
		local n = minetest.env:get_node( np ).name
		if n == 'wheat:farmland' or n == 'wheat:farmland_damp' then
			return minetest.item_place( i, u, p )
		else return i end
	end
})

minetest.register_node( 'wheat:wheat_node', {
	description		= 'Wheat node',
	groups		= {	snappy = 3,
				dig_immediate = 3,
				flammable = 2 },
	tiles			= { 'wheat_node.png' },
	drawtype		= 'plantlike',
	paramtype		= 'light',
	walkable		= false,
	selection_box	= {	type = 'fixed',
				fixed = { -3/8, -1/2, -3/8, 3/8, 1/2, 3/8 } },
	drop		= {	max_items = 4,
				items = {
					{ items={'wheat:seeds'}, rarity=2 },
					{ items={'wheat:seeds'}, rarity=4 },
					{ items={'wheat:seeds'}, rarity=6 },
					{ items={'wheat:wheat'} } } },
	sounds			= default.node_sound_leaves_defaults(),
})

minetest.register_node( 'wheat:farmland', {
	description		= 'Farmland',
	groups			= { crumbly = 3 },
	tiles		= {	'wheat_farmland.png',
				'default_dirt.png',
				'default_dirt.png' },
	is_ground_content	= true,
	drop			= 'default:dirt',
	sounds			= default.node_sound_dirt_defaults(),
})

minetest.register_node( 'wheat:farmland_damp', {
	description		= 'Damp farmland',
	groups			= { crumbly = 3 },
	tiles		= {	'wheat_farmland_damp.png',
				'default_dirt.png',
				'default_dirt.png' },
	is_ground_content	= true,
	drop			= 'default:dirt',
	sounds			= default.node_sound_dirt_defaults(),
})

----------------------------------------------------------------- Tools --------

minetest.register_tool( 'wheat:hoe_wood', {
	description		= "Wooden Hoe",
	inventory_image		= "wheat_tool_woodhoe.png",
	tool_capabilities	= {	max_drop_level=0,
					groupcaps={
					crumbly={
						times={[1]=3.00, [2]=0.80, [3]=0.50},
						uses=10,
						maxlevel=1 } } },
	on_use			= function( i, u, p )
		if p.type ~= 'node' then return end
		local n = minetest.env:get_node( p.under )
		if n.name == 'default:dirt' or n.name == 'default:dirt_with_grass' then
			minetest.env:set_node( p.under, { name='wheat:farmland' } )
			local def = ItemStack({name=n.name}):get_definition()
			local tp = i:get_tool_capabilities()
			local dp = minetest.get_dig_params(def.groups, tp)
			i:add_wear(dp.wear)
			return i
		else return end
	end
})

----------------------------------------------------------------- Items --------

minetest.register_craftitem( 'wheat:wheat', {
	description		= 'Wheat',
	inventory_image		= 'wheat_item.png',
})

minetest.register_craftitem( 'wheat:flour', {
	description		= 'Flour',
	inventory_image		= 'wheat_flour.png',
})

minetest.register_craftitem( 'wheat:dough', {
	description		= 'Dough',
	inventory_image		= 'wheat_dough.png',
})

minetest.register_craftitem( 'wheat:bread', {
	description		= 'Not bread',
	inventory_image		= 'wheat_bread.png',
	on_use			= minetest.item_eat(8)
})

--------------------------------------------------------------- Recipes --------

minetest.register_craft({
	output		= 'wheat:hoe_wood',
	recipe	= {	{ 'default:wood', 'default:wood', 'default:wood' },
			{ '', 'default:stick', '' },
			{ '', 'default:stick', '' } },
})

minetest.register_craft({
	output		= 'wheat:flour',
	recipe		= { { 'wheat:wheat' } },
})

minetest.register_craft({
	type		= 'shapeless',
	output		= 'wheat:dough',
	recipe		= { 'wheat:flour', 'bucket:bucket_water' },
	replacements	= { { 'bucket:bucket_water', 'bucket:bucket_empty' } }
})

minetest.register_craft({
	type		= 'cooking',
	output		= 'wheat:bread',
	recipe		= 'wheat:dough',
	cooktime	= 3
})

------------------------------------------------------------------ ABMs --------

--[[minetest.register_abm({
	nodenames	= { 'default:dirt_with_grass' },
	neighbors	= { 'wheat:tall_grass' },
	interval	= 300,
	chance		= 8,
	action		= function( p, n, aoc, aocw )
		p.y = p.y + 1
		minetest.env:set_node( p, { name='wheat:tall_grass' } )
	end
})]]

minetest.register_abm({
	nodenames	= { 'wheat:farmland' },
	neighbors	= { 'group:water' },
	interval	= 10,
	chance		= 1,
	action		= function( p, n, aoc, aocw )
		minetest.env:set_node( p, { name='wheat:farmland_damp' } )
	end
})

minetest.register_abm({
	nodenames	= { 'wheat:farmland' },
	interval	= 60,
	chance		= 1,
	action		= function( p, n, aoc, aocw )
		minetest.env:set_node( p, { name='default:dirt' } )
	end
})

minetest.register_abm({
	nodenames	= { 'wheat:seeds' },
	neighbors	= { 'wheat:farmland_damp' },
	interval	= 120,
	chance		= 3,
	action		= function( p, n, aoc, aocw )
		local l = minetest.env:get_node_light( p )
		if l > 8 then
			minetest.env:set_node( p, { name='wheat:wheat_node' } )
		end
	end
})

minetest.register_abm({
	nodenames	= { 'wheat:wheat_node' },
	neighbors	= { 'wheat:farmland_damp' },
	interval	= 120,
	chance		= 3,
	action		= function( p, n, aoc, aocw )
		local l = minetest.env:get_node_light( p )
		if l > 8 then
			local np = xyz( p.x,p.y,p.z )
			for t=1,2 do
				np.y = p.y + t
				local nn = minetest.env:get_node( np ).name
				if nn == 'air' then
					minetest.env:set_node( np,
						{ name='wheat:wheat_node' } )
					break
				end
			end
		end
	end
})

minetest.register_abm({
	nodenames	= { 'wheat:farmland_damp' },
	interval	= 10,
	chance		= 3,
	action		= function( p, n, aoc, aocw )
		if not minetest.env:find_node_near( p, 1, 'group:water' ) then
			minetest.env:set_node( p, { name='wheat:farmland' } )
		end
	end
})

------------------------------------------------------------ Generation --------

minetest.register_on_generated( function( minp, maxp, seed )
	local r = PseudoRandom( seed+10 )
	local l = minetest.env:find_nodes_in_area( minp, maxp,
		'default:dirt_with_grass' )
	if #l < 1 then return end
	for k,v in pairs( l ) do
		if r:next( 1,6 ) == 1 then
			v.y = v.y + 1
			if minetest.env:get_node( v ).name == 'air' then
				minetest.env:set_node( v,
					{ name='wheat:tall_grass' } )
			end
		end
	end
end)

--------------------------------------------------------------------------------
