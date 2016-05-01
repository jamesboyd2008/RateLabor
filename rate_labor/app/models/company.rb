class Company < ActiveRecord::Base
  has_many :recruiters
  has_many :reviews, as: :reviewable
  validates :name, presence: true
end
