# == Schema Information
#
# Table name: subscribers
#
#  id               :integer          not null, primary key
#  name             :string
#  email            :string
#  source           :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  second_confirmed :boolean
#  comments         :string
#  work             :string
#  event_id         :integer
#  registered       :boolean
#  confirmed        :boolean
#  level_knowledge  :integer
#  phone_number     :string

class Subscriber < ApplicationRecord
  validates_format_of :email, with: Devise.email_regexp
  validates :name, presence: { message: 'Por favor ingresa tu nombre.' }

  enum level_knowledge: { basico: 0, intermedio: 1, avanzado: 2 }



  def self.as_csv
    CSV.generate do |csv|
      csv << ['Name', 'Phone number', 'email', 'Job experience']
      all.each do |item|
        csv << [item.name, item.phone_number, item.email, item.work]
      end
    end
  end

  def self.current_subscribers(event_id)
    where(event_id: event_id)
  end

end
