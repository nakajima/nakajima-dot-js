jQuery ->
  jQuery('.radar').hide()
  jQuery('.promo').hide()
  window.setTimeout ->
    jQuery('img').each ->
      if $(this).attr("src") && $(this).attr("src").match(/confetti/)
        $(this).remove()
  , 1000