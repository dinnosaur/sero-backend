class Recipe < ApplicationRecord
    has_many :ingredients

    validates :title, presence: true
    validates :method, presence: true
end
