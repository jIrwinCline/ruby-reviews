class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.column(:name, :string)
      t.column(:company, :string)
      t.column(:purpose, :string)
      t.column(:cost, :int)
      t.column(:country_of_origin, :string)
    end
  end
end
