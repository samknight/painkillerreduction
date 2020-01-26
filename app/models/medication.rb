class Medication < ApplicationRecord
  belongs_to :patient
  belongs_to :drug
  has_many :reduction

  attr_accessor :add_another

  validates :dose, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :frequency, presence: true, numericality: { only_integer: true, greater_than: 0 }

  def morphine_equivalent
    drug.dosage.to_i * drug.morphine * dose * frequency
  end
end
