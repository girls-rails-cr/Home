class AddDetailsToSusbcribers < ActiveRecord::Migration[5.1]
  def change
    add_column :subscribers, :second_confirmed, :boolean
    add_column :subscribers, :comments, :string
    add_column :subscribers, :work, :string
  end
end
