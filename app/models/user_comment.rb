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

class UserComment < ActiveRecord::Base
  belongs_to :commenter, class_name: :User
  belongs_to :commented_on, class_name: :User
end
