class ChangeEventDatetime < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :start_year, :integer
    add_column :events, :start_month, :integer
    add_column :events, :start_day, :integer
    add_column :events, :start_hour, :integer
    add_column :events, :end_year, :integer
    add_column :events, :end_month, :integer
    add_column :events, :end_day, :integer
    add_column :events, :end_hour, :integer

    remove_column :events, :start_time
    remove_column :events, :end_time
  end
end
