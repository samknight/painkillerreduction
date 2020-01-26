class Patient < ApplicationRecord
    has_many :medications
    has_many :reductions
end
