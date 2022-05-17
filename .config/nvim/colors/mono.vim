let g:colors_name="mono"

lua package.loaded['lush_theme.mono'] = nil
lua require('lush')(require('lush_theme.mono'))
