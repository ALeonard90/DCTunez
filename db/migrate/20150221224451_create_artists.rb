class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.integer :spotify_id
      t.string :name
      t.string :website
      t.string :facebook
      t.string :twitter
      t.string :image

      t.timestamps null: false
    end
  end
end
