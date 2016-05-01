class RecruitersController < ApplicationController
  def index
  end

  def show
    @recruiter = Recruiter.find(params[:id])
    @company = Company.find(@recruiter.company_id)
    @reviews = Review.where(reviewable_type: "Recruiter",
                            reviewable_id: params[:id])
  end
end
