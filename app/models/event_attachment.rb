# == Schema Information
#
# Table name: event_attachments
#
#  id         :integer          not null, primary key
#  event_id   :integer          not null
#  img        :string
#  attach     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class EventAttachment < ApplicationRecord
  mount_uploader :img, ImageUploader
  belongs_to :event
end
