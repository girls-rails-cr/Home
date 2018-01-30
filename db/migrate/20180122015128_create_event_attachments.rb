class CreateEventAttachments < ActiveRecord::Migration[5.1]
  def change
    create_table :event_attachments do |t|
      t.references :event, foreign_key: { on_delete: :cascade }, null: false
      t.string :img
      t.string :attach
      t.timestamps
    end
  end
end
