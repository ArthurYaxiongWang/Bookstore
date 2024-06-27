class ReviewsController < ApplicationController
  def index
    @q = Review.ransack(params[:q])
    @reviews = @q.result(distinct: true).page(params[:page]).per(10)
  end

  def show
    @review = Review.find(params[:id])
  end
end
