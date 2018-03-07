class PresentersController < ApplicationController
  def index
    sort_attribute = params[:sort_by] || "name"
    sort_attribute_order = params[:sort_order] || "asc"
    @presenters = Presenter.all.order(sort_attribute => sort_attribute_order)
    @score=Score.find_by()
    @current_user =current_user
    render "index.html.erb"
  end

  def new
    @presenter = Presenter.new
    render "new.html.erb"
  end

  def create
    @presenter = Presenter.create(
      presenter_id: params[:presenter_id],
      name: params[:name],
      photo: params[:photo],
      points: params[:points],
      comment: params[:comment],
    )
    if @presenter.save
      flash[:success] = "Presenter Created!"
      redirect_to "/presenters"
    else
      flash[:warning] = 'Error. Presenter not created. Please try again.'
      redirect_to '/presenter'
    end
  end

  def show
    @presenter = Presenter.find(params[:id])
    render "show.html.erb"
  end

  def edit
    @presenter = Presenter.find_by(id: params[:id])
    render "edit.html.erb"
  end

  def update
    @presenter = Presenter.find_by(id: params[:id])
    @presenter.update(
    presenter_id: params[:presenter_id],
    name: params[:name],
    photo: params[:photo],
    points: params[:points],
    comment: params[:comment],
    )
    flash[:success] = "Presenter Updated!"
    redirect_to "/presenters/#{@presenter.id}"
  end

  def destroy
    @presenter = Presenter.find_by(id: params[:id])
    @presenter.destroy
    flash[:warning] = "Presenter Deleted"
    redirect_to "/presenters"
  end
end
