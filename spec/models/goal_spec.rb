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

require 'rails_helper'

RSpec.describe Goal, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
