# == Schema Information
#
# Table name: goals
#
#  id           :integer          not null, primary key
#  title        :string           not null
#  user_id      :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  is_completed :boolean          default("f")
#  description  :text
#  is_private   :boolean
#

class Goal < ActiveRecord::Base
  validates :title, :user_id, presence: true

  belongs_to :user

  has_many :comments, as: :commentable
end
