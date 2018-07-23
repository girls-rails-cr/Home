class IndexForeignKeysInSponsors < ActiveRecord::Migration[5.2]
  def change
    add_index :sponsors, :event_id
  end
end
