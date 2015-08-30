class TakenSurvey < ActiveRecord::Base
  belongs_to :survey
  belongs_to :taker, class_name: :User
  has_many :selections

  def taken_summary
    summary_hash = selections.each_with_object({}) do |selection, hash|
      hash[selection.choice.question.body] = selection.choice.body
    end
    summary_hash
  end

end