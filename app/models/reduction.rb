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

  def schedule(week)
  end
end
