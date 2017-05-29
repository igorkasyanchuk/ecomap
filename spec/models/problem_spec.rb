# == Schema Information
#
# Table name: problems
#
#  id                  :integer          not null, primary key
#  title               :string
#  description         :text
#  solution            :text
#  lat                 :decimal(, )
#  lng                 :decimal(, )
#  problem_category_id :integer
#  moderated           :boolean          default(FALSE)
#  solved              :boolean          default(FALSE)
#  likes               :integer          default(0)
#  user_id             :integer
#  stars               :integer          default(3)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

require 'rails_helper'

RSpec.describe Problem, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
