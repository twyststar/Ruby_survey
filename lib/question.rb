class Question < ActiveRecord::Base
  belongs_to(:survey)
  validates(:q_text, :presence => true)
end
