class AddEndDateToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :end_date, :datetime
    add_column :events, :venue_name, :string
    add_column :events, :venue_address, :string
    add_column :events, :short_description, :text
    add_column :users, :event_id, :integer
    add_column :voluntaries, :event_id, :integer
  end
end
