class TakenSurvey < ActiveRecord::Base
  belongs_to :survey
  belongs_to :taker, class_name: :User
  has_many :selections

  def self.taken_summary(taken)
    summary_hash = {}
    taken.selections.each do |selection|
      summary_hash[selection.choice.question.body] = selection.choice.body
    end
    summary_hash
  end

end