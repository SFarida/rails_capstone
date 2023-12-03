class RenameTransactionToPurchase < ActiveRecord::Migration[7.1]
  def change
    rename_table :transactions, :purchases
  end
end
