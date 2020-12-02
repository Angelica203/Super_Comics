class ComicsController < ApplicationController

    get '/comics' do
    #get all of the comics
    end

    get '/comics/new' do
    #get form to create new comics
    end

    post '/comics' do
    #create a new comicbook and redirect
    end

    get '/comics/:id' do
    #show one specific comic
    end

    get '/comics/:id/edit' do
        #get the comic to edit the comic
    end

    patch '/comics' do
    end
end