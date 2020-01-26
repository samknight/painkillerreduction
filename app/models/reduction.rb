class Reduction < ApplicationRecord
  belongs_to :medication

  validates :days, presence: true, numericality: { only_integer: true, greater_than: 1 }

  # Number pills that should be reduced per day
  # 2 pills 4 times a day over 100 days
  # => 0.08
  def pill_reduction_per_day
    pills = medication.dose * medication.frequency
    puts "pills #{pills}"
    puts "days #{days}"
    (pills.to_f / days.to_f)
  end

  # Number of pills a patient should be taking on a certain day
  #
  # 8 pills a day
  # day 10
  # 0.8 reduction
  # 8 - 0.8 => 7.2
  def pills_at_day(day)
    pills = medication.dose * medication.frequency
    puts "pill reduction per day #{pill_reduction_per_day}"
    reduction =  pill_reduction_per_day * day
    (pills - reduction).round.to_i
  end

  # [2, 2, 2, 1]

  # Day 10
  # pills today => 7.2
  # 1.8 => 1
  # [1,1,1,1]
  # [2,2,2,1]
  def schedule(day)
    puts day
    puts pills_at_day(day)
    pills_today = pills_at_day(day)
    individual_dose = (pills_today / medication.frequency).floor #1
    puts individual_dose.inspect
    array = []
    medication.frequency.times { |a| array << individual_dose } #[1, 1, 1, 1]

    remaining = pills_today - array.sum #3 pill_per_day % frequency
    puts "remaining #{remaining}"
    if medication.frequency == 4
      order = [0, 2, 1, 3]
      remaining.times do |r|
        array[order[r]] = array[order[r]]+1
      end
    else
      remaining.times do |r|
        array[r] = array[r]+1
      end
    end

    return array
  end
end

# Reduction by days
# Show final week
