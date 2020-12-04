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
    end

    get '/comics/:id/edit' do
        #edit()
        #get the comic to edit the comic
    end

    patch '/comics/:id' do
        #update
        #update the single comic
    end

    delete '/comics/:id' do
        #delete or destroy
        #destroy the single comic
    end
end