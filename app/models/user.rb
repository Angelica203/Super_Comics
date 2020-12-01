class User < ActiveRecord::Base
    has_many :comics
    has_secure_password 
end