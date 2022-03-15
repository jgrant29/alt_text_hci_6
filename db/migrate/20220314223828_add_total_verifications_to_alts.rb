class AddTotalVerificationsToAlts < ActiveRecord::Migration[7.0]
  def change
    add_column :alts, :total_verifications, :integer
  end
end
