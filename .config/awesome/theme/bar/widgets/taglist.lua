local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")

local taglist = {}
local taglistDetect = {}

awful.screen.connect_for_each_screen(function (s)

    local theTaglist = awful.widget.taglist{
        screen = s,
        buttons = gears.table.join(
            awful.button({ }, 1, function(t) t:view_only() end),
            awful.button({ modkey }, 1, function(t)
                                      if client.focus then
                                          client.focus:move_to_tag(t)
                                      end
                                  end),
            awful.button({ }, 3, awful.tag.viewtoggle),
            awful.button({ modkey }, 3, function(t)
                                      if client.focus then
                                          client.focus:toggle_tag(t)
                                      end
                                  end),
            awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
            awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
        ),
        widget_template = {
            {
                valign = "center",
                align = "center",
                id = "index_role",
                font = "Exo 2 14",
                widget = wibox.widget.textbox
            },
            id = "bg",
            bg = "#367f6600",
            shape = function(cr, width, height) 
                gears.shape.rounded_rect(cr, width, height, 10)
            end,
	    lx = 10,
            widget = wibox.container.background,
            create_callback = function(self, c3, index, objects) --luacheck: no unused args
                self:get_children_by_id('index_role')[1].markup = '<b> '..index..' </b>'
                self:connect_signal('mouse::enter', function()
                    if self.bg ~= '#367f6666"' then
                        self.backup     = self.bg
                        self.has_backup = true
                    end
                    self.bg = '#367f6666'
                end)
                self:connect_signal('mouse::leave', function()
                    if self.has_backup then self.bg = self.backup end
                end)
                if #c3:clients() > 0 then
                    self.bg = '#367f66'
                end
            end,
            update_callback = function(self, c3, index, objects) --luacheck: no unused args
                self:get_children_by_id('index_role')[1].markup = '<b> '..index..' </b>'
                if #c3:clients() > 0 then
                    self.bg = '#367f66'
                end
                if #c3:clients() == 0 then
                    self.bg = '#367f6600'
                end
            end,
        },
        filter = awful.widget.taglist.filter.all,
        layout = wibox.layout.flex.vertical,
        valign = "center"
    }

    taglistDetect = wibox {
        visible = true,
        bg = "00000000",
        width = 1,
        height = 320,
        ontop = true
    }

    taglist = wibox {
        bg = "#0c0f0f",
        fg = "#c8cdcc",
        width = 50,
        height = 320,
        --[[ shape = function(cr, width, height) 
            gears.shape.rounded_rect(cr, width, height, 10)
        end, --]]
        opacity = 1,
        ontop = true,
        widget = theTaglist
    }

    taglistDetect:connect_signal("mouse::enter", function ()
        taglist.visible = true
    end)

    taglist:connect_signal("mouse::leave", function ()
        taglist.visible = false
    end)
end)

return {taglist, taglistDetect}
