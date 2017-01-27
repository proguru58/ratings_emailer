ready = ->
  $('textarea.ckeditor').each ->
#    if CKEDITOR.instances['rating_email_html']
#      CKEDITOR.instances['rating_email_html'].destroy(true);
    CKEDITOR.replace $(this).attr('id')

$(document).on('turbolinks:load', ready)
