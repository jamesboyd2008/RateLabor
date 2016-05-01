class CompaniesController < ApplicationController
  def index
    companies = Company.all.to_a;
    third = companies.length / 3
    # do this in the model
    @companies_1 = companies.slice!(0..third)
    @companies_2 = companies.slice!(0..third)
    @companies_3 = companies
  end
end
