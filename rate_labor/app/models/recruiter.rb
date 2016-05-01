class Recruiter < ActiveRecord::Base
  belongs_to :company
  has_many :reviews, as: :reviewable
  validates :name, presence: true
  validates :name, uniqueness: true
end
