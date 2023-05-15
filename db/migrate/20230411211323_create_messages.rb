class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages do |t|
      t.text :text
      t.text :photo

      t.timestamps
    end
  end
end
