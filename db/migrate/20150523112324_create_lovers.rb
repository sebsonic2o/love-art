class CreateLovers < ActiveRecord::Migration
  def change
    create_table :lovers do |t|
      t.string  :type

      t.string  :alias
      t.string  :email
      t.string  :password_hash

      t.string  :first_name
      t.string  :last_name
      t.string  :image_url

      t.text    :bio
      t.string  :website_url

      t.timestamps
    end
  end
end
