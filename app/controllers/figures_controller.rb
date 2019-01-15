class FiguresController < ApplicationController
  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    @title = Title.create(params[:title])
    @figure.titles << @title

    if params[:title][:name].empty?
      @figure.titles.build(:name => params[:title][:name])
      @figure.save
    end

    if !params[:landmark][:name].empty?
      @figure.landmarks.build(:name => params[:landmark][:name])
      @figure.save
    end
    redirect to "figures/#{@figure.id}"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  post '/figures/:id' do
    @figure = Figure.find(params[:figure])
    @title = Title.create(params[:title])
    @figure.titles << @title

    if params[:title][:name].empty?
      @figure.titles.build(:name => params[:title][:name])
      @figure.save
    end

    if !params[:landmark][:name].empty?
      @figure.landmarks.build(:name => params[:landmark][:name])
      @figure.save
    end
    redirect to "figures/#{@figure.id}"
  end
end
