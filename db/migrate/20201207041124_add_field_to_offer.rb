class AddFieldToOffer < ActiveRecord::Migration[6.0]
  def change
    add_column :offers, :disabled_by_owner, :boolean
  end
end
