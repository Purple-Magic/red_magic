class AddLogoToPodcasts < ActiveRecord::Migration[7.1]
  def change
    add_column :podcasts, :logo, :text
  end
end
