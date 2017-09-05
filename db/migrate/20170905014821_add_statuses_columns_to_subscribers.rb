class AddStatusesColumnsToSubscribers < ActiveRecord::Migration[5.1]
  def change
    add_column :subscribers, :registered, :boolean
    add_column :subscribers, :confirmed, :boolean
  end
end
