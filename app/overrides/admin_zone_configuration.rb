Deface::Override.new(:virtual_path=>"spree/admin/zones/_form",
                     :name => "add_zone_range_zone_type_radio",
                     :insert_bottom => "[data-hook='type'] ul",
                     :partial => "spree/admin/zones/zipcode_range_zone_type",
                     :disabled => false
)

Deface::Override.new(:virtual_path => "spree/admin/zones/_form",
                     :name => "add_zip_code_range_member_type",
                     :insert_after => "[data-hook='admin_zone_form_fields']",
                     :partial => 'spree/admin/zones/zipcode_range_member_type',
                     :disabled => false
                    )
