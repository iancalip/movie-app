class Movie < ApplicationRecord
  belongs_to :director
  belongs_to :genre
  has_one_attached :image
  validates :title, :release_year, :synopsis, :nationality, :duration, :director_id,
    :genre_id, presence: true
end
