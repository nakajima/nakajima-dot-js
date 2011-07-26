REQUIRE prototype.js
REQUIRE prototype.event_simulate.js

# Install new style
jQuery("head").append "
  <style>
    .current-item {
      text-decoration: underline;
    }
  </style>
"

# Used to determine which story we're on
currentIndex = 0
currentScroll = 0

move = (o) ->
  currentIndex = currentIndex + o
  currentIndex = 0 if currentIndex < 0
  puts currentIndex

  currentItem = jQuery(".items .item:eq(#{currentIndex})")
  jQuery(".items .item.current-item").removeClass("current-item")
  currentItem.addClass("current-item")
  list = currentItem.parents(".items")

  height = list.height()
  offset = currentItem.position().top - 20

  puts "height: #{height}"
  puts "offset: #{offset}"

  if currentIndex == 0
    currentIndex = 0
    currentScroll = 0
    jQuery(currentItem.parents()[0]).scrollTop(0)

  if height < offset
    currentScroll = currentScroll + offset
    puts "currentScroll: #{currentScroll}"
    currentItem.parents().scrollTop(currentScroll)

  if offset < 0
    currentScroll = currentScroll - height
    puts "currentScroll: #{currentScroll}"
    currentItem.parents().scrollTop(currentScroll)

jQuery(document).bind "keydown", (e) ->
  return if jQuery(e.target).is(":input")
  key = String.fromKey(e.which).toUpperCase()
  if key == "X"
    # This one doesn't work for some reason. FUUUUUUUUUUUUUUUU...
    elem = jQuery(".items .item.current-item .storySelector").get(0)
    Event.simulate(elem, "click")
  if key == "J"
    move(1)
  if key == "K"
    move(-1)
  if key == "RETURN"
    jQuery(".items .item.current-item .toggleExpandedButton").each ->
      Event.simulate(this, "click")
  if key == "ESCAPE"
    jQuery("input[value=Cancel]").each ->
      Event.simulate(this, "click")
