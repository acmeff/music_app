class Track < ApplicationRecord
  TYPES = ['bonus', 'regular']

  validates :track_type, :name, :album_id, presence: true
  validates :track_type, inclusion: TYPES

  belongs_to :album
  has_many :notes
  has_one :band,
    through: :album,
    source: :band
end
