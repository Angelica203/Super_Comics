class ComicsController < ApplicationController

    get '/comics' do
        @comics = Comic.all
        erb :'comics/index'
    #get all of the comics
    end

    get '/comics/new' do
        #new
    #get form to create new comics
        erb :'comics/new'
    end

    post '/comics' do
        #create(backend)
    #create a new comicbook and redirect
    comic = Comic.create(params[:comic])
    redirect to "/comics/#{comic.id}"
    end

    get '/comics/:id' do
        #show
        #show one specific comic
        @comic = Comic.find_by_id(params[:id])
        erb :'comics/show'
    end

    get '/comics/:id/edit' do
                # binding.pry
        #edit()
        #get the comic to edit the comic
        @comic = Comic.find_by_id(params[:id])
        erb :'comics/edit'
    end

    patch '/comics/:id' do
        # binding.pry
        #update
        #update the single comic
        # comic = Comic.find_by_id(params[:id])
        # redirect to
        comic = Comic.find_by_id(params[:id])
        comic.update(params[:comic])
        redirect to "/comics/#{comic.id}"
    end

    delete '/comics/:id' do
        #delete or destroy
        #destroy the single comic
    end
end