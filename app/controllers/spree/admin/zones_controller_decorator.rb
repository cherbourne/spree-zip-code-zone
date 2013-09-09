Spree::Admin::ZonesController.class_eval do

  def load_data
    @countries = Spree::Country.all.sort
    @states = Spree::State.all.sort
    @zip_code_ranges = ZipCodeRange.all.sort
    @zones = Spree::Zone.all.sort
  end

end
