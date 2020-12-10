class ComicsController < ApplicationController

    get '/comics' do
        @comics = Comic.all
        erb :'comics/index'
    #get all of the comics
    end

    get '/comics/new' do
        #new
    #get form to create new comics
        redirect_if_not_logged_in
        erb :'comics/new'
    end

    post '/comics' do
        binding.pry
        #create(backend)
    #create a new comicbook and redirect
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

    patch '/comics/:id' do
        #update
        #update the single comic
        # comic = Comic.find_by_id(params[:id])
        # redirect to
        redirect_if_not_logged_in
        comic = Comic.find_by_id(params[:id])
        comic.update(params[:comic])
        redirect to "/comics/#{comic.id}"
    end

    delete '/comics/:id' do
        #delete or destroy
        #destroy the single comic
        redirect_if_not_logged_in
        comic = Comic.find_by_id(params[:id])
        comic.destroy
        redirect to '/comics'
    end
end