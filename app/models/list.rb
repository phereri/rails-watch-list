class List < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks
  has_one_attached :photo
end
