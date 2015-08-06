Spree::Zone.class_eval do
  def include?(address)
    return false unless address
    members.any? do |zone_member|
      case zone_member.zoneable_type
      when 'Spree::Country'
        zone_member.zoneable_id == address.country_id
      when 'Spree::State'
        zone_member.zoneable_id == address.state_id
      when "Spree::ZipCodeRange"
        address.zipcode && address.zipcode.between?(zone_member.zoneable.start_zip, zone_member.zoneable.end_zip)
      else
        false
      end
    end
  end

  def zip_code_range_ids
    if kind == 'zip_code_range'
      members.pluck(:zoneable_id)
    else
      []
    end
  end

  def zip_code_range_ids=(ids)
    zone_members.destroy_all
    ids.reject{ |id| id.blank? }.map do |id|
      member = Spree::ZoneMember.new
      member.zoneable_type = 'Spree::ZipCodeRange'
      member.zoneable_id = id
      members << member
    end
  end
end
