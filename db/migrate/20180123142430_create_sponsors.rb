class CreateSponsors < ActiveRecord::Migration[5.1]
  def change
    create_table :sponsors do |t|
      t.string :name
      t.string :email_contact
      t.text :description
      t.string :company
      t.string :logo
      t.string :page_url
      t.integer :event_id
      t.integer :status,    null: false, default: 1

      t.timestamps
    end
  end
end
