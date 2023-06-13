class User < ActiveRecord::Base
    # has_secure_password
    
    has_many :Ratings
    has_many :Books
end