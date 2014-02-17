class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.datetime :date
      t.string :kind, :use, :partner, :infos
      t.float :amount
      t.integer :account_id
      t.string :identifier
    end
  end
end
