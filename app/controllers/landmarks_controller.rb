class LandmarksController < ApplicationController

  get '/landmarks' do
    erb:'landmarks/index'
  end

  get '/landmarks/new' do
    erb:'landmarks/new'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    erb:'/landmarks/show'
  end

  post '/landmarks' do
    @landmark = Landmark.create(name: params["landmark_name"], year_completed: params["landmark_year_completed"])

    redirect"/landmarks/#{@landmark.id}"
  end

  get'/landmarks/:id/edit' do
    @landmark = Landmark.find_by_id(params[:id])

    erb:'landmarks/edit'
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    @landmark.name = params[:name]
    @landmark.year_completed = params[:year_completed]
    @landmark.save

    redirect"/landmarks/#{@landmark.id}"
  end

end
