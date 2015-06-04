class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
      t.string     :type

      t.text       :text

      t.references :artwork
      t.references :lover

      t.timestamps
    end
  end
end
