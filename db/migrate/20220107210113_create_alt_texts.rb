class CreateAltTexts < ActiveRecord::Migration[7.0]
  def change
    create_table :alt_texts do |t|
      t.text :body
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :alt, null: false, foreign_key: true

      t.timestamps
    end
  end
end
