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

FactoryGirl.define do
  factory :goal_comment do
    
  end
end
