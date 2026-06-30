" Neutral pastel Vim Airline theme.
" vim: et ts=2 sts=2 sw=2

scriptencoding utf-8

let g:airline#themes#neutralpastel#palette = {}

let s:ink = '#1f1f1f'
let s:text = '#ded8cc'
let s:muted = '#9a948a'
let s:surface = '#252525'
let s:surface_light = '#303030'
let s:surface_lift = '#34313a'
let s:sage = '#b7c9b1'
let s:blue = '#b8c7d9'
let s:mauve = '#c9bedd'
let s:blush = '#d8bfc3'
let s:sand = '#d8cbb8'

let s:normal_a = [ s:ink, s:sand, 234, 188, 'bold' ]
let s:normal_b = [ s:text, s:surface_light, 188, 236, '' ]
let s:normal_c = [ s:text, s:surface, 188, 235, '' ]
let g:airline#themes#neutralpastel#palette.normal =
      \ airline#themes#generate_color_map(s:normal_a, s:normal_b, s:normal_c)
let g:airline#themes#neutralpastel#palette.normal_modified = {
      \ 'airline_c': [ s:blush, s:surface, 181, 235, '' ],
      \ }

let s:insert_a = [ s:ink, s:blue, 234, 153, 'bold' ]
let s:insert_b = [ s:text, s:surface_light, 188, 236, '' ]
let s:insert_c = [ s:text, s:surface, 188, 235, '' ]
let g:airline#themes#neutralpastel#palette.insert =
      \ airline#themes#generate_color_map(s:insert_a, s:insert_b, s:insert_c)
let g:airline#themes#neutralpastel#palette.insert_modified =
      \ g:airline#themes#neutralpastel#palette.normal_modified
let g:airline#themes#neutralpastel#palette.insert_paste = {
      \ 'airline_a': [ s:ink, s:blush, 234, 181, 'bold' ],
      \ }

let s:visual_a = [ s:ink, s:mauve, 234, 183, 'bold' ]
let s:visual_b = [ s:text, s:surface_light, 188, 236, '' ]
let s:visual_c = [ s:text, s:surface, 188, 235, '' ]
let g:airline#themes#neutralpastel#palette.visual =
      \ airline#themes#generate_color_map(s:visual_a, s:visual_b, s:visual_c)
let g:airline#themes#neutralpastel#palette.visual_modified =
      \ g:airline#themes#neutralpastel#palette.normal_modified

let s:replace_a = [ s:ink, s:blush, 234, 181, 'bold' ]
let s:replace_b = [ s:text, s:surface_light, 188, 236, '' ]
let s:replace_c = [ s:text, s:surface, 188, 235, '' ]
let g:airline#themes#neutralpastel#palette.replace =
      \ airline#themes#generate_color_map(s:replace_a, s:replace_b, s:replace_c)
let g:airline#themes#neutralpastel#palette.replace_modified =
      \ g:airline#themes#neutralpastel#palette.normal_modified

let g:airline#themes#neutralpastel#palette.terminal =
      \ g:airline#themes#neutralpastel#palette.insert
let g:airline#themes#neutralpastel#palette.commandline =
      \ g:airline#themes#neutralpastel#palette.normal

let s:inactive_a = [ s:muted, '#1c1c1c', 246, 234, '' ]
let s:inactive_b = [ s:muted, s:surface, 246, 235, '' ]
let s:inactive_c = [ s:muted, s:surface_light, 246, 236, '' ]
let g:airline#themes#neutralpastel#palette.inactive =
      \ airline#themes#generate_color_map(s:inactive_a, s:inactive_b, s:inactive_c)
let g:airline#themes#neutralpastel#palette.inactive_modified = {
      \ 'airline_c': [ s:blush, s:surface_light, 181, 236, '' ],
      \ }

let g:airline#themes#neutralpastel#palette.accents = {
      \ 'red': [ s:blush, '', 181, '' ],
      \ 'green': [ s:sage, '', 151, '' ],
      \ 'blue': [ s:blue, '', 153, '' ],
      \ 'yellow': [ s:sand, '', 188, '' ],
      \ 'orange': [ s:blush, '', 181, '' ],
      \ 'purple': [ s:mauve, '', 183, '' ],
      \ }
