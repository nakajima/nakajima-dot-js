if window.console && window.console.log
  window.console.log("initializing...")

window.puts = (thing) ->
  console.info(thing)

String.fromKey = (number) ->
  {
    8: "backspace",
    9: "tab",
    13: "return",
    27: "escape",
    37: "left",
    38: "up",
    39: "right",
    40: "down",
    46: "delete",
    36: "home",
    35: "end",
    33: "pageup",
    34: "pagedown",
    45: "insert"
  }[number] || String.fromCharCode(number)

jQuery(document).bind "keydown", (e) ->
  return if jQuery(e.target).is(":input")
  if key = String.fromKey(e.which)
    event = jQuery.Event("key:#{key}");
    event.altKey = e.altKey
    event.ctrlKey = e.ctrlKey
    event.metaKey = e.metaKey
    event.shiftKey = e.shiftKey
    event.which = e.which
    event.target = e.target
    $(e.target).trigger(event)

jQuery.keybind = (key, fn) ->
  jQuery(document).bind "key:#{key}", (e) ->
    fn.call(this, e)
