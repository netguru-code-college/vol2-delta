module AscentServices
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
      @ascent.user.save
    end
  end
end
