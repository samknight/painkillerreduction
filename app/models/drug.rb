class Drug < ApplicationRecord

    def full_name
        "#{name} #{dosage}mg"
    end
end
