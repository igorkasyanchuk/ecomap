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

class Page < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
end
