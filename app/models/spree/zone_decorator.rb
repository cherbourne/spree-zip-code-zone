Spree::Zone.class_eval do

  def kind
    member = self.members.last
    case member && member.zoneable_type
    when "State"        then "state"
    when "Zone"         then "zone"
    when "ZipCodeRange" then "zip_code_range"
    else
      "country"
    end
  end

  # Check for whether an address.zipcode is
  # between the start/end of a ZipCodeRange
  def include?(address)
    return false unless address

    members.any? do |zone_member|
      case zone_member.zoneable_type
      when "Zone"
        zone_member.zoneable.include?(address)
      when "Country"
        zone_member.zoneable == address.country
      when "State"
        zone_member.zoneable == address.state
      when "ZipCodeRange"
        address.zipcode and address.zipcode.between?(
          zone_member.zoneable.start_zip,
          zone_member.zoneable.end_zip)
      else
        false
      end
    end
  end

end
