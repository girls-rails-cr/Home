# == Schema Information
#
# Table name: schedules
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  event_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Schedule < ApplicationRecord
  belongs_to :event
  has_many :schedule_details, dependent: :destroy, inverse_of: :schedule
  accepts_nested_attributes_for :schedule_details, reject_if: :all_blank, allow_destroy: true

end
