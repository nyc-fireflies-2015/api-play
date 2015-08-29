class Choice < ActiveRecord::Base
  belongs_to :question
  has_many :selections

  validates_presence_of :body

end
