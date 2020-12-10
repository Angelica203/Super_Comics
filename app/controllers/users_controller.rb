class UsersController < ApplicationController
 
    get '/signup' do
        erb :'users/signup'
    end

    post '/signup' do
        # user = User.create(params[:user])
        # redirect to "/users/#{user.id}"
        user = User.new(params[:user])
        if user.save
            redirect to "/users/#{user.id}"
        else
            @errors = user.errors.full_messages
            erb :'users/signup'
        end
    end

        get '/signin' do
             erb :'users/signin'
        end
 
        post '/signin' do
            !params[:user][:username].blank? ? user = User.find_by_username(params[:user][:username]) : user = User.find_by_email(params[:user][:email])
            if user && user.authenticate(params[:user][:password])
                session[:user_id] = user.id
                redirect to "/users/#{user.id}"
            else
                flash[:message] = "Invalid Credentials. Please try again."
                redirect to '/signin'
            end
        end

    get '/users/:id' do
        binding.pry
        @user = User.find_by_id(params[:id])
        @comics = @user.comics
        erb :'users/show'
    end

    get '/logout' do
        session.clear
        redirect to '/signin'
    end

end


# 