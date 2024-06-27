class AuthorsController < ApplicationController
  def index
    @q = Author.ransack(params[:q])
    @authors = @q.result(distinct: true).page(params[:page])
  end

  def show
    @author = Author.find(params[:id])
  end
end
