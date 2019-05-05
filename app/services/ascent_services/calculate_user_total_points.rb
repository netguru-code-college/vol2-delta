module AscentServices
  class CalculateUserTotalPoints < ApplicationService
    def call(ascent:)
      @ascent = ascent
      
      calculate_user_total_points
    end

    private

    attr_reader :ascent

    def calculate_user_total_points
      ascent.user.total_points += ascent.points
      ascent.user.save
    end
  end
end
