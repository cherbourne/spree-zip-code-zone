class Spree::Admin::ZipCodeRangesController < Spree::Admin::ResourceController
  def collection
    super.order(:start_zip)
  end

end
