class CreateCircles < ActiveRecord::Migration
  def change
    create_table :circles do |t|
      t.integer :owner_id

      t.timestamps
    end
  end
end
