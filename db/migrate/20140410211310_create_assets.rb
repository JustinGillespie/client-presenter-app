class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :title
      t.integer :group_id

      t.timestamps
    end
  end
end
