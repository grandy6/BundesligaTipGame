class AddColorsToSettings < ActiveRecord::Migration
  def change
  	add_column :settings, :color_body, :string
  	add_column :settings, :color_input, :string
  	add_column :settings, :color_input_border, :string
  	add_column :settings, :color_input_shadow, :string
  	add_column :settings, :color_input_border_hover, :string
  	add_column :settings, :color_input_shadow_hover, :string
  	add_column :settings, :color_input_border_focus, :string
  	add_column :settings, :color_input_shadow_focus, :string
  	add_column :settings, :color_input_submit, :string
  	add_column :settings, :color_input_submit_background_top, :string
  	add_column :settings, :color_input_submit_background_bottom, :string
  	add_column :settings, :color_input_submit_background_hover, :string
  	add_column :settings, :color_title, :string
  	add_column :settings, :color_main, :string
  	add_column :settings, :color_main_h2, :string
  	add_column :settings, :color_main_h3, :string
  	add_column :settings, :color_notice_background, :string
  	add_column :settings, :color_alert_background, :string
  end
end
