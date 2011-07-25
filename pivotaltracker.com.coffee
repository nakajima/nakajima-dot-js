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

move = (offset) ->
  currentIndex = currentIndex + offset
  jQuery(".items .item.current-item").removeClass("current-item")
  jQuery(".items .item:eq(#{currentIndex})").addClass("current-item")

jQuery(document).bind "keydown", (e) ->
  return if jQuery(e.target).is(":input")
  key = String.fromCharCode(e.which).toUpperCase();
  if key == "X"
    # This one doesn't work for some reason. FUUUUUUUUUUUUUUUU...
    elem = jQuery(".items .item.current-item .storySelector").get(0)
    Event.simulate(elem, "click")
  if key == "J"
    move(1)
  if key == "K"
    move(-1)
