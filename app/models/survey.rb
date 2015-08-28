class Survey < ActiveRecord::Base
  belongs_to :creator, class_name: :User
  has_many :questions
  has_many :taken_surveys

  validates_presence_of :title, :category
end
