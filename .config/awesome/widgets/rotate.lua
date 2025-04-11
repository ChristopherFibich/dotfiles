local wibox = require("wibox")
local awful = require("awful")
local gears = require("gears")
local handle = io.popen("xinput -list")
local res = handle:read("*a")
if string.find(res, "Surface") == nil then
	return wibox.widget.textbox()
end

local rotate = wibox.widget.textbox()
rotate.markup = "  󰑵  "

-- Use a separate variable for the state
local is_rotated = false

local function rotator()
	if is_rotated then
		awful.spawn.easy_async_with_shell("sh ~/.config/awesome/widgets/portrait.sh")
	else
		awful.spawn.easy_async_with_shell("sh ~/.config/awesome/widgets/landscape.sh")
	end
	is_rotated = not is_rotated
end

rotate:buttons(gears.table.join(awful.button({}, 1, rotator), awful.button({}, 3, rotator)))

return rotate
