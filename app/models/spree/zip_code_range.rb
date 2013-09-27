class Spree::ZipCodeRange < ActiveRecord::Base
  scope :order_by_name, :order => [:start_zip, :end_zip]

  has_one :zone_member, :as => :zoneable
  has_one :zone, :through => :zone_member
  validates_presence_of [:start_zip, :end_zip]

  attr_accessible :start_zip, :end_zip

  def <=>(other)
    start_zip <=> other.start_zip and end_zip <=> other.end_zip
  end

  def to_s
    "#{name} #{start_zip} - #{end_zip}"
  end

  def full_name
    to_s
  end

  def to_range
    if start_zip =~ /^\d{5}$/ && end_zip =~ /^\d{5}$/
      (start_zip..end_zip)
    else
      raise "Invalid start and end for a range"
    end
  end

end
