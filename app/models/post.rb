class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validates :title, format: {with: /Won't Believe|Secret|Top \d|Guess/}
end


# If the title does not contain "Won't Believe", "Secret", 
# "Top [number]", or "Guess", the validator should return false.
#format
# This helper validates the attributes' values
#  by testing whether they match a given regular expression,
#  which is specified using the :with option.
#example:
#class Product < ApplicationRecord
  #validates :legacy_code, format: { with: /\A[a-zA-Z]+\z/,
  #  message: "only allows letters" }
#end
