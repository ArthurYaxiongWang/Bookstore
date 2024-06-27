class AuthorsController < ApplicationController
  def index
    @q = Author.ransack(params[:q])
    @authors = @q.result(distinct: true).page(params[:page]).per(10)
  end

  def show
    @author = Author.find(params[:id])
  end
end
