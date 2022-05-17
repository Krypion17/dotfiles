---@diagnostic disable: undefined-global
local lush = require("lush")
local hsl = lush.hsl

local basefg = hsl("#ababb6")
local basebg = hsl("#202026")
local base = basefg.saturate(60).lighten(20)

local theme = lush(function ()
    return {
        -- Text
        Statement { fg = base.ro(10), gui = "bold" },
        Type { fg = base.ro(130).li(40) },
        Constant { fg = base.sa(30).ro(-230) },
        Identifier { fg = base.ro(-40).sa(60) },
        Comment { fg = basefg.ro(-30).sa(20).da(50), gui = "italic" },
        Error { bg = basebg, fg = hsl("#fc5876"), gui = "underline" },

        -- Vim ui
        Normal { fg = basefg },
        EndOfBuffer { fg = base.li(30) },
        VertSplit { bg = basebg.darken(30), fg = Normal.fg },
        LineNr { VertSplit },
        CursorLine { bg = basebg.li(10).sa(-20) },

        Cursor { bg = hsl("#dddddd") },

        -- Plugins
        IndentBlanklineChar { fg = basefg.saturate(10).darken(60) },
         -- NERDTree
        Directory { Identifier, gui = "NONE" },
        NERDTreeCWD { Statement, gui = "NONE" },
        NERDTreeUp { fg = basefg.li(50).sa(40), gui = "bold" }
    }
end)

return theme
