class TakenSurvey < ActiveRecord::Base
  belongs_to :survey
  belongs_to :taker, class_name: :User
  has_many :selections

  def taken_summary
    #refactor each_with_object({})
    summary_hash = {}
    selections.each do |selection|
      summary_hash[selection.choice.question.body] = selection.choice.body
    end
    summary_hash
  end

end