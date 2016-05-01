class RecruitersController < ApplicationController
  def index
    recruiters = Recruiter.all.to_a.sort_by { |r| r.name }
    @good_recruiters = []
    @bad_recruiters = []
    recruiters.each do |recruiter|
      reviews = Review.where(reviewable_type: "Recruiter", reviewable_id: recruiter.id)
      positivities_of_reviews = []
      reviews.each do |review|
        positivities_of_reviews << review.positivity
      end
      if positivities_of_reviews.any? { |r| r == false }
        @bad_recruiters << recruiter
      else
        @good_recruiters << recruiter
      end
    end
  end

  def show
    @recruiter = Recruiter.find(params[:id])
    @company = Company.find(@recruiter.company_id)
    @reviews = Review.where(reviewable_type: "Recruiter",
                            reviewable_id: params[:id])
  end
end
