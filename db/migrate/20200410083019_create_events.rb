class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :user
      t.datetime :start_time
      t.datetime :end_time
      t.string :place
      t.text :memo

      t.timestamps
    end
  end
end
