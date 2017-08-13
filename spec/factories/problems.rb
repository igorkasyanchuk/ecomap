# == Schema Information
#
# Table name: problems
#
#  id                  :integer          not null, primary key
#  title               :string
#  description         :text
#  solution            :text
#  lat                 :decimal(18, 14)
#  lng                 :decimal(18, 14)
#  problem_category_id :integer
#  moderated           :boolean          default(FALSE)
#  solved              :boolean          default(FALSE)
#  likes               :integer          default(0)
#  user_id             :integer
#  stars               :integer          default(3)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

FactoryGirl.define do
  factory :problem do
    title { Faker::Book.title  }
    description { Faker::Lorem.paragraph }
    solution { Faker::Lorem.paragraph }
    lat { Faker::Address.latitude }
    lng { Faker::Address.longitude }
    association :problem_category
  end
end
