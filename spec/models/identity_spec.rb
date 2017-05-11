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

require 'rails_helper'

RSpec.describe Identity, type: :model do
  context 'validations' do
    it { expect(build(:identity)).to be_valid }
  end
end
