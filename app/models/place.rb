class Place < ApplicationRecord
  belongs_to :user
  validates :address, :description, presence: true # prevents new place from being saved without a valid entry
  validates :name, presence: true, length: { minimum: 3 }



end
