class Choice < ActiveRecord::Base
  belongs_to :question
  has_many :selections

  validates_presence_of :body

  def num_times_chosen(id)
    Selection.where(choice_id: id).count
  end
end
