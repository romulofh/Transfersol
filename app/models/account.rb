class Account < ApplicationRecord
    belongs_to :agency
    has_many :movements

    
end