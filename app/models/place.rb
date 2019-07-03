class Place < ApplicationRecord
  belongs_to :user
  validates :name, presence: true # prevents new place from being saved without a valid entry
end
