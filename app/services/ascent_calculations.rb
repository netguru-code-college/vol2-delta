module AscentCalculations
  class CalculatePoints

    def initialize(ascent:)
      @ascent = ascent
    end

    def call
      calculate_points
    end
    def calculate_points
      @ascent.points = @ascent.climbing_route.route_grade.points + @ascent.ascent_style.points
    end
  end

  class CalculateUserTotalPoints

    def initialize(ascent:)
      @ascent = ascent
    end

    def call
      calculate_user_total_points
    end

    private
    def calculate_user_total_points
      @ascent.user.total_points += @ascent.points
      @ascent.user.save!
    end
  end
end
