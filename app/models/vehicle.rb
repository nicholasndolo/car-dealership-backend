class Vehicle < ApplicationRecord
    has_many :reviews, dependent: :destroy
end
