class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.integer :ticketfly_id
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.integer :postalCode
      t.string :url
      t.string :blurb
      t.string :facebook
      t.string :twitter
      t.string :image
      t.decimal :lat
      t.decimal :long

      t.timestamps null: false
    end
  end
end
