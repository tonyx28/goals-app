# == Schema Information
#
# Table name: user_comments
#
#  id              :integer          not null, primary key
#  body            :text             not null
#  commenter_id    :integer          not null
#  commented_on_id :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

FactoryGirl.define do
  factory :user_comment do
    
  end
end
