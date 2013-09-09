Deface::Override.new(:virtual_path => "spree/admin/shared/_configuration_menu",
                     :name => "add_zone_ranges_link_to_configurations",
                     :insert_bottom => "[data-hook='admin_configurations_sidebar_menu'], #admin_configurations_sidebar_menu[data-hook]",
                     :text => "<li<%== ' class=\"active\"' if controller.controller_name == 'theme_settings' %>><%= link_to t('zip_code_ranges'), admin_zip_code_ranges_path %></li>")

