class Survey < ActiveRecord::Base
  belongs_to :creator, class_name: :User
  has_many :questions
  has_many :taken_surveys

  validates_presence_of :title, :category

  def next_question(current_question)
    questions.find_by(id:current_question.id+1)
  end

  def total_takers
    taken_surveys.count
  end

  def percentage
    num = num_times_chosen
    ((num/(total_takers * 1.0))*100).round(2)
  end
end
