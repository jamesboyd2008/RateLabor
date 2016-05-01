class CompaniesController < ApplicationController
  def index
    companies = Company.all.to_a.sort_by { |c| c.name }
    third = companies.length / 3
    # do this in the model
    @companies_1 = companies.slice!(0..third)
    @companies_2 = companies.slice!(0..third)
    @companies_3 = companies
  end

  def show
    @company = Company.find(params[:id])
    @reviews = Review.where(reviewable_type: "Company", reviewable_id: params[:id])
    @recruiters = Recruiter.where(company_id: params[:id])
  end

  def edit
    companies = Company.all.to_a.sort_by { |r| r.name }
    @good_companies = []
    @bad_companies = []
    companies.each do |company|
      reviews = Review.where(reviewable_type: "Company", reviewable_id: company.id)
      positivities_of_reviews = []
      reviews.each do |review|
        positivities_of_reviews << review.positivity
      end
      if positivities_of_reviews.any? { |r| r == false }
        @bad_companies << company
      else
        @good_companies << company
      end
    end
  end
end
