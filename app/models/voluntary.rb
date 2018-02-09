# == Schema Information
#
# Table name: voluntaries
#
#  id            :integer          not null, primary key
#  name          :string
#  phone         :string
#  career        :string
#  interest_area :string
#  email         :string
#  message       :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Voluntary < ApplicationRecord
end
