class CreateLendings < ActiveRecord::Migration
  def change
    create_table :lendings do |t|
      t.float :amount_lent
      t.references :borrower, index: true, foreign_key: true
      t.references :lender, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
