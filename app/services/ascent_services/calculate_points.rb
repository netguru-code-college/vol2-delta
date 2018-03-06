module AscentServices
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
end
