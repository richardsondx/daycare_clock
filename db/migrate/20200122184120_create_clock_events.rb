class CreateClockEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :clock_events do |t|
      t.references :user
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
