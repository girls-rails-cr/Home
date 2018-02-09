# frozen_string_literal: true
# == Schema Information
#
# Table name: events
#
#  id                      :integer          not null, primary key
#  title                   :string           not null
#  description             :string
#  venue_description       :text
#  start_time              :datetime
#  video_url               :string
#  venue_short_description :string
#  map_url                 :string
#  background_image        :string
#  status                  :integer          default("inactive"), not null
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  end_date                :datetime
#

class Event < ApplicationRecord
  mount_uploader :background_image, ImageUploader
  enum status: {
    inactive: 0,
    active:   1
  }
  scope :inactive, -> { where(status: 0) }
  scope :active, -> { where(status: 1) }

  has_many :subscribers
  has_many :sponsors
  has_many :speakers, class_name: "User"
  
  has_many :schedules, dependent: :destroy, inverse_of: :event
  accepts_nested_attributes_for :schedules, reject_if: :all_blank, allow_destroy: true

  has_many :event_attachments, dependent: :destroy, inverse_of: :event
  accepts_nested_attributes_for :event_attachments, reject_if: :all_blank, allow_destroy: true
end
