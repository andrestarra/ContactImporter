class ContactsFile < ApplicationRecord
  belongs_to :user
  has_one :field_column, dependent: :destroy
  has_one_attached :csv_file

  enum status: { waiting: 0, processing: 1, failed: 2, finished: 3 }

  validates :csv_file, presence: true
end
