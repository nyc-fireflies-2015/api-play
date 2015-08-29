class AddTakenSurveysToResponses < ActiveRecord::Migration
  def change
    add_reference :responses, :taken_survey
  end
end
