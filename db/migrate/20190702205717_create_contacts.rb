class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :name
      t.date :birthdate
      t.string :phone_number
      t.string :address
      t.string :credit_card
      t.string :franchise
      t.string :email
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end