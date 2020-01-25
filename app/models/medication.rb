class Medication < ApplicationRecord
  belongs_to :patient
  belongs_to :drug
  has_many :reduction

  def morphine_equivalent
    puts drug.morphine
    puts dose
    puts frequency

    drug.dosage.to_i * drug.morphine * dose * frequency
  end
end
