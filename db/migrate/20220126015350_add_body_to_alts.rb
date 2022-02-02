class AddBodyToAlts < ActiveRecord::Migration[7.0]
  def change
    add_column :alts, :body, :text
  end
end
