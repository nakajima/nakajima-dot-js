$ ->
  oldValue = $(".highlight").html()
  newValue = oldValue.replace(/\t/g, "  ")
  $(".highlight").html(newValue)
