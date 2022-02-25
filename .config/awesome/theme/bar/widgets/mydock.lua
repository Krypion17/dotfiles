local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local icons = require("theme/bar/widgets/icons")


local pinned_apps_classes = {"kitty", "Firefox", "dolphin"}
local windows = {""}
local fontsize = 30
local iconSize = 94

local setupTable = wibox.widget {
    layout = wibox.layout.flex.horizontal,
}

local mydock = wibox {
    height = 69,
    -- width = dpi(#pinned_apps_classes * iconSize),
    bg = "#0c0f0f",
    visible = true,
    shape = function(cr, width, height) 
        gears.shape.rounded_rect(cr, width, height, 10)
    end,
    type = "dock",
    align = "center",
    ontop = true,
    widget = setupTable
}

local addClient = function(c) -- c should be class
    local color
    local icon
    local weight

    if icons[c] then
        icon = icons[c][1]
        color = icons[c][2]
	weight = icons[c][3]
    else
        icon = icons["default"][1]
        color = icons["default"][2]
	weight = icons["default"][3]
    end

    local markups

    if weight then
    	markups = "<span foreground = '"..color.."'><b>"..icon.."</b></span>"
    else
	markups = "<span foreground = '"..color.."'>"..icon.."</span>"
    end


    local app = wibox.widget {
        {
            {
                id = c,
                font = "Font Awesome 5 Free "..tostring(fontsize),
                -- text = icon,
                markup = markups,
                align = "center",
                widget = wibox.widget.textbox
            },
            shape = function(cr, width, height)
                gears.shape.rounded_rect(cr, width, height, 10)
            end,
            align = "center",
            widget = wibox.container.background
        },
        margins = 4,
        widget = wibox.container.margin
    }

    app:connect_signal("mouse::enter", function ()
        app.widget.bg = "#ffffff33"
    end)

    app:connect_signal("mouse::leave", function ()
        app.widget.bg = "#ffffff00"
    end)

    app:connect_signal("button::press", function ()
        if gears.table.hasitem(pinned_apps_classes, c) then
		awful.spawn.raise_or_spawn(string.lower(c))
        end
        app.widget.bg = "#ffffff55"
    end)

    app:connect_signal("button::release", function ()
        app.widget.bg = "#ffffff33"
    end)

    windows[c] = app
    setupTable:add(app)
    mydock.width = mydock.width + iconSize
    mydock.x = mydock.x - iconSize / 2
end

local function removeClient(c) -- c should be class
    setupTable:remove_widgets(windows[c])
    mydock.width = mydock.width - dpi(iconSize)
    mydock.x = mydock.x + dpi(iconSize) / 2
end

client.connect_signal("manage", function (c)
    if not gears.table.hasitem(pinned_apps_classes, c.class) then
        addClient(c.class)
    end
end)

client.connect_signal("unmanage", function (c)
    if not gears.table.hasitem(pinned_apps_classes, c.class) then
        removeClient(c.class)
    end
end)

-- table.insert(setupTable, wibox.widget.textbox(tostring(#setupTable)))

for _, c in ipairs(pinned_apps_classes) do
    addClient(c)
end

mydock:struts{
    bottom = 76
}

return mydock
