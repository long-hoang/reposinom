class Place < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :photos

  geocoded_by :address
  after_validation :geocode

  validates :address, :description, presence: true # prevents new place from being saved without a valid entry
  validates :name, presence: true, length: { minimum: 3 }



end
