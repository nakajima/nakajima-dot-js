jQuery ->
  field = jQuery("<input id='current'>")
  field.css({ right: 10, width: 300, position: "absolute" })
  jQuery(document.body).prepend(field)

  currentGif = ""

  checkGif = ->
    gif = jQuery("#gif img").attr("src")
    unless currentGif == gif
      currentGif = gif
      jQuery('#current').val("http://gif.tv#{gif}")

  window.setInterval checkGif, 100

