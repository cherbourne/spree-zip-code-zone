class AddNameToZipCodeRanges < ActiveRecord::Migration
  def change
    add_column :spree_zip_code_ranges, :name, :string
  end
end
