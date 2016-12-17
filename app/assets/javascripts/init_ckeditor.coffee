ready = ->
  $('textarea.ckeditor').each ->
    CKEDITOR.replace $(this).attr('id'),
      extraPlugins: 'placeholder'

$(document).on('turbolinks:load', ready)
