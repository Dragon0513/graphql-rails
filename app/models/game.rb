class Game < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_and_belongs_to_many :platforms
end
