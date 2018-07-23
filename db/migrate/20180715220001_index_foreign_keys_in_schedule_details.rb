class IndexForeignKeysInScheduleDetails < ActiveRecord::Migration[5.2]
  def change
    add_index :schedule_details, :user_id
  end
end
