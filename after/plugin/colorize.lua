require'colorizer'.setup {
  '*', -- Highlight all files, but customize some others.
  scss = {
    rgb_fn = true
  }, -- Enable parsing rgb(...) functions in scss.
  css = {
    rgb_fn = true
  }, -- Enable parsing rgb(...) functions in css.
  html = {
    names = false
  } -- Disable parsing "names" like Blue or Gray
}
