class Agency < ApplicationRecord
    has_many :accounts

    validates :number, presence: true, length: { minimum: 4, maximum: 4}
    validates :number, uniqueness: true
    validates :address, presence: true
end