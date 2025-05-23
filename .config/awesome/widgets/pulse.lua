local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")

-- Pulse
local pulse = wibox.widget.textbox()
local volume
local icon

local tooltip = awful.tooltip({})
tooltip:add_to_object(pulse)
tooltip.mode = "inside"
tooltip.gaps = 5

pulse:connect_signal("mouse::enter", function()
	local script =
		[[ pactl list sinks | grep -A 10 "State: RUNNING" | grep 'Description' | cut -d ':' -f2 | sed 's/^ *//' ]]
	awful.spawn.easy_async_with_shell(script, function(stdout)
		tooltip.text = tostring(stdout:gsub("\n[^\n]*$", ""))
	end)
end)

local function update_volume()
	local scriptVolume = [[
    pamixer --get-volume
    ]]
	local handle = io.popen(scriptVolume)
	volume = string.gsub(handle:read("*a"), "\n", "%%")
	volme = volume .. " "
	handle:close()
end

local function update_icon()
	local bt = false
	local scriptMute = [[
    pamixer --get-mute
    ]]
	local scriptSink = [[
    pamixer --get-default-sink
    ]]
	local handle = io.popen(scriptSink)
	if handle:read("*a"):find("bluez", 1, true) then
		bt = true
	end
	local handle = io.popen(scriptMute)
	if handle:read("*a"):find("false", 1, true) then
		if bt then
			icon = "󰂰"
		else
			icon = "󰕾"
		end
	else
		if bt then
			icon = "󰂲"
		else
			icon = "󰖁"
		end
	end
	handle:close()
end

local function update_all()
	update_volume()
	update_icon()
	pulse.markup = icon .. " " .. volume
end

gears.timer({
	timeout = 10,
	autostart = true,
	call_now = true,
	callback = function()
		update_all()
	end,
})

awesome.connect_signal("update-pulse-volume", function()
	update_volume()
	pulse.markup = icon .. " " .. volume
end)

awesome.connect_signal("update-pulse-icon", function()
	update_icon()
	pulse.markup = icon .. " " .. volume
end)

pulse:buttons(gears.table.join(
	awful.button({}, 1, function()
		awful.spawn("pamixer -t")
		update_icon()
		pulse.markup = icon .. " " .. volume
	end),
	awful.button({}, 3, function()
		awful.spawn(terminal .. " -e pulsemixer")
		update_icon()
		pulse.markup = icon .. " " .. volume
	end),
	awful.button({}, 4, function()
		awful.spawn.easy_async([[pamixer -i 1]])
		update_volume()
		update_icon()
		pulse.markup = icon .. " " .. volume
	end),
	awful.button({}, 5, function()
		awful.spawn.easy_async([[pamixer -d 1]])
		update_volume()
		update_icon()
		pulse.markup = icon .. " " .. volume
	end)
))
return pulse
