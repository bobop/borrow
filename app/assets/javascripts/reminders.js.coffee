# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $ = jQuery
  $('input[id="reminder_from_name"]').bind 'keyup change', ->
    $('.your_name').html($(this).val())
  $('input[id="reminder_from_email"]').bind 'keyup change', ->
    $('.your_email').html($(this).val())
  $('input[id="reminder_to_name"]').bind 'keyup change', ->
    $('.their_name').html($(this).val())
  $('input[id="reminder_to_email"]').bind 'keyup change', ->
    $('.their_email').html($(this).val())
  $('input[id="reminder_item"]').bind 'keyup change', ->
    $('.the_item').html($(this).val())
  $('textarea[id="reminder_message"]').bind 'keyup change', ->
    $('.message').html($(this).val())
  $('select[id="reminder_gap"]').bind 'change', ->
    switch $(this).val()
      when '1w' then $('.sent').html('In 1 week')
      when '1m' then $('.sent').html('In 1 month')
      when '2m' then $('.sent').html('In 2 months')
      when '3m' then $('.sent').html('In 3 months')
      when '6m' then $('.sent').html('In 6 months')
      when '1y' then $('.sent').html('In 1 year')