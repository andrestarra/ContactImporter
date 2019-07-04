class ContactsFile < ApplicationRecord
  belongs_to :user

  mount_uploader :csv_file, CsvFileUploader
end
