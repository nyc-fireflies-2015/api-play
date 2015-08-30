class Selection < ActiveRecord::Base
  belongs_to :choice
  belongs_to :user, class_name: :User
  belongs_to :taken_survey

  validates :choice, :user, :taken_survey, presence: true
end
