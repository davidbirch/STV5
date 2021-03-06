class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.string :title
      t.string :subtitle
      t.integer :region_id
      t.integer :sport_id
      t.integer :channel_id
      t.string :category
      t.string :description
      t.datetime :start_datetime
      t.datetime :end_datetime

      t.timestamps
    end
    
    add_index :programs, :region_id
    add_index :programs, :sport_id
    add_index :programs, :channel_id
  end
end
