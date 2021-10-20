class CreateCoins < ActiveRecord::Migration[6.0]
  def change
    create_table :coins do |t|
      t.integer :fk_user_id
      t.decimal :denomination

      t.timestamps
    end
  end
end
