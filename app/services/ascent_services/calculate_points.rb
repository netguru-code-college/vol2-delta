module AscentServices
  class CalculatePoints < ApplicationService
    def call(ascent:)
      @ascent = ascent
      
      calculate_points
    end

    private

    attr_reader :ascent

    def calculate_points
      ascent.points = ascent.climbing_route.route_grade.points + ascent.ascent_style.points
    end
  end
end
