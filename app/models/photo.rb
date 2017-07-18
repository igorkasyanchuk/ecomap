# == Schema Information
#
# Table name: photos
#
#  id          :integer          not null, primary key
#  image       :string
#  description :text
#  problem_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Photo < ApplicationRecord
  mount_uploader :image, PhotoUploader
  belongs_to :problem, inverse_of: :photos

  validates_presence_of :image
end
