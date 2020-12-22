class ComicsController < ApplicationController

    get '/comics' do
        redirect_if_not_logged_in
        @comics = Comic.all
        erb :'comics/index'
    #get all of the comics
    end

    get '/comics/new' do
        redirect_if_not_logged_in
        erb :'comics/new'
    end

    post '/comics' do
         redirect_if_not_logged_in
        comic = Comic.new(params[:comic])
        comic.user_id = current_user.id
        if comic.save 
            redirect to "/comics/#{comic.id}"
        else
            erb :'comics/new'
        end
    end
    # comic = Comic.new(params[:comic])
    # comic.user_id = current_user.id
    # comic.save
    # redirect to "/comics/#{comic.id}"




    get '/comics/:id' do
        #show
        #show one specific comic
        redirect_if_not_logged_in
        @comic = Comic.find_by_id(params[:id])
        erb :'comics/show'
    end

    get '/comics/:id/edit' do
        @comic = Comic.find_by_id(params[:id])
        if logged_in? && current_user == @comic.user
            erb :'comics/edit'
        else
        redirect to '/comics'
        end
    end

    # def redirect_if_not_logged_in
    #     flash[:message] = "Please log in before continuing!"
    #     redirect to '/signin' if !logged_in?
    # end


    patch '/comics/:id' do
        redirect_if_not_logged_in
            @comic = Comic.find_by_id(params[:id])
        if current_user.id == @comic.id 
            @comic.update(params[:comic])
        end
        redirect to "/comics/#{@comic.id}"
    end

    delete '/comics/:id' do
        redirect_if_not_logged_in
        @comic = Comic.find_by_id(params[:id])
        if @comic.user == current_user
             @comic.destroy
        end
        redirect to '/comics'
    end
end