local wibox = require("wibox")
local awful = require("awful")
local gears = require("gears")
local calendar_widget = require("awesome-wm-widgets.calendar-widget.calendar")

local clockwid = wibox.widget {
    {
        font = "Exo 2 12",
        visible = true,
        align = "center",
        format = "%H:%M\n %a %b %d",
        widget = wibox.widget.textclock
    },
    bg = "#0c0f0f",
    fg = "#c8cdcc",
    widget = wibox.container.background
}

local clock = wibox {
    bg = "#0c0f0f",
    fg = "#c8cdcc",
    width = 100,
    height = 60,
    visible = true,
    ontop = true,
    opacity = 1,
    shape = function(cr, width, height) 
        gears.shape.rounded_rect(cr, width, height, 10)
    end,
    widget = clockwid
}

local cw = calendar_widget({
    theme = 'mytheme',
    placement = 'bottom_right',
    start_sunday = true,
    radius = 8,
    previous_month_button = 1,
    next_month_button = 3,
})

clock:connect_signal("button::press",function(_, _, _, button)
    if button == 1 then cw.toggle() end
end)

return clock
