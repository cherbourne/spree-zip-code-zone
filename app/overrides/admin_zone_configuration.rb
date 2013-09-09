Deface::Override.new(:virtual_path=>"spree/admin/zones/_form",
                     :name => "add_zone_range_zone_type_radio",
                     :insert_bottom => "[data-hook='type'] ul",
                     :partial => "spree/admin/zones/zipcode_range_zone_type"
)

Deface::Override.new(:virtual_path => "spree/admin/zones/edit",
                     :name => "add_zip_code_range_member_type",
                     :insert_before => "div.clear",
                     :partial => 'spree/admin/zones/zipcode_range_member_type',
                    )
