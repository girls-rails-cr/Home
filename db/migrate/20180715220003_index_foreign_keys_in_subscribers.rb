class IndexForeignKeysInSubscribers < ActiveRecord::Migration[5.2]
  def change
    add_index :subscribers, :event_id
  end
end
