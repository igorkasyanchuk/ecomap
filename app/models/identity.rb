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

class Identity < ApplicationRecord
  OMNIAUTH_PROVIDERS = %i(facebook vkontakte twitter github linkedin).freeze

  belongs_to :user

  validates :provider, inclusion: { in: OMNIAUTH_PROVIDERS.map(&:to_s) }
end
