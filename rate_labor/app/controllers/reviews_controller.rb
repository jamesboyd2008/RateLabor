class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
    if @review.reviewable_type == "Company"
      @reviewable = Company.find(@review.reviewable_id)
    else
      @reviewable = Recruiter.find(@review.reviewable_id)
    end
  end

  def new
    
  end
end
