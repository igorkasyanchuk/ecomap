# == Schema Information
#
# Table name: problem_categories
#
#  id         :integer          not null, primary key
#  name       :string
#  marker     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe ProblemCategory, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
