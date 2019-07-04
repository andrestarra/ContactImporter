class FieldColumn < ApplicationRecord
  belongs_to :contacts_file

  validates :name, :birthdate, :phone_number, :address
            :credit_card, :email, presence: true, numericality: { less_than: 20 }
end
