class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.column(:user_name, :string)
      t.column(:text, :string)
      t.column(:rubies, :int)
      t.column(:product_id, :integer)

      t.timestamps
    end
  end
end
