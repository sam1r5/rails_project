class CreateLenders < ActiveRecord::Migration
  def change
    create_table :lenders do |t|
      t.float :money
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
