# == Schema Information
#
# Table name: schedule_details
#
#  id          :integer          not null, primary key
#  schedule_id :integer          not null
#  name        :string
#  date_name   :time
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class ScheduleDetail < ApplicationRecord
  belongs_to :schedule

  def clean_time(time)
    if time.nil?
      ''
    else
      time.strftime("%I:%M %p")
    end
  end

  def speaker_photo
    user = speaker()
    if user
      user.profile.avatar_url
    else
      ''
    end
  end

  def user_name
    user = speaker()
    if user
      user.full_name
    else
      ''
    end
  end

  def speaker
    if self.user_id.present?
      User.find_by(id: user_id)
    else
      false
    end
  end

end
