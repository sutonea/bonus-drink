class BonusDrink

  def self.total_count_for(amount)
    DrinkCount.new.total_count_for(amount)
  end

  class DrinkCount
    COUNT_FOR_BONUS = 3
    private_constant :COUNT_FOR_BONUS

    def self.count_for_bonus
      COUNT_FOR_BONUS
    end

    def initialize
      @hand_bottles = 0
      @total_bottles = 0
    end

    def total_count_for(amount)
      get_bottles(amount)
      while can_get_bonus?
        change_bottles
      end
      @total_bottles
    end

    private

    def change_bottles
      bonus = @hand_bottles / self.class.count_for_bonus
      @hand_bottles -= bonus * self.class.count_for_bonus
      get_bottles(bonus)
    end

    def get_bottles(amount)
      @hand_bottles += amount
      @total_bottles += amount
    end

    def can_get_bonus?
      @hand_bottles >= self.class.count_for_bonus
    end
  end

end
