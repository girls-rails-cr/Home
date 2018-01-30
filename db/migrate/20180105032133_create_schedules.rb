class CreateSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :schedules do |t|
      t.string :name, null: false
      t.references :event, foreign_key: { on_delete: :cascade }
      t.timestamps
    end
  end
end
