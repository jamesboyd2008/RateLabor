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
  end
end
