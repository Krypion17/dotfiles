local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")
local buttonsCreate = require("theme.titlebar.buttonsCreate")

-- Create a titlebar for the client.
-- By default, awful.rules will create one, but all it does is to call this
-- function.
-- buttons for the titlebar

local titlebar = {
    size = 40,
    bg_normal = "#26272b",
    bg_focus = '#0c0f0f'
}

client.connect_signal("request::titlebars", function (c)
    if c.requests_no_titlebar == false then
        local buttons = gears.table.join(
            awful.button({ }, 1, function()
                client.focus = c
                c:raise()
                awful.mouse.client.move(c)
            end),
            awful.button({ }, 3, function()
                client.focus = c
                c:raise()
                awful.mouse.client.resize(c)
            end)
        )
        awful.titlebar(c, titlebar) : setup {
            { -- Left
	        --[[wibox.widget {
                    awful.titlebar.widget.iconwidget(c),
		    left = 5,
		    widget = wibox.container.margin
    	        },--]]
                buttons = buttons,
                layout  = wibox.layout.fixed.horizontal
            },
            { -- Middle
                { -- Title
                    align  = "center",
                    widget = awful.titlebar.widget.titlewidget(c)
                },
                buttons = buttons,
                layout  = wibox.layout.flex.horizontal
            },
            { -- Right
                --[[awful.titlebar.widget.floatingbutton (c),
                awful.titlebar.widget.maximizedbutton(c),
                awful.titlebar.widget.stickybutton   (c),
                awful.titlebar.widget.ontopbutton    (c),
                awful.titlebar.widget.closebutton    (c),]]--
                buttonsCreate(c, "", "#c8cdcc", "minimise"),
                buttonsCreate(c, "", "#c8cdcc", "maximise"),
                buttonsCreate(c, "", "#22df6f", "close"),
                layout = wibox.layout.fixed.horizontal
            },
            layout = wibox.layout.align.horizontal
        }
        c.height = c.height - titlebar.size
    end
end)
