class CreateSnapshots < ActiveRecord::Migration
  def change
    create_table :snapshots do |t|

      t.timestamps null: false
    end
  end
end
