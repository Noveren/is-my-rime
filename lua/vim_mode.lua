
local function is_win()
	local path_separator = package.config:sub(1, 1)
	if path_separator == '\\' then
		return true
	else
		return false
	end
end

-- 当按下 Escape 键时，若处于转义模式，则自动切换为编码模式
local function vim_mode(key, env)
	local engine = env.engine
	local context = engine.context

	if is_win() and key:repr() == "Escape" then
		local get_ascii_mode = context:get_option("ascii_mode")
		if not get_ascii_mode then
			context:set_option("ascii_mode", true)
		end
		return 2 -- kNoop
	end
	return 2 -- kNoop
end

return vim_mode
