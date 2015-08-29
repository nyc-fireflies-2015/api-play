class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :choices

  validates_presence_of :body

  def add_choices(params_hash)
    params_hash.each {|key, choice| choices.create(body: choice[:body])}
  end
end
