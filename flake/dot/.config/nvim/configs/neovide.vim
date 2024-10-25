let g:neovide_scale_factor=0.85

let g:neovide_cursor_animation_length=0.020
let g:neovide_cursor_trail_size=0.905
let g:neovide_cursor_vfx_mode = "railgun"
let g:neovide_cursor_vfx_particle_curl = 1.0
let g:neovide_cursor_vfx_particle_phase = 2.5
let g:neovide_cursor_vfx_particle_speed = 10.0
let g:neovide_cursor_vfx_particle_density = 7.0
let g:neovide_cursor_vfx_particle_lifetime = 1.2
let g:neovide_cursor_vfx_opacity = 200.0


function! ChangeScaleFactor(delta)
  let g:neovide_scale_factor = g:neovide_scale_factor * a:delta
endfunction
nnoremap <expr><C-=> ChangeScaleFactor(1.25)
nnoremap <expr><C--> ChangeScaleFactor(1/1.25)

