class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: { on_delete: :cascade }, null: false
      t.string :first_name
      t.string :last_name
      t.string :avatar
      t.string :username
      t.string :company
      t.string :address
      t.string :fb_link
      t.string :twitter_link
      t.string :linkedin
      t.text :about_me

      t.timestamps
    end
  end
end
