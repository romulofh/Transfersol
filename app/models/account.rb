class Account < ApplicationRecord
    belongs_to :agency
    has_many :movements

    validates :number, presence: true, length: { minimum: 7, maximum: 7}
    validates :number, uniqueness: true
    validates :agencia, presence: true
    validates :limit, presence: true
    
end