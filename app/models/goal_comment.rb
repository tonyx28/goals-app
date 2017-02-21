# == Schema Information
#
# Table name: goal_comments
#
#  id           :integer          not null, primary key
#  body         :text             not null
#  commenter_id :integer          not null
#  goal_id      :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class GoalComment < ActiveRecord::Base
  belongs_to :commenter, class_name: :User
  belongs_to :goal
end
