class ReviewsController < ApplicationController
  before_action :set_review, only: %i[show]

  def index
    @q = Review.ransack(params[:q])
    @reviews = @q.result(distinct: true).page(params[:page]).per(10)
  end

  def show
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end
end
