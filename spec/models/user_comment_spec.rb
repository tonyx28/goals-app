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

require 'rails_helper'

RSpec.describe UserComment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
