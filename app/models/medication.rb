class Medication < ApplicationRecord
  belongs_to :patient
  belongs_to :drug
  has_many :reduction

  validates :dose, presence: true, numericality: { only_integer: true, greater_than: 1 }
  validates :frequency, presence: true, numericality: { only_integer: true, greater_than: 1 }

  def morphine_equivalent
    drug.dosage.to_i * drug.morphine * dose * frequency
  end
end
