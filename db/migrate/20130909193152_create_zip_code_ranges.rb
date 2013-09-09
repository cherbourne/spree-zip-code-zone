class CreateZipCodeRanges < ActiveRecord::Migration
  def up
    create_table :spree_zip_code_ranges do |t|
      t.string :start_zip
      t.string :end_zip
      t.timestamps
    end
  end

  def down
    drop_table :spree_zip_code_ranges
  end
end
