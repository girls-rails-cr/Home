class AddKnowledgeToSubscribers < ActiveRecord::Migration[5.1]
  def change
    add_column :subscribers, :level_knowledge, :integer
    add_column :subscribers, :phone_number, :string
  end
end
