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

class ProblemCategory < ApplicationRecord
  mount_uploader :marker, MarkerUploader

  validates :name, presence: true, uniqueness: true
  validates :marker, presence: true
end
