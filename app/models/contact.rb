require 'date'

class Contact < ApplicationRecord
  belongs_to :user

  VALID_NAME_REGEX = /\A[a-zA-Z-\s]+\z/
  VALID_DATE_REGEX = /\d{4}\-\d{2}\-\d{2}|\d{8}/
  VALID_PHONE_REGEX = /\A\(\+\d{2}\)\s\d{3}(\s|-)\d{3}(\s|-)\d{2}(\s|-)\d{2}\z/
  validates :name, presence: true, format: { with: VALID_NAME_REGEX }
  validates :birthdate, presence: true, format: { with: VALID_DATE_REGEX }
  validates :phone_number, presence: true, format: { with: VALID_PHONE_REGEX }
  validates :address, presence: true, format: { without: /\s/ }
  validate :birthdate_valid
  validate :credit_card_valid

  before_save :what_franquise

  scope :my_contacts, ->(current_user) { where(user_id: current_user.id) }

  def birthdate_valid
    begin
      date = Date.parse(self.birthdate)
      errors.add(:birthdate, 'can not be future.') if date > DateTime.now
    rescue ArgumentError
      errors.add(:birthdate, 'is not a valid format.')
    end
  end

  def credit_card_valid
    unless CreditCardValidations::Luhn.valid?(self.credit_card)
      errors.add(:credit_card, 'is not valid.')
    end
  end

  def what_franquise
    self.franquise = credit_card.credit_card_brand_name
  end
end
