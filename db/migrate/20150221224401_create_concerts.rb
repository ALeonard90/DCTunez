class CreateConcerts < ActiveRecord::Migration
  def change
    create_table :concerts do |t|
      t.integer :ticketfly_id
      t.string :name
      t.string :headlinerName
      t.string :openerName
      t.datetime :date
      t.string :image
      t.string :purchaseUrl

      t.timestamps null: false
    end
  end
end
