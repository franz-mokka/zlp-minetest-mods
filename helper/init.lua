--------------------------------------------------------------------------------
--	Helper
--------------------------------------------------------------------------------
--	(c)2012 Fernando Zapata (ZLovesPancakes, Franz.ZPT)
--	Code licensed under GNU GPLv2
--		http://www.gnu.org/licenses/gpl-2.0.html
--	Content licensed under CC BY-SA 3.0
--		http://creativecommons.org/licenses/by-sa/3.0/
--------------------------------------------------------------------------------

--------------------------------------------------------------- Globals --------

--helper = {}

------------------------------------------------------------- Functions --------

function xyz( i,j,k ) return {x=i,y=j,z=k} end

function dist3d( a, b )
	return math.sqrt( ( b.x - a.x )^2 + ( b.y - a.y )^2 + ( b.z - a.z )^2 )
end

function inTable( v, t )
	for _, b in pairs(t) do
		if v == b then return true end
	end
	return false
end

function switch( c )
	local swtbl = {
		casevar = c,
		caseof = function (self, code)
			local f
			if (self.casevar) then
				f = code[self.casevar] or code.default
			else
				f = code.missing or code.default
			end
			if f then
				if type(f)=="function" then
					return f(self.casevar,self)
				else
					error("case "..
						tostring(self.casevar)..
						" not a function")
				end
			end
		end
	}
	return swtbl
end

function isDir( d )
	local f = io.open(d..'/.')
	if f then
		io.close(f)
		return true
	else
		return false
	end
end

--------------------------------------------------------------------------------
