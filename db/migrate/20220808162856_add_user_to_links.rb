class AddUserToLinks < ActiveRecord::Migration[7.0]
  def change
    add_reference :links, :user, foreign_key: true
  end
end
