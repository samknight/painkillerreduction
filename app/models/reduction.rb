class Reduction < ApplicationRecord
  belongs_to :medication

  def plan(week)
    meq = medication.morphine_equivalent
    reduction_meq = meq * (0.1 * week)
  end

  def pill_reduction(week)
    pills = medication.dose * medication.frequency
    (pills - (pills * (0.1 * week))).round
  end

  # [2, 2, 2, 1]
  def schedule(week)
    pill_per_day = pill_reduction(week) #9
    individual_dose = (pill_per_day / medication.frequency).floor #1
    puts individual_dose
    puts "------"
    array = []
    medication.frequency.times { |a| array << individual_dose } #[1, 1, 1, 1]
    puts array.inspect
    puts "-----"
    remaining = pill_per_day - array.sum #3
    puts remaining
    puts "-----"
    remaining.times do |r|
      array[r] = array[r]+1
    end
    puts array
    puts "========="
    return array
  end
end
