class User < ActiveRecord::Base
    has_many :comics
    has_secure_password 
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true

    #self.all
    #initalize
    #create
    #attr_accessor
    #find_by
end

