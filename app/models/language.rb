class Language < ApplicationRecord
  has_many :repositories, dependent: :delete_all
  validates :name, uniqueness: true, presence: true
end
