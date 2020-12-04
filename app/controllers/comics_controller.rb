class ComicsController < ApplicationController

    get '/comics' do
        binding.pry
        @comics = Comics.all
        erb :index
    #get all of the comics
    end

    get '/comics/new' do
        #new
    #get form to create new comics
    end

    post '/comics' do
        #create(backend)
    #create a new comicbook and redirect
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