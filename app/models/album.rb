class Album < ApplicationRecord
  TYPES = ['live', 'studio']

  validates :band_id, :name, presence: true
  validates :album_type, inclusion: TYPES

  belongs_to :band
  has_many :tracks, dependent: :destroy
end
