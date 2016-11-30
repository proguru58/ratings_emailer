ready = ->
  $('textarea.ckeditor').each ->
    CKEDITOR.replace $(this).attr('id')

$(document).on('turbolinks:load', ready)
