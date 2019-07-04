require 'date'

class Contact < ApplicationRecord
  belongs_to :user

  VALID_NAME_REGEX = /\A[a-zA-Z-\s]+\z/
  VALID_DATE_REGEX = /\d{4}\-\d{2}\-\d{2}|\d{8}/
  validates :name, presence: true, format: { with: VALID_NAME_REGEX }
  validates :birthdate, presence: true, format: { with: VALID_DATE_REGEX }
  validates :phone_number, presence: true
  
  after_validation :birthdate_valid

  scope :my_contacts, ->(current_user) { where(user_id: current_user.id) }

  def birthdate_valid
    begin
      date = Date.parse(self.birthdate)
      errors.add(:birthdate, 'can not be future.') if date > DateTime.now
    rescue ArgumentError
      errors.add(:birthdate, 'is not a valid format.')
    end
  end
end
