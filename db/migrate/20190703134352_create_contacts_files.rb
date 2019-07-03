class CreateContactsFiles < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts_files do |t|
      t.string :csv_file
      t.integer :status, default: 0
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
