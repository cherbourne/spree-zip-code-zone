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

  def kind
    return nil if members.empty? || members.any? { |member| member.try(:zoneable_type).nil? }
    members.last.zoneable_type.demodulize.underscore
  end

  # Indicates whether the specified zone falls entirely within the zone performing
  # the check.
  def contains?(target)
    return false unless self.kind && target.kind
    comparable = Spree::ZoneComparable.new self, target
    comparable.contained?
  end

  private

  def remove_defunct_members
    zone_members.each do |zone_member|
      zoneable_kind = 
      zone_member.destroy if zone_member.zoneable_id.nil? || zone_member.zoneable_type != "spree/#{kind}".camelize
    end
  end

end

