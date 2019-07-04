class ContactsFile < ApplicationRecord
  belongs_to :user
  has_one :field_column, dependent: :destroy
  has_one_attached :csv_file

  enum status: { waiting: 0, processing: 1, failed: 2, finished: 3 }

  validates :csv_file, presence: true

  scope :my_contacts_files, ->(current_user) { where(user_id: current_user.id) }

  def my_import(file)
    contacts= []
    CSV.foreach(file.path, headers: true) do |row|
      contacts << Contact.new(row.to_h)
    end
    Contact.import(contacts)
  end
end
