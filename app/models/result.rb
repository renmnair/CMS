class Result < ActiveRecord::Base

belongs_to :examination
has_many  :students

end
