class CreateScheduleDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :schedule_details do |t|
      t.references :schedule, foreign_key: { on_delete: :cascade }, null: false
      t.string :name
      t.time :date_name
      t.integer :user_id
      t.timestamps
    end
  end
end
