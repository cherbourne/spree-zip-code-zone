class Spree::ZoneComparable
  def initialize(origin_zone, target_zone)
    @origin = origin_zone
    @target = target_zone
  end

  def contained?
    return false if @origin.kind == 'state' || @origin.kind == 'zip_code_range'
    send "#{@origin.kind}_contains_#{@target.kind}?".to_sym
  end

  def method_missing(meth, *args)
    raise "Unsupported zone types #{@origin.kind} and #{@target.kind}"
  end

  private

  def same_same
    not_included = @target.zoneables - @origin.zoneables
    not_included.empty?
  end

  def state_contains_state?
    same_same
  end

  def state_contains_country?
    false
  end

  def state_contains_zip_code?
    # not supported
    false
  end

  def country_contains_state?
    # country.states.include? state
    @origin.zoneables.each do |country|
      not_found = @target.zoneables - country.states
      return false unless not_found.empty?
    end
    true
  end

  def country_contains_zip_code?
    # if country is US, then true else false
    @origin.zoneables.any? {|country| country.iso == "US" }
  end

  def country_contains_country?
    same_same
  end

  def zip_code_range_contains_state?
    false
  end

  def zip_code_range_contains_country?
    false
  end

  def zip_code_range_contains_zip_code_range?
    @origin.zoneables.each do |o_range|
      o_range = o_range.to_range
      @target.zoneables.each do |t_range|
        return false unless o_range.include? t_range.to_range
      end
    end
    true
  end
end
