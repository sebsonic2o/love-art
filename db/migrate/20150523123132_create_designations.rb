class CreateDesignations < ActiveRecord::Migration
  def change
    create_table :designations do |t|
      t.references :artwork
      t.references :category

      t.timestamps
    end
  end
end
