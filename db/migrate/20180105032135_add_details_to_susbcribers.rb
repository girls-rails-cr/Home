class AddDetailsToSusbcribers < ActiveRecord::Migration[5.1]
  def change
    add_column :subscribers, :second_confirmed, :boolean
    add_column :subscribers, :comments, :string
    add_column :subscribers, :work, :string
    add_column :subscribers, :event_id, :integer
    add_column :subscribers, :registered, :boolean
    add_column :subscribers, :confirmed, :boolean
    add_column :subscribers, :level_knowledge, :integer
    add_column :subscribers, :phone_number, :string
  end
end
