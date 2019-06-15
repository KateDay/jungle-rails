class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  validates :description, presence: true
  validates :rating, numericality: { only_integer: true, :in => 1..5 }, presence: true
end
