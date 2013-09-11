disable_all = ->
  $('#country_members :input').each (e)-> $(e).prop("disabled", true)
  $('#state_members :input').each (e)-> $(e).prop("disabled", true)
  $('#zone_members :input').each (e)-> $(e).prop("disabled", true)
  $('#zip_code_range_members :input').each (e)-> $(e).prop("disabled", true)

  $('#country_members').hide()
  $('#state_members').hide()
  $('#zone_members').hide()
  $('#zip_code_range_members').hide()

show_country = ->
  disable_all()
  $('#country_members :input').each (e)-> $(e).prop("disabled", false)
  $('#country_members').show()

show_state = ->
  disable_all()
  $('#state_members :input').each (e)-> $(e).prop("disabled", false)
  $('#state_members').show()

show_zip_code_range = -> 
  disable_all()
  $('#zip_code_range_members :input').each (e)-> $(e).prop("disabled", false)
  $('#zip_code_range_members').show()

show_zone = -> 
  disable_all()
  $('#zone_members :input').each (e)-> $(e).prop("disabled", false)
  $('#zone_members').show()



jQuery -> 
  if $('#country_based').attr('checked') 
    show_country()
  else if $('#state_based').attr('checked')
    show_state()
  else if $('#zip_code_range_based').attr('checked')
    show_zip_code_range()
  else 
    show_zone()
  
  $('#country_based').click -> show_country()
  $('#state_based').click -> show_state()
  $('#zip_code_range_based').click -> show_zip_code_range()
  $('#zone_based').click -> show_zone()
