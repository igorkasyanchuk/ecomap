# == Schema Information
#
# Table name: pages
#
#  id         :integer          not null, primary key
#  title      :string
#  content    :text
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :page do
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraph }
    slug { Faker::Internet.domain_word }
  end
end
