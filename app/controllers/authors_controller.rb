class AuthorsController < ApplicationController
  def index
    @q = Author.ransack(params[:q])
    @authors = @q.result(distinct: true)
  end

  def show
    @author = Author.find(params[:id])
  end
end
