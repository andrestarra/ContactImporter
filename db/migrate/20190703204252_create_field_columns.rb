class CreateFieldColumns < ActiveRecord::Migration[5.2]
  def change
    create_table :field_columns do |t|
      t.integer :name
      t.integer :birthdate
      t.integer :phone_number
      t.integer :address
      t.integer :credit_card
      t.integer :email
      t.references :contacts_file, foreign_key: true

      t.timestamps
    end
  end
end
