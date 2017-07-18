# == Schema Information
#
# Table name: problems
#
#  id                  :integer          not null, primary key
#  title               :string
#  description         :text
#  solution            :text
#  lat                 :decimal(, )
#  lng                 :decimal(, )
#  problem_category_id :integer
#  moderated           :boolean          default(FALSE)
#  solved              :boolean          default(FALSE)
#  likes               :integer          default(0)
#  user_id             :integer
#  stars               :integer          default(3)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Problem < ApplicationRecord
  belongs_to :problem_category
  belongs_to :author, foreign_key: :user_id, class_name: 'User', optional: true
  has_many :photos, dependent: :destroy, inverse_of: :problem

  accepts_nested_attributes_for :photos, reject_if: proc { |attributes| attributes['image'].blank? }, allow_destroy: true

  validates_presence_of :title, :description, :lat, :lng, :problem_category_id

  def author_name
    if author.present? 
      author.full_name
    else
      'Анонім'
    end
  end

  def to_s
  	"#{author_name}: #{title}"
  end
end
