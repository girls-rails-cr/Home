# == Schema Information
#
# Table name: sponsors
#
#  id            :integer          not null, primary key
#  name          :string
#  email_contact :string
#  description   :text
#  company       :string
#  logo          :string
#  page_url      :string
#  event_id      :integer
#  status        :integer          default("active"), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Sponsor < ApplicationRecord
  mount_uploader :logo, AvatarUploader
  enum status: {
    inactive: 0,
    active:  1,
    pending: 2
  }
  scope :current_sponsors, ->(event_id) { where(event_id: event_id, status: 1) }


end
