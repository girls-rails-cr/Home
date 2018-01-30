# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  role                   :integer          default("user"), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  enum role: {
    user: 0,
    admin: 1,
    speaker: 3,
  }
  has_one :profile, dependent: :destroy, inverse_of: :user

  scope :admins, -> { where(role: 1) }
  scope :speakers, -> { admins.where(role: 3) }

  delegate :full_name, to: :profile

  accepts_nested_attributes_for :profile,
                                reject_if: :all_blank, allow_destroy: true
end
