class CreateBorrowers < ActiveRecord::Migration
  def change
    create_table :borrowers do |t|
      t.string :need_money_for
      t.text :description
      t.float :amount_needed
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
