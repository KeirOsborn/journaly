class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :uri
      t.string :caption
      t.references :place

      t.timestamps
    end
    add_index :images, :place_id
  end
end
