class AuthorsController < ApplicationController
  before_action :set_author, only: %i[show]

  def index
    @q = Author.ransack(params[:q])
    @authors = @q.result(distinct: true).page(params[:page]).per(10)
  end

  def show
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if author.save
      redirect_to @author, notice: 'Author was successfully created.'
    else
      render :new
    end
  end

  private

  def set_author
    @author = Author.find(params[:id])
  end

  def author_params
    params.require(:author).permit(:name, :bio, :photo)
  end
end
