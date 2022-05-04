class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.text :template
      t.boolean :active, default: true
      t.integer :order

      t.timestamps
    end
  end
end
