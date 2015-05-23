class CreateArtworks < ActiveRecord::Migration
  def change
    create_table :artworks do |t|
      t.references :artist

      t.string     :title
      t.string     :image_url
      t.date       :date
      t.text       :description

      t.timestamps
    end
  end
end
