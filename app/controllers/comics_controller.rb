class ComicsController < ApplicationController

    get '/comics' do
        @comics = Comic.all
        erb :'comics/index'
    #get all of the comics
    end

    get '/comics/new' do
        erb :'comics/new'
    #    end
    end

    post '/comics' do
    redirect_if_not_logged_in
    comic = Comic.new(params[:comic])
    comic.user_id=current_user.id
    comic.save
    redirect to "/comics/#{comic.id}"
    end

    get '/comics/:id' do
        #show
        #show one specific comic
        @comic = Comic.find_by_id(params[:id])
        erb :'comics/show'
    end

    get '/comics/:id/edit' do
        #edit()
        #get the comic to edit the comic
        @comic = Comic.find_by_id(params[:id])
        erb :'comics/edit'
    end

    # def redirect_if_not_logged_in
    #     flash[:message] = "Please log in before continuing!"
    #     redirect to '/signin' if !logged_in?
    # end


    patch '/comics/:id' do
        redirect_if_not_logged_in
        @comic = Comic.find_by_id(params[:id])
        @comic.update(params[:comic])
        redirect to "/comics/#{@comic.id}"
    end

    delete '/comics/:id' do
        #delete or destroy
        #destroy the single comic
        redirect_if_not_logged_in
        @comic = Comic.find_by_id(params[:id])
        @comic.destroy
        redirect to '/comics'
    end
end