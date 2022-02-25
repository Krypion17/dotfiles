local wibox = require("wibox")
local awful = require("awful")
local gears = require("gears")

local functions = {
    ["close"] = function (c) c:kill() end,
    ["maximise"] = function (c) c.maximized = not c.maximized end,
    ["minimise"] = function (c) c.minimized = not c.minimized end
}

local fontSize = 12

local function buttonsCreate(c, icon, color, cmd)
    local origColor = color
    local origSize = fontSize
    local button = wibox.widget {
        font = "Font Awesome 5 Free "..tostring(fontSize),
        markup = "<span foreground = '"..color.."'><b>"..icon.."</b>   </span>",
        visible = true,
        forced_width = 35,
        forced_height = fontSize,
        align = "right",
        widget = wibox.widget.textbox,
    }

    button:buttons(gears.table.join(
        awful.button({ }, 1, function ()
            functions[cmd](c)
        end)
    ))

    button:connect_signal("mouse::enter", function (_)
       fontSize = fontSize + 2
    end)

    button:connect_signal("mouse::leave", function (_)
       fontSize = origSize
    end)

    button:connect_signal("button::press", function (_)
       fontSize = fontSize - 2
    end)

    button:connect_signal("button::release", function (_)
       fontSize = origSize
    end)

    c:connect_signal("focus", function ()
        color = origColor 
    end)

    c:connect_signal("unfocus", function ()
        color = "#bbbbbb"
    end)

    return button
end

return buttonsCreate
