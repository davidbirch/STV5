class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.string :name
      t.string :short_name
      t.string :free_or_pay
      t.string :xmltv_id
      t.boolean :black_flag

      t.timestamps
    end
  end
end
