class CreateTestings < ActiveRecord::Migration[7.0]
  def change
    create_table :testings do |t|
      t.text :title

      t.timestamps
    end
  end
end
