class Survey < ActiveRecord::Base
  belongs_to :creator, class_name: :User
  has_many :questions
  has_many :taken_surveys

  validates_presence_of :title, :category

  def next_question(current_question)
    questions.find_by(id:current_question.id+1)
  end

  def created_by?(user)
    user.id==creator.id
  end

  def total_takers
    taken_surveys.count
  end

  def num_times_chosen(id)
    Selection.where(choice_id: id).count
  end

  def percentage(id)
    num = num_times_chosen(id)
    ((num/(total_takers * 1.0))*100).round(2)
  end
end
