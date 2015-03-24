class Spree::Admin::ZipCodeRangesController < Spree::Admin::ResourceController
  def collection
    super.order(:start_zip)
  end

  private

  def zip_code_range_params
    params.require(:slide).permit(
      :start_zip,
      :end_zip
    )
  end

end
