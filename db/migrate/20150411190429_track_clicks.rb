class TrackClicks < ActiveRecord::Migration
  def change
      add_column :addresses, :clicks, :integer, :default => 0
  end
end
