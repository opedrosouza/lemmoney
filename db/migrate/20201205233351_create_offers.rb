class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.string :advertiser_name
      t.string :url
      t.text :description
      t.datetime :starts_at
      t.datetime :ends_at
      t.boolean :premium
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :offers, :advertiser_name, unique: true
  end
end
