class Subscriber < ApplicationRecord
  validates_format_of :email, with: Devise.email_regexp
  validates :name, presence: { message: 'Por favor ingresa tu nombre.' }

  enum level_knowledge: { basico: 0, intermedio: 1, avanzado:2 }



  def self.as_csv
    CSV.generate do |csv|
      csv << ['Name', 'Phone number', 'email', 'Job experience']
      all.each do |item|
        csv << [item.name, item.phone_number, item.email, item.work]
      end
    end
  end

end
