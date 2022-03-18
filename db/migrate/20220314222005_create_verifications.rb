class CreateVerifications < ActiveRecord::Migration[7.0]
  def change
    create_table :verifications do |t|
      t.integer :alt_id
      t.integer :user_id

      t.timestamps
    end
  end
end
