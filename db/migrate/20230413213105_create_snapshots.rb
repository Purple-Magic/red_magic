class CreateSnapshots < ActiveRecord::Migration[7.1]
  def change
    create_table :snapshots do |t|
      t.text :text

      t.timestamps
    end
  end
end
