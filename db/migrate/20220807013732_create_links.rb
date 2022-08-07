class CreateLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :links do |t|
      t.string :title
      t.string :url
      t.boolean :active, default: true
      t.references :bio_link, index: true, foreign_key: true

      t.timestamps
    end
  end
end
