(function() {
  jQuery(function() {
    var checkGif, currentGif, field;
    field = jQuery("<input id='current'>");
    field.css({
      right: 10,
      width: 300,
      position: "absolute"
    });
    jQuery(document.body).prepend(field);
    currentGif = "";
    checkGif = function() {
      var gif;
      gif = jQuery("#gif img").attr("src");
      if (currentGif !== gif) {
        currentGif = gif;
        return jQuery('#current').val("http://gif.tv" + gif);
      }
    };
    return window.setInterval(checkGif, 100);
  });
}).call(this);
