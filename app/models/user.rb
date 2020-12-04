class User < ActiveRecord::Base
    has_many :comics
    has_secure_password 
    #self.all
    #initalize
    #create
    #attr_accessor
    #find_by
end