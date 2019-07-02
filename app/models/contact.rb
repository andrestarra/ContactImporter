require 'date'

class Contact < ApplicationRecord
  belongs_to :user

  VALID_NAME_REGEX = /^[a-zA-Z-\s]+$/
  VALID_DATE_REGEX = /\d{4}\-\d{2}\-\d{2}|\d{8}/
  validates :name, presence: true, format: { with: VALID_NAME_REGEX }
  validates :birthdate, presence: true, format: { with: VALID_DATE_REGEX }
  validates :phone_number, presence: true
  validate :birthdate_valid

  def birthdate_valid
    date = Date.parse(self.birthdate)
    if !date
      errors.add(:birthdate, 'is invalid.')
    elsif date > DateTime.now
      errors.add(:birthdate, 'can not be future.')
    end
  end
end
