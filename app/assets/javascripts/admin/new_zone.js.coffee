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





#var show_country = function() {
  #$('#state_members :input').each(function() { $(this).disable(); })
  #$('#state_members').hide();
  #$('#zone_members :input').each(function() { $(this).disable(); })
  #$('#zone_members').hide();
  #$('#zip_code_range_members :input').each(function() { $(this).disable(); })
  #$('#zip_code_range_members').hide();
  #// Show Country
  #$('#country_members :input').each(function() { $(this).enable(); })
  #$('#country_members').show();
#};

#var show_state = function() {
  #$('#country_members :input').each(function() { $(this).disable(); })
  #$('#country_members').hide();
  #$('#zone_members :input').each(function() { $(this).disable(); })
  #$('#zone_members').hide();
  #$('#zip_code_range_members :input').each(function() { $(this).disable(); })
  #$('#zip_code_range_members').hide();
  #// Show State
  #$('#state_members :input').each(function() { $(this).enable(); })
  #$('#state_members').show();
#};

#var show_zip_code_range = function() {
  #$('#country_members :input').each(function() { $(this).disable(); })
  #$('#country_members').hide();
  #$('#zone_members :input').each(function() { $(this).disable(); })
  #$('#zone_members').hide();
  #$('#state_members :input').each(function() { $(this).disable(); })
  #$('#state_members').hide();
  #// Show ZIP code
  #$('#zip_code_range_members :input').each(function() { $(this).enable(); })
  #$('#zip_code_range_members').show();
#};

#var show_zone = function() {
  #$('#state_members :input').each(function() { $(this).disable(); })
  #$('#state_members').hide();
  #$('#country_members :input').each(function() { $(this).disable(); })
  #$('#country_members').hide();
  #$('#zip_code_range_members :input').each(function() { $(this).disable(); })
  #$('#zip_code_range_members').hide();
  #// Show Zone
  #$('#zone_members :input').each(function() { $(this).enable(); })
  #$('#zone_members').show();
#};

