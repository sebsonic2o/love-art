class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.references :leader
      t.references :follower

      t.timestamps
    end
  end
end
