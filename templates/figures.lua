-- Convierte los párrafos que contienen solo una imagen en figuras con pie
-- (el reader commonmark no aplica implicit_figures).
function Para(el)
  if #el.content == 1 and el.content[1].t == "Image" then
    local img = el.content[1]
    local caption = {long = {pandoc.Plain(img.caption)}}
    img.caption = {}
    return pandoc.Figure({pandoc.Plain({img})}, caption)
  end
end
