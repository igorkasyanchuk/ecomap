# == Schema Information
#
# Table name: identities
#
#  id           :integer          not null, primary key
#  uid          :string
#  provider     :string
#  user_id      :integer
#  external_url :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryGirl.define do
  factory :identity do
    sequence :uid do |i|
      i.to_s.rjust(8, '1').to_i
    end
    provider { Identity::OMNIAUTH_PROVIDERS.sample }
    association :user

    Identity::OMNIAUTH_PROVIDERS.each do |auth_provider|
      trait auth_provider do
        provider auth_provider
      end
    end
  end
end
