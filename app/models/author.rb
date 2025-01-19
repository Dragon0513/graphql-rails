class Author < ApplicationRecord
  has_many :reviews, dependent: :destroy
end
