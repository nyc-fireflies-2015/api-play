class Response < ActiveRecord::Base
  belongs_to :choice
  belongs_to :user
  belongs_to :taken_survey
end
