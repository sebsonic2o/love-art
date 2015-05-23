class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :artwork
      t.references :lover

      t.timestamps
    end
  end
end
