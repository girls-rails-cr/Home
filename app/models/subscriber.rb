class Subscriber < ApplicationRecord
  validates_format_of :email, with: Devise.email_regexp
  validates :name, presence: { message: 'Por favor ingresa tu nombre.' }
end
