class CreateStamps < ActiveRecord::Migration[7.2]
  def change
    create_table :stamps do |t|
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true
      t.string :stamp_type

      t.timestamps
    end
  end
end
