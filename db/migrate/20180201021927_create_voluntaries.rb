class CreateVoluntaries < ActiveRecord::Migration[5.1]
  def change
    create_table :voluntaries do |t|
      t.string :name
      t.string :phone
      t.string :career
      t.string :interest_area
      t.string :email
      t.text :message

      t.timestamps
    end
  end
end
