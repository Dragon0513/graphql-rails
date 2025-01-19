class Review < ApplicationRecord
  belongs_to :game
  belongs_to :author
end
