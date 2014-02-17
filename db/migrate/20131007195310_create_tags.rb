class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.text :pattern
      t.integer :account_id

      t.timestamps
    end
  end
end
