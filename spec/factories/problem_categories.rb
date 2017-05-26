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

FactoryGirl.define do
  factory :problem_category do
    name { Faker::Commerce.department }
    marker { Rack::Test::UploadedFile.new(Rails.root.join('app', 'assets', 'images', 'markers', 'marker_1.png')) } 
  end
end
