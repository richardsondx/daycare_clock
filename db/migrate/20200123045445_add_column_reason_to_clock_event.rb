class AddColumnReasonToClockEvent < ActiveRecord::Migration[6.0]
  def change
    add_column :clock_events, :reason, :string
  end
end
