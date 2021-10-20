class CreateDies < ActiveRecord::Migration[6.0]
  def change
    create_table :dies do |t|
      t.integer :fk_user_id
      t.string :colour
      t.integer :sides

      t.timestamps
    end
  end
end
