Spree::Admin::ZonesController.class_eval do

  def edit 
    @zone = Spree::Zone.includes(:zone_members).where(:id => params[:id]).first
  end

  protected

  def load_data
    @countries = Spree::Country.order(:name)
    @states = Spree::State.order(:name)
    @zones = Spree::Zone.order(:name)
    @zip_code_ranges = Spree::ZipCodeRange.order(:start_zip)
  end

end
