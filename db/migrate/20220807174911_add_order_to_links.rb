class AddOrderToLinks < ActiveRecord::Migration[7.0]
  def change
    add_column :links, :order, :integer
  end
end
