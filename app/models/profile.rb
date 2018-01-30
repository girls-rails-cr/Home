# == Schema Information
#
# Table name: profiles
#
#  id           :integer          not null, primary key
#  user_id      :integer          not null
#  first_name   :string
#  last_name    :string
#  avatar       :string
#  username     :string
#  career       :string
#  address      :string
#  fb_link      :string
#  twitter_link :string
#  linkedin     :string
#  about_me     :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Profile < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  belongs_to :user

  validates :user, presence: true
  validates_integrity_of  :avatar
  validates_processing_of :avatar
  
  PROFILE_PHOTOS =  %w(https://images.unsplash.com/photo-1493689485253-f07fcbfc731b?auto=format&fit=crop&w=1033&q=80,
    https://images.unsplash.com/photo-1494707924465-e1426acb48cb?auto=format&fit=crop&w=1050&q=80,
    https://images.unsplash.com/photo-1486312338219-ce68d2c6f44d?auto=format&fit=crop&w=1052&q=80,
    https://images.unsplash.com/photo-1489844097929-c8d5b91c456e?auto=format&fit=crop&w=1052&q=80,
    https://images.unsplash.com/photo-1487017159836-4e23ece2e4cf?auto=format&fit=crop&w=1051&q=80,
    https://images.unsplash.com/photo-1496902526517-c0f2cb8fdb6a?auto=format&fit=crop&w=1050&q=80)

    def full_name
      "#{first_name} #{last_name}"
    end

    def full_name=(value)
      split = value.split(' ', 2)
      self.first_name = split.first
      self.last_name = split.last
    end
    def show_background
      img_url = (0...6).map { PROFILE_PHOTOS[rand(PROFILE_PHOTOS.length)] }.join
      img_url
    end
  end
