class IndexForeignKeysInUsers < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :event_id
  end
end
