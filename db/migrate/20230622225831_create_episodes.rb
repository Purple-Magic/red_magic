# frozen_string_literal: true

class CreateEpisodes < ActiveRecord::Migration[7.1]
  def change
    create_table :episodes do |t|
      t.text :title
      t.integer :podcast_id

      t.timestamps
    end
  end
end
