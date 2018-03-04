class ScoresController < ApplicationController
  def index
    sort_attribute = params[:sort_by] || 'points'
    sort_attribute_order = params[:sort_order] || 'asc'
    @scores = Score.all.order(sort_attribute => sort_attribute_order)
    render 'index.html.erb'
  end

  def new
    @questions = Question.all
  end

  def create
    score = Score.new(
      :score => params[:score]
    )
    if score.save
      redirect_to '/'
    else
      redirect_to '/scores/new'
    end
  end

  def edit
    @score = Score.find(params[:id])
  end

  def update
    score = Score.find(params[:id])
    score.update(
      :score => params[:score]
    )
    redirect_to '/'
  end
end
