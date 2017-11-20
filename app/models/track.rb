class Track < ApplicationRecord
  belongs_to :user
  has_many :pixels
end
