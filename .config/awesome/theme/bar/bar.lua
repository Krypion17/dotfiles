local awful = require("awful")
local wibox = require("wibox")
local clock = require("theme/bar/widgets/clock")
local tasklist = require("theme.bar.widgets.tasklist")
local taglist = require("theme/bar/widgets/taglist")

awful.screen.connect_for_each_screen(function (s)
    local widget = wibox.widget {
        nil,
        layout = wibox.layout.fixed.horizontal
    }
    widget:add(wibox.widget.textbox("hi"))
    s.mybar = wibox {
        width = 1920,
        height = 50,
	    bg = "#ffffff00",
        visible = true,
	    widgets = widget
    }
    awful.placement.bottom(s.mybar)
end)
