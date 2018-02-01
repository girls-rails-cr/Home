class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title,      null: false
      t.string :subtitle
      t.string :description
      t.text :venue_description,limit: 500
      t.datetime :start_time
      t.datetime :end_time
      t.string :video_url
      t.string :venue_short_description
      t.string :map_url
      t.string :background_image
      t.integer :status,    null: false, default: 0

      t.timestamps
    end
  end
end
