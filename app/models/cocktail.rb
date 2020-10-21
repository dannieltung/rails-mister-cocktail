class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  has_many :reviews
  validates :name, presence: true, uniqueness: true
  # cocktails e ingredients não possuem uma ligação direta então precisa do through
end
