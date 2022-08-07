class CreateBioLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :bio_links do |t|
      t.string :name
      t.boolean :active
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
