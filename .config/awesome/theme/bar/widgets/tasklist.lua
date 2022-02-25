local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")

local buttons = gears.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  c:emit_signal(
                                                      "request::activate",
                                                      "tasklist",
                                                      {raise = true}
                                                  )
                                              end
                                          end),
                     awful.button({ }, 3, function()
                                              awful.menu.client_list({ theme = { width = 250 } })
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                          end))

return function(s)
    return wibox.widget {
        awful.widget.tasklist {
	        screen = s,
	        buttons = buttons,
	        filter   = awful.widget.tasklist.filter.currenttags,
    	},
        bg = "#222222",
	    opacity = 1,
        visible = true,
        ontop = true,
	    shape = function(cr, width, height)
	        gears.shape.rectangle(cr, 100, 30)
	    end,
        widget = wibox.container.background
    }

end
