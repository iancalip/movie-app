class Director < ApplicationRecord
  belongs_to :genre
  has_many :movies
  validates :name, :nationality, :date_of_birth, :genre_id, presence: true
end
