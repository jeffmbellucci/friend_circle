class Addcolumntocircles < ActiveRecord::Migration
  def change
    add_column :circles, :title, :string
  end
end
