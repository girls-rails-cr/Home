class IndexForeignKeysInVoluntaries < ActiveRecord::Migration[5.2]
  def change
    add_index :voluntaries, :event_id
  end
end
