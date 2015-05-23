class CreateInterests < ActiveRecord::Migration
  def change
    create_table :interests do |t|
      t.references :category
      t.references :lover

      t.timestamps
    end
  end
end
