class Books < ActiveRecord::Base
    belongs_to :user
    has_many :Ratings
end